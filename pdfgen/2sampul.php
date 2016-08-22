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
	
	$q = "SELECT * FROM ep_sampul_2s1 WHERE tender_id = $_GET[tender_id] ORDER BY sampul_id";
	$res = $conn->query($q); $i = 0;
	while($ts = $conn->fetchArray($res)) {
		foreach($ts as $key => $value) {
			if($key == "vendor_id") {
				$items[$i][vendor_name] = getVendorNameById($value);
			}
			$items[$i][$key] = $value;
		}
		$items[$i][got_vendor] = 1;
		$i++;
	}
	
	$conn->close();
?>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallText" id="sampul2">
              <tr>
                <td class="yellowBg padding5"><h2>BERITA ACARA PEMBUKAAN SAMPUL I (ADMINISTRASI &amp; TEKNIS)</h2></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" valign="middle">Hari/Tanggal</td>
                    <td width="2%" valign="middle"><div align="center">:</div></td>
                    <td width="42%" valign="middle"><?= $items[0][sampul_hrtgl] ?></td>
                    <td width="18%" valign="middle">Halaman</td>
                    <td width="1%" valign="middle"><div align="center">:</div></td>
                    <td width="18%" valign="middle"><strong>1 dari 1</strong></td>
                  </tr>
                  <tr>
                    <td valign="middle">Waktu</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $items[0][sampul_waktu] ?></td>
                    <td valign="middle">Tanggal Cetak</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $items[0][sampul_tglcetak] ?></td>
                  </tr>
                  <tr>
                    <td valign="middle">Tempat</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $items[0][sampul_tempat] ?></td>
                    <td valign="middle">&nbsp;</td>
                    <td valign="middle"><div align="center"></div></td>
                    <td valign="middle">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" valign="middle">Collective No.</td>
                    <td width="2%" valign="middle"><div align="center">:</div></td>
                    <td width="79%" valign="middle"><?= $items[0][sampul_collective_no] ?></td>
                  </tr>
                  <tr>
                    <td valign="middle">Pekerjaan/Pengadaan</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><?= $tender[req_purpose] ?></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="44%">&nbsp;</td>
                    <td width="16%">&nbsp;</td>
                    <td width="21%">Jumlah rekanan diundang</td>
                    <td width="1%"><div align="center">:</div></td>
                    <td width="18%"><?= count($items) ?></td>
                  </tr>
                  <tr>
                    <td>Hasil Kelengkapan Administrasi &amp; Teknis dituangkan dalam tabel ini</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran masuk</td>
                    <td><div align="center">:</div></td>
                    <td><?= $items[0][sampul_incoming_bids] ?></td>
                  </tr>
                  <tr>
                    <td>Demikian Berita Acara ini dibuat untuk bahan proses selanjutnya</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran yang lengkap</td>
                    <td><div align="center">:</div></td>
                    <td><?= $items[0][sampul_full_bids] ?></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder">
                  <tr>
                    <td width="3%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>No.</strong></div></td>
                    <td width="34%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>Dokumen Sampul 1</strong></div></td>
                    <?php for($i=0; $i<9; $i++) { if($i != 8) { ?>
                    <td width="7%" valign="top" class="rightBorder bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"><?= $items[$i][vendor_name] ?></div></td>
                    <?php } else { ?>
                    <td width="7%" valign="top" class="bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"><?= $items[$i][vendor_name] ?></div></td>
                    <?php } } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder">&nbsp;</td>
                    <td valign="top" class="padding5 rightBorder bottomBorder">KELENGKAPAN ADMINISTRASI</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[0][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[1][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[2][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[3][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[4][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[5][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[6][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder<?php if($items[7][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                    <td valign="top" class="bottomBorder<?php if($items[8][got_vendor] == 0) { ?> disabledRow<?php } ?>">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">1</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Sampul tertutup dilak pada 5 tempat</td>
                    <?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_lak5] == 1) { ?>
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
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[0][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[1][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[2][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[3][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[4][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[5][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[6][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[7][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="bottomBorder<?php if($items[8][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
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
                    <td valign="top" class="rightBorder bottomBorder">- Jangka waktu pelaksanaan (180 hari)</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_jangka_waktu] == 1) { ?>
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
                    <td valign="top" class="rightBorder bottomBorder">Akte perusahaan</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_akte] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Copy perjanjian Konsorsium (bila ada)</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_konsorsium] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Copy Rekening Koran 3 (tiga) bulan terakhir</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_rek_koran] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">6</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Referensi Bank menunjuk pekerjaan</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_ref_bank] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="padding5 rightBorder bottomBorder">KELENGKAPAN TEKNIS</td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[0][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[1][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[2][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[3][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[4][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[5][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[6][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder<?php if($items[7][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                    <td valign="middle" class="bottomBorder<?php if($items[8][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center"></div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">1</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat pernyataan bahwa unit yang akan disupply dalam keadaan standby, kondisi baru atau zero hour serta asal/lokasi unit</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_sp] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">2</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat Dukungan dari Packager atau Principle/MFR baik untuk peralatan dan Maintenence</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_dukungan] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Daftar spesifikasi peralatan</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_spek] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Daftar Material dominan</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_material] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Curriculum Vitae dan Sertifikat Tenaga Kerja/Ahli</td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <?php if($items[$i][sampul_cv] == 1) { ?>
					  <input type="checkbox" disabled="disabled" checked="checked" value="1" id="checkbox">
					  <?php } else { ?>
                      <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  <?php } } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="padding10 rightBorder bottomBorder"><div align="center">KETERANGAN</div></td>
					<?php for($i=0; $i<9; $i++) { ?>
                    <td valign="middle" class="<?php if($i != 8) { ?>rightBorder <?php } ?>bottomBorder<?php if($items[$i][got_vendor] == 0) { ?> disabledRow<?php } ?>"><div align="center">
					  <?php if($items[$i][got_vendor]) { ?>
					  <textarea disabled="disabled" cols="4" rows="5"><?= $items[$i][sampul_keterangan] ?></textarea>
					  <?php } ?>
                    </div></td>
                    <?php } ?>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder" id="s2panitia">
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
                    <td width="7%" valign="top" class="rightBorder bottomBorder"><div align="center">Tenaga Ahli</div></td>
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
                    <td valign="top" class="rightBorder">&nbsp; </td>
                    <td valign="top" class="rightBorder">&nbsp; </td>
                    <td valign="top" class="rightBorder">&nbsp; </td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="top" class="rightBorder">&nbsp;</td>
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
                    <td valign="middle" class="rightBorder">&nbsp;</td>
                    <td valign="middle">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <?= $items[0][sampul_panitia_ketua] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
						<?= $items[0][sampul_panitia_sekretaris] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
						<?= $items[0][sampul_panitia_keuangan] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
						<?= $items[0][sampul_panitia_hukum] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
						<?= $items[0][sampul_panitia_user] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
						<?= $items[0][sampul_panitia_proc] ?>
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
						<?= $items[0][sampul_panitia_ahli] ?>
                    </div></td>
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
                </table>
                </td>
              </tr>
  </table>
</body>
</html>