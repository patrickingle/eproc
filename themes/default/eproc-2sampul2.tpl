{if $next == 1}
{literal}
<script language="javascript">
top.location.href = "index.php{/literal}{$url}{literal}";
</script>
{/literal}
{/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Pembuatan 2 Sampul 2 - {$tender.req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Masukkan jumlah penawaran tiap vendor dan kelengkapan dokumen vendor dengan menggunakan form dibawah ini.
    </p>
<p style="margin-top: 20px; font-size: 11pt">
<form name="sampulFrm" action="{$PHP_SELF}&go=2sampul2" method="post">
	<input type="hidden" name="tender_id" value="" />
    {section name=vid loop=$vendors}
    {if $vendors[vid].vendor_id > 0}
    <input type="hidden" name="vendor_id[{$smarty.section.vid.index}]" value="{$vendors[vid].vendor_id}" />
    {/if}
    {/section}
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallText" id="sampul2">
              <tr>
                <td class="yellowBg padding5"><h2>BERITA ACARA PEMBUKAAN SAMPUL II (HARGA)</h2></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" valign="middle">Hari/Tanggal</td>
                    <td width="2%" valign="middle"><div align="center">:</div></td>
                    <td width="42%" valign="middle">{$smp.sampul_hrtgl}</td>
                    <td width="18%" valign="middle">Halaman</td>
                    <td width="1%" valign="middle"><div align="center">:</div></td>
                    <td width="18%" valign="middle"><strong>1 dari 1</strong></td>
                  </tr>
                  <tr>
                    <td valign="middle">Waktu</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle">{$smp.sampul_waktu}</td>
                    <td valign="middle">Tanggal Cetak</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle">{$smp.sampul_tglcetak}</td>
                  </tr>
                  <tr>
                    <td valign="middle">Tempat</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle">{$smp.sampul_tempat}</td>
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
                    <td width="79%" valign="middle">{$smp.sampul_collective_no}</td>
                  </tr>
                  <tr>
                    <td valign="middle">Pekerjaan/Pengadaan</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle">{$tender.req_purpose}</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="44%">&nbsp;</td>
                    <td width="16%">&nbsp;</td>
                    <td width="21%">Jumlah rekanan Lulus Sampul I</td>
                    <td width="1%"><div align="center">:</div></td>
                    <td width="18%"><input name="sampul_lulus" type="text" id="sampul_lulus" /></td>
                  </tr>
                  <tr>
                    <td>Hasil Kelengkapan Administrasi &amp; Teknis dituangkan dalam tabel ini</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran Sampul II</td>
                    <td><div align="center">:</div></td>
                    <td><input name="sampul_incoming_bids" type="text" id="sampul_incoming_bids" /></td>
                  </tr>
                  <tr>
                    <td>Demikian Berita Acara ini dibuat untuk bahan proses selanjutnya</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran yang sah</td>
                    <td><div align="center">:</div></td>
                    <td><input name="sampul_full_bids" type="text" id="sampul_full_bids" /></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder">
                  <tr>
                    <td width="3%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>No.</strong></div></td>
                    <td width="34%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>Dokumen Sampul 2</strong></div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[0].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[1].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[2].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[3].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[4].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[5].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[6].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[7].vendor_name}</div></td>
                    <td width="7%" valign="top" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{$vendors[8].vendor_name}</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">1</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Sampul Penawaran Tertutup</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">
                      {if $vendors[0].got_vendor == 1}<input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[1].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[2].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[3].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[4].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[5].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[6].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[7].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[8].got_vendor == 1}
                          <input type="checkbox" name="sampul_penawaran_tertutup[]" value="1" id="checkbox">
                      {/if}</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">2</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat Penawaran</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center"></div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Masa berlaku penawaran (90 hari)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox2">
                      {/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox17">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox18">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox33">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox34">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox35">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox36">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox37">
{/if}</div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_berlaku_penawaran[]" value="1" id="checkbox38">
{/if}</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanda tangan sesuai dengan akte</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox3">
                    {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox19">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox39">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox40">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox41">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox42">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox43">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox44">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_penawaran_tdtgn[]" value="1" id="checkbox45">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Materai Rp. 6000,-</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox4">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox20">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox46">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox47">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox48">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox49">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox50">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox51">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_materai[]" value="1" id="checkbox52">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Cap perusahaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox5">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox21">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox59">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox58">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox57">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox56">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox55">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox54">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_cap[]" value="1" id="checkbox53">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanggal &amp; nomor surat</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox7">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox23">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox61">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox77">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox84">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox85">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox86">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox87">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_tgl_nmr_surat[]" value="1" id="checkbox136">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Total Harga Penawaran Tidak Termasuk PPN 10% ({$quo[0].quo_currency|upper})</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[0].quo_total_price}" id="checkbox8">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[1].quo_total_price}" id="checkbox24">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[2].quo_total_price}" id="checkbox62">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[3].quo_total_price}" id="checkbox78">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[4].quo_total_price}" id="checkbox83">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[5].quo_total_price}" id="checkbox90">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[6].quo_total_price}" id="checkbox89">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[7].quo_total_price}" id="checkbox88">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="text" name="sampul_total_harga[]" style="width: 60px;" class="btn" value="{$quo[8].quo_total_price}" id="checkbox135">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Perincian Penawaran Harga</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox9">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox25">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox63">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox79">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox82">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox91">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox92">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox93">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_perincian[]" value="1" id="checkbox134">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Jaminan Penawaran</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Diterbitkan Oleh</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
 {/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="text" value="" name="sampul_penerbit[]" style="width: 50px; text-align: center;" id="sampul_penerbit[]" />
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Nilai (US$)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">
                      {if $vendors[4].got_vendor == 1}
                      <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if}</div> </td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="text" value="" name="sampul_nilai[]" style="width: 50px; text-align: center;" />
{/if} </div></td>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="rightBorder bottomBorder"><div align="center">PERINGKAT</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}<input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="text" value="" name="sampul_peringkat[]" style="width: 20px; text-align: center;" />
{/if} </div></td>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="padding10 rightBorder bottomBorder"><div align="center">KETERANGAN</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      <textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}
                    </div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      <textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}
                    </div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
                    <td valign="top" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}<textarea name="sampul_keterangan[]" id="sampul_keterangan[]" cols="4" rows="5"></textarea>{/if}</div></td>
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
                        {$smp.sampul_panitia_ketua}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        {$smp.sampul_panitia_sekretaris}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        {$smp.sampul_panitia_keuangan}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        {$smp.sampul_panitia_hukum}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        {$smp.sampul_panitia_user}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        {$smp.sampul_panitia_proc}
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
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[0].vendor_name}</td>
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[1].vendor_name}</td>
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[2].vendor_name}</td>
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[3].vendor_name}</td>
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[4].vendor_name}</td>
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[5].vendor_name}</td>
                    <td valign="top" class="rightBorder bottomBorder">{$vendors[6].vendor_name}</td>
                    <td valign="top" class="bottomBorder">{$vendors[7].vendor_name}</td>
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
  	<div align="center"><input type="submit" name="submit2S2" value=" MASUKKAN! " /></div>
        </form>
		<script language="javascript">
			var frmvalidator  = new Validator("sampulFrm");
			frmvalidator.clearAllValidations();
			
			frmvalidator.setAddnlValidationFunction("validateSubmit");
			frmvalidator.addValidation("sampul_lulus","req", "Mohon Masukkan Jumlah Rekanan Lulus Sampul I!");
			frmvalidator.addValidation("sampul_incoming_bids","req","Mohon masukkan Jumlah Penawar Sampul II!");
			frmvalidator.addValidation("sampul_full_bids","req","Mohon masukkan Jumlah Penawaran Yang Sah!");
		</script>
    </p>