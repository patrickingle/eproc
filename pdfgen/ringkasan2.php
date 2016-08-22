<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Ringkasan II</title>
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
			$ssmp[$i][panitia_ketua] = $sampul[0][$i][sampul_panitia_ketua_nama];
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
			$ssmp[$i][panitia_ketua] = $sampul[0][$i][sampul_panitia_ketua];
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
	
	$q = "SELECT vendor_id FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
	$vv = $conn->fetchObject($conn->query($q));
	$winner[vendor_id] = $vv->vendor_id;
	$winner[vendor_name] = getVendorNameById($winner[vendor_id]);
	if($_GET[tender_type] == 3 || $_GET[tender_type] == 5 || $_GET[tender_type] == 8) {
		$q = "SELECT sampul_harga_penawaran FROM ep_sampul_1s WHERE " .
			 "tender_id = $_GET[tender_id] AND vendor_id = $winner[vendor_id] LIMIT 1";
		$rrr = $conn->fetchObject($conn->query($q));
		$winner[harga_penawaran] = numberFormat($rrr->sampul_harga_penawaran);
	}
	else if($_GET[tender_type] == 4) {
		$q = "SELECT sampul_total_harga FROM ep_sampul_2s2 WHERE " .
			 "tender_id = $_GET[tender_id] AND vendor_id = $winner[vendor_id] LIMIT 1";
		$rrr = $conn->fetchObject($conn->query($q));
		$winner[harga_penawaran] = numberFormat($rrr->sampul_total_harga);
	}
	$q = "SELECT rfq_delivery_time FROM ep_tender_rfq WHERE " .
		 "tender_id = $_GET[tender_id] AND vendor_id = $winner[vendor_id] LIMIT 1";
	$vvv = $conn->fetchObject($conn->query($q));
	$winner[delivery_time] = $vvv->rfq_delivery_time;
	
	$tender_parent = getTenderTypeById(getTenderTypeParentById($_GET[tender_type]));
	$tender_desc = getTenderTypeById($_GET[tender_type]);
?>
<body style="background: none;">
<div align="center"><h2>RINGKASAN PELAKSANAAN PENGADAAN</h2></div>
	<p>&nbsp;</p>
	<div align="left">
	<p><strong>III. DATA PENGADAAN (Lanjutan)</strong></p>
	<p class="padding5">
<table border="0" cellpadding="0" cellspacing="0" class="rfqTable smallText" width="600">
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder topBorder bottomBorder">6.</td>
		  <td colspan="7" valign="middle" class="rightBorder bottomBorder topBorder">
		  	Penilaian Administrasi &amp; Teknis		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder"></td>
		  <td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">Perusahaan</div></td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder"><div align="center">Administrasi &amp; Teknis<br />
		  Memenuhi atau Tidak</div></td>
		  <td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">Harga<br />
		  Memenuhi atau Tidak</div></td>
	  </tr>
	  <?php $i=0; while($i<count($vendors)) { ?>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder<?php if ($i+1 == count($vendors)) { ?> bottomBorder<?php } ?>"></td>
		  <td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $vendors[$i][vendor_name] ?></div></td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder"><div align="center">
		  	<?php if ($ringsatu[$i][doc_administrasi] == 1) { ?>Memenuhi<?php } else { ?>Tidak Memenuhi<?php } ?>
		  </div></td>
		  <td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">
		  	<?php if ($ringsatu[$i][doc_harga] == 1) { ?>Memenuhi<?php } else { ?>Tidak Memenuhi<?php } ?>
		  </div></td>
	  </tr>
	  <?php $i++; } ?>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">7.</td>
		  <td colspan="2" valign="top" class="rightBorder bottomBorder">
		  	Penjelasan untuk masing-masing perusahaan apabila penawaran tidak memenuhi syarat		  </td>
		  <td colspan="5" valign="middle" class="rightBorder bottomBorder">
		  	<?= $ringsatu[0][doc_penjelasan] ?>		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder">8.</td>
		  <td colspan="7" valign="top" class="rightBorder bottomBorder">
		  	Harga Penawaran pada Pembukaan Penawaran &amp; setelah Klarifikasi Teknis		  </td>
	  </tr>
	  <tr>
	  	<td valign="middle" class="leftBorder rightBorder">&nbsp;</td>
		<td width="187" valign="middle" class="rightBorder bottomBorder"><div align="center">No.</div></td>
		<td width="188" valign="middle" class="rightBorder bottomBorder"><div align="center">Perusahaan</div></td>
		<td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">Harga (<?= getQuoteCurrency($_GET[tender_id]) ?>)<br />
		  Sesuai Penawaran<br />
		  (tidak termasuk PPN)
</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">Delivery Time </div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">Ditandatangani oleh Berwenang (Ya/Tidak) </div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">Masa Berlaku Penawaran (Ya/Tidak) </div></td>
	  </tr>
	  <?php $i=0; while($i < count($vendors)) { ?>
	  <tr>
	  	<td valign="middle" class="leftBorder rightBorder<?php if ($i+1 == count($vendors)) { ?> bottomBorder<?php } ?>">&nbsp;</td>
		<td width="187" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $i+1 ?></div></td>
		<td width="188" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $vendors[$i][vendor_name] ?></div></td>
		<td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?php if($vendors[$i][vendor_id] == $winner[vendor_id]) { echo $winner[harga_penawaran]; }?>
		</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?= $rfq[$i][rfq_delivery_time] ?>
		</div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?php if ($ringsatu[$i][doc_tdtgn_berwenang] == 1) { ?>Ya<?php } else { ?>Tidak<?php } ?>
		</div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?php if ($ringsatu[$i][doc_masa_berlaku] == 1) { ?>Ya<?php } else { ?>Tidak<?php } ?>
		</div></td>
	  </tr>
	  <?php $i++; } ?>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">9.</td>
		  <td colspan="4" valign="top" class="bottomBorder">
		  	Harga terendah yang sah dan memenuhi syarat		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<?= $winner[harga_penawaran] ?>		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">10.</td>
		  <td colspan="4" valign="top" class="bottomBorder">
		  	Harga tertinggi yang sah dan memenuhi syarat		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<?= numberFormat($ringsatu[0][doc_harga_tertinggi]) ?>		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder">11.</td>
		  <td colspan="7" valign="top" class="rightBorder bottomBorder">
		  	Evaluasi Penawaran setelah negosiasi harga		  </td>
	  </tr>
	  <tr>
	    <td valign="middle" class="leftBorder rightBorder">&nbsp;</td>
	    <td valign="middle" class="bottomBorder">&nbsp;</td>
	    <td valign="middle" class="rightBorder bottomBorder">&nbsp;</td>
	    <td colspan="4" valign="middle" class="rightBorder bottomBorder"><div align="center">Penawaran</div></td>
	    <td valign="middle" class="rightBorder bottomBorder">&nbsp;</td>
    </tr>
	  <tr>
	  	<td valign="middle" class="leftBorder rightBorder">&nbsp;</td>
		<td width="187" valign="middle" class="rightBorder bottomBorder"><div align="center">No.</div></td>
		<td width="188" valign="middle" class="rightBorder bottomBorder"><div align="center">Perusahaan</div></td>
		<td width="190" valign="middle" class="rightBorder bottomBorder"><div align="center">Nilai (<?= getQuoteCurrency($_GET[tender_id]) ?>) Semula tidak termasuk PPN
</div></td>
		<td width="135" valign="middle" class="rightBorder bottomBorder"><div align="center">Delivery Time</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">Nilai (<?= getQuoteCurrency($_GET[tender_id]) ?>) Menjadi tidak termasuk PPN</div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">Delivery Time</div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">Ranking</div></td>
	  </tr>
	  <tr>
	  	<td valign="middle" class="leftBorder rightBorder bottomBorder">&nbsp;</td>
		<td width="187" valign="middle" class="rightBorder bottomBorder"><div align="center">1</div></td>
		<td width="188" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $winner[vendor_name] ?></div></td>
		<td width="190" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $winner[harga_penawaran] ?></div></td>
		<td width="135" valign="middle" class="rightBorder bottomBorder"><div align="center"><?= $winner[delivery_time] ?></div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?= numberFormat($ringsatu[0][doc_harga_penawaran_menjadi]) ?>
		</div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?= $ringsatu[0][doc_delivery_time_menjadi] ?>
		</div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<?= $ringsatu[0][doc_peringkat] ?>
		</div></td>
    </tr>
	   <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">12.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Harga terendah yang sah setelah negosiasi
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder"><?= getQuoteCurrency($_GET[tender_id]) ?> <?= numberFormat($ringsatu[0][doc_harga_penawaran_menjadi]) ?>		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">13.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Perusahaan yang diusulkan
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<?= strtoupper($winner[vendor_name]) ?>
		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">14.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Harga usulan
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
			<?= numberFormat($ringsatu[0][doc_harga_usulan]) ?>
		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">15.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Jangka waktu pelaksanaan/Delivery Time
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder"><?= $ringsatu[0][doc_delivery_time_menjadi] ?></td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">16.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Alasan yang jelas untuk perusahaan yang diusulkan (baik secara teknis maupun ekonomis)
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<?= $ringsatu[0][doc_alasan_usulan] ?>
		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">17.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Keterangan lain
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<?= $ringsatu[0][doc_keterangan_lain] ?>
		  </td>
	  </tr>
	</table>
	<p>&nbsp;</p>
	<table border="0" width="600" cellpadding="0" cellspacing="0" class="smallText">
		  <td width="50%" valign="top">&nbsp;</td>
		  <td width="50%" valign="top">Jakarta, <?= date("d M Y", mktime()); ?></td>
	      <tr>
	        <td valign="top">&nbsp;</td>
	        <td valign="top">&nbsp;</td>
      <tr>
        <td valign="top">Menyetujui/Tidak Menyetujui </td>
        <td valign="top">Panitia Pengadaan Barang </td>
      <tr>
	          <td valign="top">Direktur Utama, </td>
	          <td valign="top">Ketua,</td>
      <tr>
	            <td valign="top">&nbsp;</td>
	            <td valign="top">&nbsp;</td>
      <tr>
	              <td valign="top">&nbsp;</td>
	              <td valign="top">&nbsp;</td>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
      <tr>
        <td valign="top">&nbsp;</td>
        <td valign="top">&nbsp;</td>
      <tr>
	                <td valign="top">&nbsp;</td>
	                <td valign="top">&nbsp;</td>
      <tr>
	                  <td valign="top">
					  	<?= $ringsatu[0][doc_direktur_utama] ?>
					  </td>
	                  <td valign="top"><?= $ssmp[0][panitia_ketua] ?></td></tr>
    </table>
	</p>
</body>
</html>
