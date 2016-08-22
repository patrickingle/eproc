<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><link href="/themes/default/style.css" rel="stylesheet" type="text/css"><link href="/themes/default/pdf.css" rel="stylesheet" type="text/css"></head><body style="background: none;">
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
	
	$q = "SELECT * FROM ep_sampul_1s WHERE tender_id = $_GET[tender_id] ORDER BY sampul_id";
	$res = $conn->query($q); $i = 0;
	while($it = $conn->fetchArray($res)) {
		foreach($it as $key => $value) {
			$items[$i][$key] = $value;
		}
		$i++;
	}
	?>
			<table width="100%" cellpadding="0" cellspacing="0" class="rfqTable" >
            	<tr>
                	<td valign="top" align="center"><strong>BERITA ACARA PEMBUKAAN SAMPUL</strong></td>
                </tr>
                <tr>
                  <td valign="top"><table width="50%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="25%">HARI/TANGGAL</td>
                      <td width="5%"><div align="center">:</div></td>
                      <td width="70%"><?= $items[0][sampul_hrtgl] ?></td>
                    </tr>
                    <tr>
                      <td>WAKTU</td>
                      <td><div align="center">:</div></td>
                      <td><?= $items[0][sampul_waktu] ?></td>
                    </tr>
                    <tr>
                      <td>COLLECTIVE NO.</td>
                      <td><div align="center">:</div></td>
                      <td><?= $items[0][sampul_collective_no] ?></td>
                    </tr>
                    <tr>
                      <td>PEKERJAAN</td>
                      <td><div align="center">:</div></td>
                      <td><?= $tender[req_purpose] ?></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td valign="top" style="padding: 0;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="3%" rowspan="2" valign="top" class="fBorder smallText"><div align="center"><strong>NO</strong></div></td>
                      <td width="16%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>NAMA PERUSAHAAN</strong></div></td>
                      <td width="17%" valign="top" class="rightBorder topBorder smallText"><div align="center"><strong>HARGA PENAWARAN</strong></div></td>
                      <td width="9%" rowspan="2" valign="top" class="smallText rightBorder bottomBorder topBorder"><div align="center"><strong>MATERAI, PENAWARAN DALAM ANGKA &amp; HURUF SAMA</strong></div></td>
                      <td width="10%" rowspan="2" valign="top" class="smallText rightBorder bottomBorder topBorder"><div align="center"><strong>REKAPITULASI DAN RINCIAN HARGA PENAWARAN</strong></div></td>
                      <td colspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>JAMINAN PENAWARAN</strong></div></td>
                      <td width="5%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>ULASAN TEKNIS DAN JADWAL KERJA</strong></div></td>
                      <td width="1%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>NERACA PERUSAHAAN</strong></div></td>
                      <td width="1%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>REFERENSI BANK<br />/TRANSFER PEMBAYARAN</strong></div></td>
                      <td width="1%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>AKTE PENDIRIAN</strong></div></td>
                      <td width="1%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>SETORAN PAJAK (SST/SPT)</strong></div>                        <div align="center"></div></td>
                      <td width="5%" rowspan="2" valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>DAFTAR TENAGA KERJA, PERALATAN KERJA &amp; MATERIAL DOMINAN</strong></div></td>
                      <td width="5%" valign="top" class="rightBorder topBorder smallText"><div align="center"><strong>COPY KONTRAK</strong></div></td>
                      <td width="5%" valign="top" class="topBorder rightBorder smallText"><div align="center"><strong>KESIMPULAN LENGKAP<br />/TIDAK</strong></div></td>
                    </tr>
                    <tr>
                      <td valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>RP</strong></div></td>
                      <td width="11%" valign="top" class="rightBorder bottomBorder smallText"><div align="center"><strong>NILAI</strong></div></td>
                      <td width="10%" valign="top" class="rightBorder bottomBorder smallText"><div align="center"><strong>DITERBITKAN<br />
                      OLEH</strong></div></td>
                      <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                      <td valign="top" class="bottomBorder rightBorder"><div align="center"></div></td>
                    </tr>
                    <!-- VENDORS -->
                    <?php
						for($i=0; $i<count($items); $i++) {
					?>
                    <tr>
                      <td valign="top" class="leftBorder"><div align="center"><?= $i+1 ?></div></td>
                      <td valign="top"><div align="center"><?= getVendorNameById($items[$i][vendor_id]); ?></div></td>
                      <td valign="top"><div align="center">
                      	<?= $items[$i][sampul_harga_penawaran] ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_materai] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_rekapitulasi] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                        <?= $items[$i][sampul_nilai_penawaran] ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?= $items[$i][sampul_penerbit] ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_ulasan_teknis] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_neraca] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_ref_bank] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_akte_pendirian] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_sst] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_tenaker] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top"><div align="center">
                      	<?php if($items[$i][sampul_copy_kontrak] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                      <td valign="top" class="rightBorder"><div align="center">
                      	<?php if($items[$i][sampul_lengkap] == 1) { ?>
                        <input disabled checked="checked" type="checkbox" value="1" />
                        <?php } else { ?>
                        <input disabled type="checkbox" value="1" />
                        <?php } ?>
                      </div></td>
                    </tr>
                    <?php } ?>
                    <!-- END VENDORS -->
                  </table></td>
                </tr>
<tr>
                  <td valign="top" class="topBorder">
                  	&nbsp;<br />KETERANGAN:<br />
                    <pre><?= $items[0][sampul_keterangan] ?></pre>
                  </td>
                </tr>
                <tr>
                  <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                	<td valign="top">
                    	PANITIA PENGADAAN BARANG/JASA:<br />
                        <table width="574" border="0" cellspacing="0" cellpadding="0" class="rfqTable fBorder">
  <tr>
    <td width="5%" class="bottomBorder"><div align="center">NO</div></td>
    <td width="17%" class="bottomBorder"><div align="center">NAMA</div></td>
    <td width="26%" class="bottomBorder"><div align="center">JABATAN</div></td>
    <td width="15%" class="bottomBorder"><div align="center">FUNGSI</div></td>
    <td width="37%" class="bottomBorder"><div align="center">TANDATANGAN</div></td>
  </tr>
  <tr>
    <td><div align="center">1</div></td>
    <td><?= $items[0][sampul_panitia_ketua_nama] ?></td>
    <td><div align="center">KETUA</div></td>
    <td><?= $items[0][sampul_panitia_ketua_fungsi] ?></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">2</div></td>
    <td><?= $items[0][sampul_panitia_sekretaris_nama] ?></td>
    <td><div align="center">SEKRETARIS</div></td>
    <td><?= $items[0][sampul_panitia_sekretaris_fungsi] ?></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">3</div></td>
    <td><?= $items[0][sampul_panitia_user_nama] ?></td>
    <td><div align="center">USER</div></td>
    <td><?= $items[0][sampul_panitia_user_fungsi] ?></td>
    <td>&nbsp;</td>
  </tr>
</table>
                  </td>
                </tr>
            </table>
        <p>&nbsp;</p>
<?php $conn->close(); ?>
</body>
</html>