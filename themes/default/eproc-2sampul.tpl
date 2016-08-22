	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Pembuatan 2 Sampul - {$tender.req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Masukkan jumlah penawaran tiap vendor dan kelengkapan dokumen vendor dengan menggunakan form dibawah ini.
    </p>
<p style="margin-top: 20px; font-size: 11pt">
{if $s2-step2 != 1}
<form name="sampulFrm" action="{$PHP_SELF}&go=2sampul" method="post">
	<input type="hidden" name="tender_id" value="" />
    {section name=vid loop=$vendors}
    {if $vendors[vid].vendor_id > 0}
    <input type="hidden" name="vendor_id[{$smarty.section.vid.index}]" value="{$vendors[vid].vendor_id}" />
    {/if}
    {/section}
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallText" id="sampul2">
              <tr>
                <td class="yellowBg padding5"><h2>BERITA ACARA PEMBUKAAN SAMPUL I (ADMINISTRASI &amp; TEKNIS)</h2></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" valign="middle">Hari/Tanggal</td>
                    <td width="2%" valign="middle"><div align="center">:</div></td>
                    <td width="42%" valign="middle"><input type="text" value="{$smp.sampul_hrtgl}" name="sampul_hrtgl" id="sampul_hrtgl" /> <img id="cal_req_date1" alt="" src="{$templateDir}/images/cal.png" /></td>
                    <td width="18%" valign="middle">Halaman</td>
                    <td width="1%" valign="middle"><div align="center">:</div></td>
                    <td width="18%" valign="middle"><strong>1 dari 1</strong></td>
                  </tr>
                  <tr>
                    <td valign="middle">Waktu</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><input name="sampul_waktu" type="text" id="sampul_waktu" value="{$smp.sampul_waktu}" /></td>
                    <td valign="middle">Tanggal Cetak</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><input name="sampul_tglcetak" type="text" id="sampul_tglcetak" value="{$smp.sampul_tglcetak}" /> <img id="cal_req_date2" alt="" src="{$templateDir}/images/cal.png" /></td>
                  </tr>
                  <tr>
                    <td valign="middle">Tempat</td>
                    <td valign="middle"><div align="center">:</div></td>
                    <td valign="middle"><input name="sampul_tempat" type="text" id="sampul_tempat" value="{$smp.sampul_tempat}" /></td>
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
                    <td width="79%" valign="middle"><input name="sampul_collective_no" type="text" id="sampul_collective_no" value="{$smp.sampul_collective_no}" /></td>
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
                    <td width="21%">Jumlah rekanan diundang</td>
                    <td width="1%"><div align="center">:</div></td>
                    <td width="18%">{$vendors.counter}</td>
                  </tr>
                  <tr>
                    <td>Hasil Kelengkapan Administrasi &amp; Teknis dituangkan dalam tabel ini</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran masuk</td>
                    <td><div align="center">:</div></td>
                    <td><input name="sampul_incoming_bids" type="text" id="sampul_incoming_bids" value="{$smp.sampul_incoming_bids}" /></td>
                  </tr>
                  <tr>
                    <td>Demikian Berita Acara ini dibuat untuk bahan proses selanjutnya</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran yang lengkap</td>
                    <td><div align="center">:</div></td>
                    <td><input name="sampul_full_bids" type="text" id="sampul_full_bids" value="{$smp.sampul_full_bids}" /></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder">
                  <tr>
                    <td width="3%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>No.</strong></div></td>
                    <td width="34%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>Dokumen Sampul 1</strong></div></td>
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
                    <td valign="top" class="rightBorder bottomBorder">&nbsp;</td>
                    <td valign="top" class="padding5 rightBorder bottomBorder">KELENGKAPAN ADMINISTRASI</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                    <td valign="top" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}">&nbsp;</td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">1</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Sampul tertutup dilak pada 5 tempat</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">
                      {if $vendors[0].got_vendor == 1}<input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[1].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[2].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[3].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[4].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[5].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[6].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[7].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
                      {/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[8].got_vendor == 1}
                          <input type="checkbox" name="sampul_lak5[]" value="1" id="checkbox">
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
                    <td valign="top" class="rightBorder bottomBorder">- Jangka waktu pelaksanaan (180 hari)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox6">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox22">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox60">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox71">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox72">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox73">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox74">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox75">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_jangka_waktu[]" value="1" id="checkbox76">
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
                    <td valign="top" class="rightBorder bottomBorder">Akte perusahaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox8">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox24">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox62">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox78">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox83">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox90">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox89">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox88">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_akte[]" value="1" id="checkbox135">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Copy perjanjian Konsorsium (bila ada)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox9">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox25">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox63">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox79">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox82">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox91">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox92">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox93">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_konsorsium[]" value="1" id="checkbox134">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Copy Rekening Koran 3 (tiga) bulan terakhir</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox10">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox26">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox64">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox80">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox81">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox95">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox94">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox96">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_rek_koran[]" value="1" id="checkbox133">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">6</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Referensi Bank menunjuk pekerjaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox11">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox27">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox65">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox97">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">
                      {if $vendors[4].got_vendor == 1}
                      <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox98">
{/if}</div> </td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox99">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox100">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox101">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_ref_bank[]" value="1" id="checkbox132">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="padding5 rightBorder bottomBorder">KELENGKAPAN TEKNIS</td>
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
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">1</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat pernyataan bahwa unit yang akan disupply dalam keadaan standby, kondisi baru atau zero hour serta asal/lokasi unit</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox12">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox28">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox66">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox102">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox103">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox104">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox105">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox106">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_sp[]" value="1" id="checkbox131">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">2</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat Dukungan dari Packager atau Principle/MFR baik untuk peralatan dan Maintenence</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox13">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox29">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox67">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[31].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox107">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox108">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox109">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox110">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox111">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_dukungan[]" value="1" id="checkbox130">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Daftar spesifikasi peralatan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox14">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox30">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox68">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox112">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox113">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox114">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox115">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox116">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_spek[]" value="1" id="checkbox129">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Daftar Material dominan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox15">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox31">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox69">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox117">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox119">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox121">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox123">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox125">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_material[]" value="1" id="checkbox128">
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Curriculum Vitae dan Sertifikat Tenaga Kerja/Ahli</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox16">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox32">
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox70">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox118">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox120">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox122">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox124">
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox126">
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        <input type="checkbox" name="sampul_cv[]" value="1" id="checkbox127">
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
                        <input type="text" name="sampul_panitia_ketua" id="sampul_panitia_ketua">
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <input type="text" name="sampul_panitia_sekretaris" id="sampul_panitia_sekretaris">
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <input type="text" name="sampul_panitia_keuangan" id="sampul_panitia_keuangan">
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <input type="text" name="sampul_panitia_hukum" id="sampul_panitia_hukum">
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <input type="text" name="sampul_panitia_user" id="sampul_panitia_user">
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <input type="text" name="sampul_panitia_proc" id="sampul_panitia_procurement">
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        <input type="text" name="sampul_panitia_ahli" id="sampul_panitia_ahli">
                    </div></td>
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
  	<div align="center"><input type="submit" name="submit2S1" value=" MASUKKAN! " /></div>
        </form>
		{dhtml_calendar inputField="sampul_hrtgl" ifFormat="%d %B %Y" button="cal_req_date1" singleClick=false}
		{dhtml_calendar inputField="sampul_tglcetak" ifFormat="%d %B %Y" button="cal_req_date2" singleClick=false}
		<script language="javascript">
			var frmvalidator  = new Validator("sampulFrm");
			frmvalidator.clearAllValidations();
			
			frmvalidator.setAddnlValidationFunction("validateSubmit");
			frmvalidator.addValidation("sampul_hrtgl","req", "Mohon Masukkan Hari & Tanggal!");
			frmvalidator.addValidation("sampul_incoming_bids","req","Mohon masukkan Penawaran yang masuk!");
			frmvalidator.addValidation("sampul_full_bids","req","Mohon Masukkan Penawaran yang lengkap!");
			frmvalidator.addValidation("sampul_panitia_ketua","req","Mohon Masukkan Ketua Panitia!");
			frmvalidator.addValidation("sampul_panitia_sekretaris","req","Mohon Masukkan Sekretaris Panitia!");
			frmvalidator.addValidation("sampul_panitia_keuangan","req","Mohon Masukkan Panitia Keuangan!");
			frmvalidator.addValidation("sampul_panitia_hukum","req","Mohon Masukkan Panitia Hukum!");
			frmvalidator.addValidation("sampul_panitia_user","req","Mohon Masukkan Nama User!");
			frmvalidator.addValidation("sampul_panitia_proc","req","Mohon Masukkan Panitia Procurement!");
			frmvalidator.addValidation("sampul_panitia_ahli","req","Mohon Masukkan Panitia Ahli!");
		</script>
    {else if $s2-step2 == 1}
    Step 2
    {/if}
    </p>