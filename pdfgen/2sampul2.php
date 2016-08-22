<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="/themes/default/style.css" rel="stylesheet" type="text/css">
<link href="/themes/default/pdf.css" rel="stylesheet" type="text/css">
</head>
<body style="background: none; font-size: 11pt">
<?php
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	$conn = new DbConnector();
	
	$q = "SELECT * FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
	$r = $conn->fetchArray($conn->query($q));
	foreach($r as $key => $value) {
		if($key == 'req_type') { $value = strtoupper($value); }
		if($key == 'user_id') { $value = getFullNameByIdDiv($value); }
		$tender[$key] = $value;
	}
	
	$q = "SELECT * FROM ep_sampul_2s2 WHERE tender_id = $_GET[tender_id] ORDER BY sampul_id";
	$res = $conn->query($q); $i = 0;
	while($ts = $conn->fetchArray($res)) {
		foreach($ts as $key => $value) {
			if($key == "vendor_id") {
				$items[$i][vendor_name] = getVendorNameById($value);
			}
			$items[$i][$key] = $value;
			if($key == "sampul_total_harga") {
				$items[$i][$key] = numberFormat($value);
			}
		}
		$items[$i][got_vendor] = 1;
		$i++;
	}
	
	for($k=0; $k<$i; $k++) {
		$vendid = $items[$k][vendor_id];
		$q = "SELECT quo_currency FROM op_quotations WHERE tender_id = $_GET[tender_id] " .
			 "AND vendor_id = $vendid ORDER BY vendor_id";
		$rt = $conn->query($q); $i = 0;
		while($qq = $conn->fetchArray($rt)) {
			$quo[0][quo_currency] = $qq[quo_currency];
		}
	}
	
	$q = "SELECT * FROM ep_sampul_2s1 WHERE tender_id = $_GET[tender_id] ORDER BY sampul_id LIMIT 1";
	$res = $conn->query($q); $i = 0;
	while($ts = $conn->fetchArray($res)) {
		foreach($ts as $key => $value) {
			$smp[$i][$key] = $value;
		}
		$smp[$i][got_vendor] = 1;
		$i++;
	}
	
	$conn->close();
?>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallText" id="sampul2">
              <tr>
                <td width="82%" class="yellowBg padding5"><h2>BERITA ACARA PEMBUKAAN SAMPUL II (HARGA)</h2></td>
                <td width="18%" class="yellowBg padding5">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" valign="middle">Hari/Tanggal</td>
                    <td width="2%" valign="middle"><div align="center">:</div></td>
                    <td width="42%" valign="middle"><?= $smp[0][sampul_hrtgl] ?></td>
                    <td width="18%" valign="middle">Halaman</td>
                    <td width="1%" valign="middle"><div align="center">:</div></td>
                    <td width="18%" valign="middle"><strong>1 dari 1</strong></td>
                  </tr>
                  <tr>
                    <td valign="middle">Waktu</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $smp[0][sampul_waktu] ?></td>
                    <td valign="middle">Tanggal Cetak</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $smp[0][sampul_tglcetak] ?></td>
                  </tr>
                  <tr>
                    <td valign="middle">Tempat</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $smp[0][sampul_tempat] ?></td>
                    <td valign="middle">&nbsp;</td>
                    <td valign="middle"><div align="center"></div></td>
                    <td valign="middle">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" valign="middle">Collective No.</td>
                    <td width="2%" valign="middle"><div align="center">:</div></td>
                    <td width="79%" valign="middle"><?= $smp[0][sampul_collective_no] ?></td>
                  </tr>
                  <tr>
                    <td valign="middle">Pekerjaan/Pengadaan</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $tender[req_purpose] ?></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="44%">&nbsp;</td>
                    <td width="16%">&nbsp;</td>
                    <td width="21%">Jumlah rekanan Lulus Sampul I</td>
                    <td width="1%"><div align="center">:</div></td>
                    <td width="18%"><?= $items[0][sampul_lulus] ?></td>
                  </tr>
                  <tr>
                    <td>Hasil Kelengkapan Administrasi &amp; Teknis dituangkan dalam tabel ini</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran Sampul II</td>
                    <td><div align="center">:</div></td>
                    <td><?= $items[0][sampul_incoming_bids] ?></td>
                  </tr>
                  <tr>
                    <td>Demikian Berita Acara ini dibuat untuk bahan proses selanjutnya</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran yang sah</td>
                    <td><div align="center">:</div></td>
                    <td><?= $items[0][sampul_full_bids] ?></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2" class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder">
                  <tr>
                    <td width="3%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>No.</strong></div></td>
                    <td width="34%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>Dokumen Sampul 2</strong></div></td>
                    <?php for($i=0; $i<9; $i++) { if($i != 8) { ?>
                    <td width="7%" valign="top" class="rightBorder bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"><?= $items[$i][vendor_name] ?></div></td>
                    <?php } else { ?>
                    <td width="7%" valign="top" class="bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"><?= $items[$i][vendor_name] ?></div></td>
                    <?php } } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">1</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Sampul Penawaran Tertutup</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_penawaran_tertutup] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">2</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat Penawaran</td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[0][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[1][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[2][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[3][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[4][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[5][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[6][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[7][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="bottomBorder<?php if ($items[8][got_vendor] == 0) { ?> disabledRow<?php } ?>"></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Masa berlaku penawaran (90 hari)</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_berlaku_penawaran] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanda tangan sesuai dengan akte</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_penawaran_tdtgn] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Materai Rp. 6000,-</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_materai] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Cap perusahaan</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_cap] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanggal &amp; nomor surat</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_tgl_nmr_surat] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Total Harga Penawaran Tidak Termasuk PPN 10% (<?= strtoupper($quo[0][quo_currency]) ?>)</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?= $items[$i][sampul_total_harga] ?>
					  <?php } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Perincian Penawaran Harga</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_perincian] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Jaminan Penawaran</td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[0][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[1][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[2][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[3][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[4][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[5][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[6][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if ($items[7][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="bottomBorder<?php if ($items[8][got_vendor] == 0) { ?> disabledRow<?php } ?>"></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Diterbitkan Oleh</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) echo $items[$i][sampul_penerbit] ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Nilai (US$)</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) echo numberFormat($items[$i][sampul_nilai]); ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="rightBorder bottomBorder"><div align="center">PERINGKAT</div></td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) echo $items[$i][sampul_peringkat] ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="padding10 rightBorder bottomBorder"><div align="center">KETERANGAN</div></td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?= $items[$i][sampul_keterangan] ?>
					  <?php } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2" class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder" id="s2panitia">
                  <tr>
                    <td valign="top" width="44%" class="rightBorder"><div align="left"><u>Keterangan:</u></div></td>
                    <td colspan="8" valign="top" class="bottomBorder"><div align="center">PANITIA PELELANGAN PENGADAAN BARANG/JASA</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">- v = ada</td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">Ketua</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">Sekretaris</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">Keuangan</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">Hukum</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">User/Pemakai</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">Procurement</div></td>
                    <td width="7%" valign="top"><div align="center"></div></td>
                    <td width="7%" valign="top"><div align="center"></div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">- x = tidak ada</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp; </td>
                    <td valign="top" class="rightBorder">&nbsp; </td>
                    <td valign="top" class="rightBorder">&nbsp; </td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle">&nbsp;</td>
                    <td valign="middle">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $smp[0][sampul_panitia_ketua] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $smp[0][sampul_panitia_sekretaris] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $smp[0][sampul_panitia_keuangan] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $smp[0][sampul_panitia_hukum] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $smp[0][sampul_panitia_user] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $smp[0][sampul_panitia_proc] ?>
                    </div></td>
                    <td valign="middle" class="bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="bottomBorder">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td colspan="8" valign="top" class="bottomBorder"><div align="center">Penyedia Jasa (yang mewakili) menyetujui Berita Acara ini</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <?php for($i=0; $i<8; $i++) { ?>
                    <td valign="top" class="<?php if($i<7) { ?>rightBorder <?php } ?>bottomBorder"><?= $items[$i][vendor_name] ?></td>
					<?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>

                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                </table>                </td>
              </tr>
</table>
</body>
</html>