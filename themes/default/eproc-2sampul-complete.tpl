{literal}
<script language="javascript">
	function print_to_pdf() {
		html2ps = '{/literal}{$html2ps1}{$tender_id}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
	function print_to_pdf2() {
		html2ps = '{/literal}{$html2ps2}{$tender_id}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
</script>
{/literal}
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallText" id="sampul2">
              <tr>
                <td class="yellowBg padding5"><h2>BERITA ACARA PEMBUKAAN SAMPUL I (ADMINISTRASI &amp; TEKNIS)</h2></td>
                <td class="yellowBg padding5"><input type="button" value="Print to PDF" style="height: 15px;" onclick="print_to_pdf()" /> <input type="button" name="nextBtn1" style="height: 15px;" value="NEXT &raquo;" onclick="top.location.href='index.php?mod=eproc&act=penetapan-list'" /></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                    <td>{$smp.sampul_incoming_bids}</td>
                  </tr>
                  <tr>
                    <td>Demikian Berita Acara ini dibuat untuk bahan proses selanjutnya</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran yang lengkap</td>
                    <td><div align="center">:</div></td>
                    <td>{$smp.sampul_full_bids}</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2" class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder">
                  <tr>
                    <td width="3%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>No.</strong></div></td>
                    <td width="34%" valign="top" class="rightBorder bottomBorder"><div align="center"><strong>Dokumen Sampul 1</strong></div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[0].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[1].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[2].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[3].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[4].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[5].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[6].vendor_name}</div></td>
                    <td width="7%" valign="top" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[7].vendor_name}</div></td>
                    <td width="7%" valign="top" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{$s1fields[8].vendor_name}</div></td>
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
                      {if $vendors[0].got_vendor == 1}
					  {if $s1fields[0].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[1].got_vendor == 1}
                          {if $s1fields[1].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[2].got_vendor == 1}
                          {if $s1fields[2].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[3].got_vendor == 1}
                          {if $s1fields[3].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[4].got_vendor == 1}
                          {if $s1fields[4].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[5].got_vendor == 1}
                          {if $s1fields[5].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[6].got_vendor == 1}
                          {if $s1fields[6].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[7].got_vendor == 1}
                          {if $s1fields[7].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[8].got_vendor == 1}
                          {if $s1fields[8].sampul_lak5 == 1}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox" checked="checked">
					  {else}
					  <input type="checkbox" name="sampul_lak5[]" value="1" disabled="disabled" id="checkbox">
					  {/if}
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
                      {if $s1fields[0].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
                      {/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s1fields[2].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s1fields[3].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s1fields[4].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s1fields[5].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s1fields[6].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s1fields[7].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s1fields[8].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanda tangan sesuai dengan akte</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
					  {if $s1fields[0].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
                    {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s1fields[2].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s1fields[3].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s1fields[4].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s1fields[5].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s1fields[6].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s1fields[7].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s1fields[8].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Materai Rp. 6000,-</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s1fields[0].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s1fields[2].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s1fields[3].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s1fields[4].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s1fields[5].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>

                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s1fields[6].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s1fields[7].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s1fields[8].sampul_materai == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Cap perusahaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s1fields[2].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s1fields[3].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                       {if $s1fields[4].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s1fields[5].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s1fields[6].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s1fields[7].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s1fields[8].sampul_cap == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Jangka waktu pelaksanaan (180 hari)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {if $s1fields[1].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                       {if $s1fields[2].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {if $s1fields[5].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_jangka_waktu == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanggal &amp; nomor surat</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {if $s1fields[1].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {if $s1fields[5].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Akte perusahaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                       {if $s1fields[3].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                       {if $s1fields[4].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                       {if $s1fields[5].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_akte == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Copy perjanjian Konsorsium (bila ada)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s1fields[0].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {if $s1fields[1].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                       {if $s1fields[3].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {if $s1fields[5].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_konsorsium == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Copy Rekening Koran 3 (tiga) bulan terakhir</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s1fields[0].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                         {if $s1fields[2].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s1fields[3].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s1fields[4].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s1fields[5].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                         {if $s1fields[6].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s1fields[7].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s1fields[8].sampul_rek_koran == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">6</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Referensi Bank menunjuk pekerjaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                         {if $s1fields[0].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                         {if $s1fields[1].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">
                      {if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div> </td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                       {if $s1fields[5].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_ref_bank == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
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
                       {if $s1fields[0].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                         {if $s1fields[2].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s1fields[3].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s1fields[4].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s1fields[5].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s1fields[6].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s1fields[7].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                         {if $s1fields[8].sampul_sp == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">2</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Surat Dukungan dari Packager atau Principle/MFR baik untuk peralatan dan Maintenence</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                          {if $s1fields[0].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s1fields[1].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {if $s1fields[5].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_dukungan == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Daftar spesifikasi peralatan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {if $s1fields[1].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                       {if $s1fields[5].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_spek == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Daftar Material dominan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {if $s1fields[1].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {if $s1fields[5].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_material == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">5</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Curriculum Vitae dan Sertifikat Tenaga Kerja/Ahli</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {if $s1fields[0].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {if $s1fields[1].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {if $s1fields[2].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {if $s1fields[3].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {if $s1fields[4].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {if $s1fields[5].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {if $s1fields[6].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {if $s1fields[7].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {if $s1fields[8].sampul_cv == 1}
					  <input type="checkbox" disabled="disabled" id="checkbox" checked="checked" name="dummy">
					  {else}
					  <input type="checkbox" disabled="disabled" id="checkbox" name="dummy">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="padding10 rightBorder bottomBorder"><div align="center">KETERANGAN</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1} 
                      <textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[0].sampul_keterangan}
					  </textarea>
					  {/if}
                    </div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      <textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[1].sampul_keterangan}
					  </textarea>
					  {/if}
                    </div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[2].sampul_keterangan}
					  </textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[3].sampul_keterangan}
					  </textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[4].sampul_keterangan}
					  </textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[5].sampul_keterangan}
					  </textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[6].sampul_keterangan}
					  </textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[7].sampul_keterangan}
					  </textarea>{/if}</div></td>
                    <td valign="top" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}<textarea name="sampul_keterangan[]" disabled="disabled" cols="4" rows="5">
					  {$s1fields[8].sampul_keterangan}
					  </textarea>{/if}</div></td>
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
                    <td valign="middle" class="rightBorder bottomBorder"><div align="center">
                        {$smp.sampul_panitia_ahli}
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
                </table>                </td>
              </tr>
</table>
<p>&nbsp;</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="smallText" id="sampul2">
              <tr>
                <td width="82%" class="yellowBg padding5"><h2>BERITA ACARA PEMBUKAAN SAMPUL II (HARGA)</h2></td>
                <td width="18%" class="yellowBg padding5"><input name="button" type="button" style="height: 15px;" onclick="print_to_pdf2()" value="Print to PDF" /> <input type="button" name="nextBtn1" style="height: 15px;" value="NEXT &raquo;" onclick="top.location.href='index.php?mod=eproc&act=penetapan-list'" /></td>
              </tr>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="44%">&nbsp;</td>
                    <td width="16%">&nbsp;</td>
                    <td width="21%">Jumlah rekanan Lulus Sampul I</td>
                    <td width="1%"><div align="center">:</div></td>
                    <td width="18%">{$s2fields[0].sampul_lulus}</td>
                  </tr>
                  <tr>
                    <td>Hasil Kelengkapan Administrasi &amp; Teknis dituangkan dalam tabel ini</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran Sampul II</td>
                    <td><div align="center">:</div></td>
                    <td>{$s2fields[0].sampul_incoming_bids}</td>
                  </tr>
                  <tr>
                    <td>Demikian Berita Acara ini dibuat untuk bahan proses selanjutnya</td>
                    <td>&nbsp;</td>
                    <td>Jumlah penawaran yang sah</td>
                    <td><div align="center">:</div></td>
                    <td>{$s2fields[0].sampul_full_bids}</td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td colspan="2" class="padding5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ftBorder">
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
                      {if $vendors[0].got_vendor == 1}
					  {if $s2fields[0].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if}
                    </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[1].got_vendor == 1}
                          {if $s2fields[1].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[2].got_vendor == 1}
                          {if $s2fields[2].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[3].got_vendor == 1}
                          {if $s2fields[3].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[4].got_vendor == 1}
                          {if $s2fields[4].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[5].got_vendor == 1}
                          {if $s2fields[5].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[6].got_vendor == 1}
                          {if $s2fields[6].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[7].got_vendor == 1}
                          {if $s2fields[7].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center"> {if $vendors[8].got_vendor == 1}
                          {if $s2fields[8].sampul_penawaran_tertutup == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
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
                      {if $s2fields[0].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                      {/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s2fields[1].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s2fields[2].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s2fields[3].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s2fields[4].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s2fields[5].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s2fields[6].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s2fields[7].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s2fields[8].sampul_berlaku_penawaran == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanda tangan sesuai dengan akte</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s2fields[0].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
                    {/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s2fields[1].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s2fields[2].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s2fields[3].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s2fields[4].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s2fields[5].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s2fields[6].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s2fields[7].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s2fields[8].sampul_penawaran_tdtgn == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Materai Rp. 6000,-</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s2fields[0].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s2fields[1].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s2fields[2].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s2fields[3].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s2fields[4].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s2fields[5].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s2fields[6].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s2fields[7].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s2fields[8].sampul_materai == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Cap perusahaan</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s2fields[0].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s2fields[1].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s2fields[2].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s2fields[3].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s2fields[4].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s2fields[5].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s2fields[6].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s2fields[7].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s2fields[8].sampul_cap == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Tanggal &amp; nomor surat</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s2fields[0].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s2fields[1].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s2fields[2].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s2fields[3].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s2fields[4].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s2fields[5].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s2fields[6].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s2fields[7].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s2fields[8].sampul_tgl_nmr_surat == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">3</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Total Harga Penawaran Tidak Termasuk PPN 10% ({$quo[0].quo_currency|upper})</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {$s2fields[0].sampul_total_harga}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                       {$s2fields[1].sampul_total_harga}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {$s2fields[2].sampul_total_harga}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {$s2fields[3].sampul_total_harga}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      $s2fields[4].sampul_total_harga}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                       {$s2fields[5].sampul_total_harga}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {$s2fields[6].sampul_total_harga}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {$s2fields[7].sampul_total_harga}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                       {$s2fields[8].sampul_total_harga}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center">4</div></td>
                    <td valign="top" class="rightBorder bottomBorder">Perincian Penawaran Harga</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                        {if $s2fields[0].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                        {if $s2fields[1].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                        {if $s2fields[2].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                        {if $s2fields[3].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                        {if $s2fields[4].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                        {if $s2fields[5].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                        {if $s2fields[6].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                        {if $s2fields[7].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                        {if $s2fields[8].sampul_perincian == 1}
					  <input type="checkbox" checked="checked" disabled="disabled" value="1" id="checkbox">
					  {else}
					  <input type="checkbox" disabled="disabled" value="1" id="checkbox">
					  {/if}
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
                      {$s2fields[0].sampul_penerbit}
 {/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {$s2fields[1].sampul_penerbit}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {$s2fields[2].sampul_penerbit}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {$s2fields[3].sampul_penerbit}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {$s2fields[4].sampul_penerbit}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {$s2fields[5].sampul_penerbit}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {$s2fields[6].sampul_penerbit}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {$s2fields[7].sampul_penerbit}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {$s2fields[8].sampul_penerbit}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td valign="top" class="rightBorder bottomBorder"><div align="center"></div></td>
                    <td valign="top" class="rightBorder bottomBorder">- Nilai (US$)</td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      {$s2fields[0].sampul_nilai}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {$s2fields[1].sampul_nilai}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {$s2fields[2].sampul_nilai}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {$s2fields[3].sampul_nilai}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">
                      {if $vendors[4].got_vendor == 1}
                      {$s2fields[4].sampul_nilai}
{/if}</div> </td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {$s2fields[5].sampul_nilai}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {$s2fields[6].sampul_nilai}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {$s2fields[7].sampul_nilai}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {$s2fields[8].sampul_nilai}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="rightBorder bottomBorder"><div align="center">PERINGKAT</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
					  {$s2fields[0].sampul_peringkat}
					{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      {$s2fields[1].sampul_peringkat}
{/if}</div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}
                      {$s2fields[2].sampul_peringkat}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}
                      {$s2fields[3].sampul_peringkat}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}
                      {$s2fields[4].sampul_peringkat}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}
                      {$s2fields[5].sampul_peringkat}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}
                      {$s2fields[6].sampul_peringkat}
{/if} </div></td>
                    <td valign="middle" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}
                      {$s2fields[7].sampul_peringkat}
{/if} </div></td>
                    <td valign="middle" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}
                      {$s2fields[8].sampul_peringkat}
{/if} </div></td>
                  </tr>
                  <tr>
                    <td colspan="2" valign="top" class="padding10 rightBorder bottomBorder"><div align="center">KETERANGAN</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[0].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[0].got_vendor == 1}
                      <textarea disabled="disabled" cols="4" rows="5">{$s2fields[0].sampul_keterangan}</textarea>
					  {/if}
                    </div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[1].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[1].got_vendor == 1}
                      <textarea disabled="disabled" cols="4" rows="5">{$s2fields[1].sampul_keterangan}</textarea>{/if}
                    </div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[2].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[2].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[2].sampul_keterangan}</textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[3].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[3].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[3].sampul_keterangan}</textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[4].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[4].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[4].sampul_keterangan}</textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[5].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[5].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[5].sampul_keterangan}</textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[6].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[6].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[6].sampul_keterangan}</textarea>{/if}</div></td>
                    <td valign="top" class="rightBorder bottomBorder{if $vendors[7].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[7].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[7].sampul_keterangan}</textarea>{/if}</div></td>
                    <td valign="top" class="bottomBorder{if $vendors[8].got_vendor == 0} disabledRow{/if}"><div align="center">{if $vendors[8].got_vendor == 1}<textarea disabled="disabled" cols="4" rows="5">{$s2fields[8].sampul_keterangan}</textarea>{/if}</div></td>
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
                </table>                </td>
              </tr>
</table>
