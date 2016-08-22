<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Ringkasan 1</title>
<link href="/themes/default/style.css" rel="stylesheet" type="text/css">
<link href="/themes/default/pdf.css" rel="stylesheet" type="text/css">
</head>
<?php
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	$conn = new DbConnector();
	
	$q = "SELECT * FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
	$tender = $conn->fetchArray($conn->query($q));
	
	$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id] ORDER BY item_id";
	$res = $conn->query($q);
	$tval = 0; $i = 0;
	while($it = $conn->fetchArray($res)) {
		foreach($it as $key => $value) {
			$items[$i][$key] = $value;
			if($key == "req_est_price") {
				$tval += $value;
			}
		}
		$i++;
	}
	
	$q = "SELECT * FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id DESC";
	$res = $conn->query($q); $i = 0;
	while($rr = $conn->fetchArray($res)) {
		foreach($rr as $key => $value) {
			$rfq[$i][$key] = $value;
			if($key == "vendor_id") {
				$rfq[$i][vendor_name] = getVendorNameById($value);
				$rfq[$i][vendor_npwp] = getNpwpById($value);
				$vendors[$i][vendor_id] = $rfq[$i][vendor_id];
				$vendors[$i][vendor_npwp] = $rfq[$i][vendor_npwp];
				$vendors[$i][vendor_name] = $rfq[$i][vendor_name];
			}
		}
		$i++;
	}
	
	if($_GET[tender_type] == 3) {
		$table[0] = "ep_sampul_1s";
	}
	else if($_GET[tender_type] == 4) {
		$table[0] = "ep_sampul_2s1";
		$table[1] = "ep_sampul_2s2";
	}
	else if($_GET[tender_type] == 6) {
		$table[0] = false;
	}
	if($table[0] != false) { 
		$j = 0;
		for($i=0; $i<count($table); $i++) {
			$q = "SELECT * FROM $table[$i] WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id DESC";
			$res = $conn->query($q);
			while($smp = $conn->fetchArray($res)) {
				foreach($smp as $key => $value) {
					$sampul[$i][$j][$key] = $value;
				}
				$j++;
			}
			$j = 0;
		}
	}
	for($i=0; $i<count($sampul[0]); $i++) {
		if(count($table) == 1) {
			$ssmp[$i][vendor_id] = $sampul[0][$i][vendor_id];
			$ssmp[$i][akte] = $sampul[0][$i][sampul_akte_pendirian];
			$ssmp[$i][ref_bank] = $sampul[0][$i][sampul_ref_bank];
			$ssmp[$i][bid_bond] = $sampul[0][$i][sampul_nilai_penawaran];
			if(is_rfqed($_GET[tender_id])) {
				$ssmp[$i][rfq] = 1;
			}
			$ssmp[$i][spek_teknis] = $sampul[0][$i][sampul_ulasan_teknis];
		}
		else if(count($table) == 2) {
			$ssmp[$i][vendor_id] = $sampul[0][$i][vendor_id];
			$ssmp[$i][akte] = $sampul[0][$i][sampul_akte];
			$ssmp[$i][ref_bank] = $sampul[0][$i][sampul_ref_bank];
			$ssmp[$i][bid_bond] = $sampul[1][$i][sampul_nilai];
			if(is_rfqed($_GET[tender_id])) {
				$ssmp[$i][rfq] = 1;
			}
			$ssmp[$i][spek_teknis] = $sampul[0][$i][sampul_spek];
		}
	}

	$q = "SELECT * FROM ep_ringkasan1 WHERE tender_id = $_GET[tender_id] AND " .
		 "tender_type = $_GET[tender_type] ORDER BY vendor_id DESC";
	$res = $conn->query($q); $i = 0;
	if($conn->counter($res) > 0) {
		while($rin = $conn->fetchArray($res)) {
			foreach($rin as $key => $value) {
				$ringsatu[$i][$key] = $value;
			}
			$i++;
		}
	}
	
	$tender_parent = getTenderTypeById(getTenderTypeParentById($_GET[tender_type]));
	$tender_desc = getTenderTypeById($_GET[tender_type]);
?>
<body style="background: none;">
	<div align="center"><h2>RINGKASAN PELAKSANAAN PENGADAAN</h2></div>
	<p>&nbsp;</p>
	<div align="left">
	<p><strong>I. DATA PRA PENGADAAN</strong></p>
	<p class="padding5">
	  <table border="0" cellpadding="0" cellspacing="0" class="rfqTable smallText" width="600">
				<tr>
					<td width="18" valign="top" class="rightBorder topBorder leftBorder bottomBorder">1.</td>
					<td width="250" valign="top" class="rightBorder topBorder bottomBorder">Nama Proyek</td>
					<td width="332" valign="top" class="rightBorder topBorder bottomBorder"><?= $tender[req_purpose] ?></td>
				</tr>
				<tr>
					<td width="18" valign="top" class="rightBorder leftBorder bottomBorder">2.</td>
					<td width="250" valign="top" class="rightBorder bottomBorder">No. Lelang/Bid</td>
					<td width="332" valign="top" class="rightBorder bottomBorder">
					<?= $ringsatu[0][doc_no_lelang] ?>
					</td>
				</tr>
				<tr>
					<td width="18" valign="top" class="rightBorder leftBorder bottomBorder">3.</td>
					<td width="250" valign="top" class="rightBorder bottomBorder">Harga Perkiraan Sendiri (HPS)/Engineers Estimate (EE)/Owner Estimate (OE) Rincian Terlampir</td>
					<td width="332" valign="top" class="rightBorder bottomBorder">
						IDR <?= numberFormat($tval) ?>
					</td>
				</tr>
				<tr>
					<td width="18" valign="top" class="rightBorder leftBorder bottomBorder">2.</td>
					<td width="250" valign="top" class="rightBorder bottomBorder">
						Jangka waktu pelaksanaan/periode kontrak/penyerahan barang
					</td>
					<td width="332" valign="top" class="rightBorder bottomBorder">
						<?= $rfq[0][rfq_delivery_time] ?>
					</td>
				</tr>
  </table>
		</p>
		<p>&nbsp;</p>
		<p><strong>II. KRONOLOGI PENGADAAN</strong></p>
		<p class="padding5">
  <table border="0" cellpadding="0" cellspacing="0" class="rfqTable smallText" width="600">
	  <tr>
		  <td colspan="2" valign="top" class="rightBorder">&nbsp;</td>
		  <td width="166" align="center" valign="top" class="rightBorder topBorder">Lelang</td>
		  <td width="166" align="center" valign="top" class="rightBorder topBorder">Lelang Ulang</td>
	  </tr>
	  <tr>
		  <td width="12" valign="top" class="rightBorder topBorder leftBorder bottomBorder">1.</td>
		  <td width="320" valign="top" class="rightBorder topBorder bottomBorder">Pelelangan Umum/Terbatas</td>
		  <td valign="top" class="rightBorder topBorder bottomBorder"><?php if ($_GET[lelang] == 1) { ?><?= $tender_desc ?><?php } ?></td>
		  <td valign="top" class="rightBorder topBorder bottomBorder"><?php if ($_GET[lelang] == 2) { ?><?= $tender_desc ?><?php } ?></td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">2.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tata cara pemasukan dokumen lelang (satu sampul/dua sampul/dua tahap)</td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if ($_GET[lelang] == 1) { ?><?= $tender_parent ?><?php } ?></td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if ($_GET[lelang] == 2) { ?><?= $tender_parent ?><?php } ?></td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">3.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tanggal Undangan (RFQ)</td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if ($_GET[lelang] == 1) { ?><?= date("d M Y", $rfq[0][rfq_created_date]) ?><?php } ?></td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if ($_GET[lelang] == 2) { ?><?= date("d M Y", $rfq[0][rfq_created_date]) ?><?php } ?></td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">4.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tanggal Pengambilan Dokumen Lelang</td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if ($_GET[lelang] == 1) { ?><?= date("d M Y", $ringsatu[0][doc_ambil_dok_lelang]) ?><?php } ?></td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if ($_GET[lelang] == 2) { ?>
		  <?= date("d M Y", $ringsatu[0][doc_ambil_dok_lelang]) ?> 
		  <?php } ?></td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">5.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tanggal Penutupan/Pembukaan Lelang</td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if($_GET[lelang] == 1) { ?>
		  <?= date("d M Y", $ringsatu[0][doc_tutup_lelang]) ?>
		  <?php } ?></td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if($_GET[lelang] == 2) { ?>
		  <?= date("d M Y", $ringsatu[0][doc_tutup_lelang]) ?>
		  <?php } ?></td>
	  </tr>
	  <tr>
		  <td rowspan="2" valign="top" class="rightBorder leftBorder bottomBorder">6.</td>
		  <td valign="top" class="rightBorder bottomBorder">a. Dalam hal sebagai pelelangan ulang, sebutkan alasan pelelangan gagal </td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if($_GET[lelang] == 1) { ?>
		  <?= $ringsatu[0][doc_alasan_batal] ?>
		  <?php } ?></td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if($_GET[lelang] == 2) { ?>
		  <?= $ringsatu[0][doc_alasan_batal] ?>
		  <?php } ?></td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder bottomBorder">b. Tanggal pemberitahuan lelang batal/gagal kepada perusahaan yang mengajukan penawaran </td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if($_GET[lelang] == 1) { ?>
		  <?= date("d M Y", $ringsatu[0][doc_batal_lelang]) ?>
		  <?php } ?></td>
		  <td valign="top" class="rightBorder bottomBorder"><?php if($_GET[lelang] == 2) { ?>
		  <?= date("d M Y", $ringsatu[0][doc_batal_lelang]) ?>
		  <?php } ?></td>
	  </tr>
	</table>
		</p>
	</p>
	<p>&nbsp;</p>
		<p><strong>III. DATA PENGADAAN</strong></p>
		<p class="padding5">
  <table border="0" cellpadding="0" cellspacing="0" class="rfqTable smallText" width="600">
	  <tr>
		  <td width="12" valign="top" class="topBorder leftBorder rightBorder">1.</td>
					<td width="24" rowspan="2" valign="middle" class="topBorder rightBorder bottomBorder"><div align="center">No.</div></td>
					<td width="179" rowspan="2" valign="middle" class="topBorder rightBorder bottomBorder"><div align="center">Perusahaan yang diundang </div></td>
					<td width="91" rowspan="2" valign="middle" class="topBorder rightBorder bottomBorder"><div align="center">Perusahaan yang mengambil dokumen </div></td>
					<td width="73" rowspan="2" valign="middle" class="topBorder rightBorder bottomBorder"><div align="center">Perusahaan yang mengajukan penawaran </div></td>
					<td width="73" rowspan="2" valign="middle" class="topBorder rightBorder bottomBorder"><div align="center">Perusahaan yang tidak mengajukan penawaran </div></td>
					<td colspan="2" valign="middle" class="topBorder rightBorder bottomBorder"><div align="center">Mengikuti</div>					  <div align="center"></div></td>
	</tr>
				<tr>
		  			<td width="12" valign="top" class="leftBorder rightBorder"></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">Rapat pra lelang tgl. </div></td>
					<td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">Peninjauan lapangan tgl. </div></td>
				</tr>
				<?php for($i=0; $i<count($rfq); $i++) { ?>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= $i+1 ?>
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= strtoupper($vendors[$i][vendor_name]); ?>
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_vendor_fetch_doc] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_vendor_bid] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_vendor_no_bid] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= date("d M Y", $ringsatu[$i][doc_rapat_pra]); ?>
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= date("d M Y", $ringsatu[$i][doc_tinjau_pra]); ?>
					</div></td>
				</tr>
				<?php } ?>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">Jumlah
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $total_vendors ?>
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center"></div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center"></div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center"></div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center"></div></td>
					<td valign="middle" class="rightBorder bottomBorder"></td>
				</tr>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder">2.</td>
					<td colspan="7" valign="middle" class="rightBorder bottomBorder">
					Kelengkapan Dokumen pada Pembukaan Penawaran (Berita Acara Pembukaan Penawaran dilampirkan)					</td>
				</tr>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder">&nbsp;</td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					No.
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Perusahaan
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Surat Pengantar &amp; Rincian Penawaran Harga
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Akte
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Ref Bank
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					BID BOND
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					RFQ
					</div></td>
				</tr>
				<?php for($i=0; $i<count($rfq); $i++) { ?>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder<?php if ($i+1 == $total_vendors) { ?> bottomBorder<?php } ?>"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= $i+1 ?>
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= strtoupper($vendors[$i][vendor_name]) ?>
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_surat_pengantar] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ssmp[$i][akte] == 1)  { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ssmp[$i][ref_bank] == 1)  { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ssmp[$i][bid_bond] > 0)  { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ssmp[$i][rfq] == 1)  { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
				</tr>
				<?php } ?>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder">&nbsp;</td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					No.
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					NPWP No.
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Delivery Time &amp; Validity Price
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Surat Jaminan
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					Copy API 5L
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					Spek Teknis
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					Keterangan
					</div></td>
				</tr>
				<?php for($i=0; $i<count($rfq); $i++) { ?>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder<?php if ($i+1 == $total_vendors) { ?> bottomBorder<?php } ?>"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= $i+1 ?>
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?= $vendors[$i][vendor_npwp] ?>
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_delivery_time] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_surat_jaminan] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_copy_api] == 1) { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ssmp[$i][spek_teknis] == 1)  { ?>
					<input type="checkbox" checked="checked" value="1" />
					<?php } else { ?>
					<input type="checkbox" value="1" />
					<?php } ?>
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<?php if ($ringsatu[$i][doc_keterangan] == 1) { ?>Lengkap
					<?php } else if ($ringsatu[$i][doc_keterangan] == 0) { ?>Tidak Lengkap<?php } ?>
					</div></td>
				</tr>
				<?php } ?>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder">3.</td>
					<td colspan="3" valign="middle" class="rightBorder bottomBorder">
					Jumlah penawar yang lengkap					</td>
					<td colspan="4" valign="middle" class="rightBorder bottomBorder">
					<?= $ringsatu[0][doc_penawar_lengkap] ?>
					</td>
				</tr>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder">4.</td>
					<td colspan="3" valign="middle" class="rightBorder bottomBorder">
					Jumlah penawar yang tidak lengkap					</td>
					<td colspan="4" valign="middle" class="rightBorder bottomBorder">
					<?= $ringsatu[0][doc_penawar_tdk_lengkap] ?>
					</td>
				</tr>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder">5.</td>
					<td colspan="3" valign="top" class="rightBorder bottomBorder">
					Alasan bagi penawaran yang diklarifikasi					</td>
					<td colspan="4" valign="middle" class="rightBorder bottomBorder">
					<?= $ringsatu[0][doc_penawar_klarifikasi] ?>
					</td>
				</tr>
				<tr>
					<td colspan="8" valign="top" align="center">
					</td>
				</tr>
	  </table>
		</p></div>
</body>
</html>
<?php $conn->close(); ?>