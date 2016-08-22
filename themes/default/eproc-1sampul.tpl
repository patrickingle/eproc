<div align="right">
{literal}
<script language="javascript">
	function print_to_pdf() {
		html2ps = '{/literal}{$html2ps}{$tender_id}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
</script>
<input type="button" value="Print to PDF" onclick="print_to_pdf()" /> <input type="button" name="nextBtn1" value="NEXT &raquo;" onclick="top.location.href='index.php?mod=eproc&act=penetapan-list'" />
{/literal}
</div>
<form name="sampulFrm" action="{$PHP_SELF}&go=1sampul" method="post">
<table width="100%" cellpadding="0" cellspacing="0" class="rfqTable" >
            	<tr>
                	<td valign="top" align="center"><strong>BERITA ACARA PEMBUKAAN SAMPUL</strong></td>
                </tr>
                <tr>
                  <td valign="top"><table width="50%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="25%">HARI/TANGGAL</td>
                      <td width="5%"><div align="center">:</div></td>
                      <td width="70%"><input type="text" name="sampul_hrtgl" id="sampul_hrtgl" value="{$smp[0].sampul_hrtgl}"{$disabled} /> <img id="cal_req_date1" alt="" src="{$templateDir}/images/cal.png" /></td>
                    </tr>
                    <tr>
                      <td>WAKTU</td>
                      <td><div align="center">:</div></td>
                      <td><input type="text" name="sampul_waktu" value="{$smp[0].sampul_waktu}"{$disabled} /></td>
                    </tr>
                    <tr>
                      <td>COLLECTIVE NO.</td>
                      <td><div align="center">:</div></td>
                      <td><input type="text" name="sampul_collective_no" value="{$rq[0].rfq_collective_number}"{$disabled} /></td>
                    </tr>
                    <tr>
                      <td>PEKERJAAN</td>
                      <td><div align="center">:</div></td>
                      <td>{$tender.req_purpose}</td>
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
                      <td valign="top" class="rightBorder bottomBorder topBorder smallText"><div align="center"><strong>{$quo[0].quo_currency|upper}</strong></div></td>
                      <td width="11%" valign="top" class="rightBorder bottomBorder smallText"><div align="center"><strong>NILAI (USD)</strong></div></td>
                      <td width="10%" valign="top" class="rightBorder bottomBorder smallText"><div align="center"><strong>DITERBITKAN<br />
                      OLEH</strong></div></td>
                      <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                      <td valign="top" class="bottomBorder rightBorder"><div align="center"></div></td>
                    </tr>
                    {section name=co loop=$rq}
                    <tr>
                      <td valign="top" class="leftBorder"><div align="center">{$smarty.section.co.index+1}</div></td>
                      <td valign="top"><div align="center">{$rq[co].vendor_name}
                        <input type="hidden" name="vendor_id[]" value="{$rq[co].vendor_id}"{$disabled} />
                      </div></td>
                      <td valign="top"><div align="center">
                        <input type="text"{$disabled} class="textbox" name="sampul_harga_penawaran[]" value="{if !$disabled}{$quo[co].quo_total_price}{else}{$smp[co].sampul_harga_penawaran}{/if}" />
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_materai == 1}
                        <input name="sampul_materai[]"{$disabled} checked="checked" type="checkbox" value="1" />
                        {else}
                        <input name="sampul_materai[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_rekapitulasi == 1}
                        <input name="sampul_rekapitulasi[]"{$disabled} checked="checked" type="checkbox" value="1" />
                        {else}
                        <input name="sampul_rekapitulasi[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	<input type="text" name="sampul_nilai_penawaran[]"{$disabled} class="textbox" value="{$smp[co].sampul_nilai_penawaran}" />
                      </div></td>
                      <td valign="top"><div align="center">
                      	<input type="text" name="sampul_penerbit[]"{$disabled} class="textbox" value="{$smp[co].sampul_penerbit}" />
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_ulasan_teknis == 1}
                      	<input name="sampul_ulasan_teknis[]"{$disabled} checked="checked" type="checkbox" value="1" />
                        {else}
                        <input name="sampul_ulasan_teknis[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_neraca == 1}
                      	<input name="sampul_neraca[]"{$disabled} checked="checked" type="checkbox"{$disabled} value="1" />
                        {else}
                        <input name="sampul_neraca[]" type="checkbox"{$disabled} value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_ref_bank == 1}
                      	<input name="sampul_ref_bank[]" type="checkbox"{$disabled} checked="checked" value="1" />
                        {else}
                        <input name="sampul_ref_bank[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_akte_pendirian == 1}
                      	<input name="sampul_akte_pendirian[]" type="checkbox"{$disabled} checked="checked" value="1" />
                        {else}
                        <input name="sampul_akte_pendirian[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_sst == 1}
                      	<input name="sampul_sst[]" type="checkbox" checked="checked" value="1"{$disabled} />
                        {else}
                        <input name="sampul_sst[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_tenaker == 1}
                      	<input name="sampul_tenaker[]" type="checkbox" checked="checked" value="1"{$disabled} />
                        {else}
                        <input name="sampul_tenaker[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top"><div align="center">
                      	{if $smp[co].sampul_copy_kontrak == 1}
                      	<input name="sampul_copy_kontrak[]" checked="checked" type="checkbox" value="1"{$disabled} />
                        {else}
                        <input name="sampul_copy_kontrak[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                      <td valign="top" class="rightBorder"><div align="center">
                      	{if $smp[co].sampul_lengkap == 1}
                      	<input name="sampul_lengkap[]" type="checkbox" checked="checked" value="1"{$disabled} />
                        {else}
                        <input name="sampul_lengkap[]" type="checkbox" value="1" />
                        {/if}
                      </div></td>
                    </tr>
                    {/section}
                  </table></td>
                </tr>
<tr>
                  <td valign="top" class="topBorder">
                  	&nbsp;<br />KETERANGAN:<br />
                    <textarea name="sampul_keterangan" cols="40" rows="10"{$disabled}>{$smp[0].sampul_keterangan}</textarea>
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
    <td><input type="text" name="sampul_panitia_ketua_nama" value="{$smp[0].sampul_panitia_ketua_nama}"{$disabled} /></td>
    <td><div align="center">KETUA</div></td>
    <td><input type="text" name="sampul_panitia_ketua_fungsi" value="{$smp[0].sampul_panitia_ketua_fungsi}"{$disabled} /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">2</div></td>
    <td><input type="text" name="sampul_panitia_sekretaris_nama" value="{$smp[0].sampul_panitia_sekretaris_nama}"{$disabled} /></td>
    <td><div align="center">SEKRETARIS</div></td>
    <td><input type="text" name="sampul_panitia_sekretaris_fungsi" value="{$smp[0].sampul_panitia_sekretaris_fungsi}"{$disabled} /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="center">3</div></td>
    <td><input type="text" name="sampul_panitia_user_nama" value="{$smp[0].sampul_panitia_user_nama}"{$disabled} /></td>
    <td><div align="center">USER</div></td>
    <td><input type="text" name="sampul_panitia_user_fungsi" value="{$smp[0].sampul_panitia_user_fungsi}"{$disabled} id="sampul_panitia_user_fungsi" /></td>
    <td>&nbsp;</td>
  </tr>
</table>
                  </td>
                </tr>
            </table>
        <p>&nbsp;</p>
        <center><input type="submit" value=" MASUKKAN " name="submit1s"{$disabled} /></center>
        </form>
		{dhtml_calendar inputField="sampul_hrtgl" ifFormat="%d %B %Y" button="cal_req_date1" singleClick=false}
		<script language="javascript">
			var frmvalidator  = new Validator("sampulFrm");
			frmvalidator.clearAllValidations();
			
			frmvalidator.setAddnlValidationFunction("validateSubmit");
			frmvalidator.addValidation("sampul_hrtgl","req", "Mohon Masukkan Hari & Tanggal!");
			frmvalidator.addValidation("sampul_waktu","req","Mohon masukkan Waktu!");
			frmvalidator.addValidation("sampul_panitia_ketua_nama","req","Mohon masukkan Nama Ketua!");
			frmvalidator.addValidation("sampul_panitia_sekretaris_nama","req","Mohon masukkan Nama Sekretaris!");
			frmvalidator.addValidation("sampul_panitia_user_nama","req","Mohon masukkan Nama User!");
		</script>