{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1 || $_userLevel == 2}
{literal}
<script language="javascript">
	function goDocument() {
		tender_id = {/literal}{$_GET.tender_id}{literal};
		tender_type = {/literal}{$_GET.tender_type}{literal};
		lelang = document.getElementById('lelang').value;
		url = "index.php?mod=eproc&act=dokumentasi&tender_id=" + tender_id 
			  + "&tender_type=" + tender_type + "&lelang=" + lelang;
		top.location.href = url;
	}
	function print_to_pdf() {
		html2ps = '{/literal}{$html2pspt}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
	function print_to_pdf2() {
		html2ps = '{/literal}{$html2pspt2}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
	function hapusPdf(fid) {
		url = "index.php?mod=eproc&act=dokumentasi&tender_id={/literal}{$_GET.tender_id}{literal}&tender_type={/literal}{$_GET.tender_type}{literal}&lelang={/literal}{$_GET.lelang}{literal}" +
			  "&sub=hapus&fp_id=" + fid;
		top.location.href = url;
		//alert(url);
	}
</script>
{/literal}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $del == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	PDF SUKSES DIHAPUS
        </span>
    </p>
    {/if}
	{if $_GET.upl == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	PDF SUKSES DI-UPLOAD
        </span>
    </p>
    {/if}
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Jenis Lelang</strong>
    </p>
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Upload PDF - Tampilan Frontpage</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Gunakan Form dibawah ini untuk upload file PDF yang hendak ditampilkan di halaman depan ketika publik mengakses aplikasi ini. Jika textfield dan tombol-tombol dibawah ini tidak bisa digunakan, anda harus terlebih dahulu menghapus file PDF yang sebelumnya telah anda upload dengan klik tombol HAPUS
		<p>&nbsp;</p>
		<p>
			<form name="pdfForm" action="index.php?mod=eproc&act=dokumentasi&tender_id={$_GET.tender_id}&tender_type={$_GET.tender_type}&lelang={$_GET.lelang}" method="post" enctype="multipart/form-data">
			Deskripsi Singkat:<br />
			<textarea cols="30"{$pdfDisable} rows="7" name="pdf_desc"></textarea>
			<br />&nbsp;<br />
			File PDF:<br />
			<input type="file"{$pdfDisable} name="pdfFile" />
			<br />&nbsp;<br />
			<input type="submit"{$pdfDisable} name="submitPdf" value=" MASUKKAN " /> <input type="button" name="hapus" value=" HAPUS? " onclick="hapusPdf({$fp_id})" />
			</form>
		</p>
	</p>
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Ringkasan I - <input type="button" value="Print to PDF" onclick="print_to_pdf()" /></strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
		<!-- RINGKASAN 1 -->
  <div align="center"><h4>RINGKASAN PELAKSANAAN PENGADAAN</h4></div>
		<p>&nbsp;</p>
		<p><strong>I. DATA PRA PENGADAAN</strong></p>
		<p class="padding5">
		<form name="docForm" action="index.php?mod=eproc&act=dokumentasi&tender_id={$_GET.tender_id}&tender_type={$_GET.tender_type}&lelang={$_GET.lelang}" method="post">
		{section name="vend" loop=$vendors}
		<input type="hidden" name="vendors[{$smarty.section.vend.index}]" value="{$vendors[vend].vendor_id}" />
		{/section}
		<input type="hidden" name="editMode" value="{$editMode}" />
	  	<table border="0" cellpadding="0" cellspacing="0" class="rfqTable smallText" width="600">
				<tr>
					<td width="18" valign="top" class="rightBorder topBorder leftBorder bottomBorder">1.</td>
					<td width="250" valign="top" class="rightBorder topBorder bottomBorder">Nama Proyek</td>
					<td width="332" valign="top" class="rightBorder topBorder bottomBorder">{$tender.req_purpose}</td>
				</tr>
				<tr>
					<td width="18" valign="top" class="rightBorder leftBorder bottomBorder">2.</td>
					<td width="250" valign="top" class="rightBorder bottomBorder">No. Lelang/Bid</td>
					<td width="332" valign="top" class="rightBorder bottomBorder">
					<input type="text" name="doc_no_lelang" value="{$ringsatu[0].doc_no_lelang}" class="btn" />
					</td>
				</tr>
				<tr>
					<td width="18" valign="top" class="rightBorder leftBorder bottomBorder">3.</td>
					<td width="250" valign="top" class="rightBorder bottomBorder">Harga Perkiraan Sendiri (HPS)/Engineers Estimate (EE)/Owner Estimate (OE) Rincian Terlampir</td>
					<td width="332" valign="top" class="rightBorder bottomBorder">
						{$quo_currency} {$tval}
					</td>
				</tr>
				<tr>
					<td width="18" valign="top" class="rightBorder leftBorder bottomBorder">2.</td>
					<td width="250" valign="top" class="rightBorder bottomBorder">
						Jangka waktu pelaksanaan/periode kontrak/penyerahan barang
					</td>
					<td width="332" valign="top" class="rightBorder bottomBorder">
						{$rfq[0].rfq_terms_of_delivery}					</td>
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
		  <td valign="top" class="rightBorder topBorder bottomBorder">{if $_GET.lelang == 1}{$tender_desc}{/if}</td>
		  <td valign="top" class="rightBorder topBorder bottomBorder">{if $_GET.lelang == 2}{$tender_desc}{/if}</td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">2.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tata cara pemasukan dokumen lelang (satu sampul/dua sampul/dua tahap)</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 1}{$tender_parent}{/if}</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 2}{$tender_parent}{/if}</td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">3.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tanggal Undangan (RFQ)</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 1}{$rfq[0].rfq_created_date|date_format:"%d-%b-%y"}{/if}</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 2}{$rfq[0].rfq_created_date|date_format:"%d-%b-%y"}{/if}</td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">4.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tanggal Pengambilan Dokumen Lelang</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 1}
		  <input type="text" value="{$ringsatu[0].doc_ambil_dok_lelang|date_format:"%d %b %y"}" class="btn" name="doc_ambil_dok_lelang" id="doc_ambil_dok_lelang" /> 
		  <img id="cal_req_date1" alt="" src="{$templateDir}/images/cal.png" /> 
		  {/if}</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 2}
		  <input type="text" value="{$ringsatu[0].doc_ambil_dok_lelang|date_format:"%d %b %y"}" class="btn" name="doc_ambil_dok_lelang" id="doc_ambil_dok_lelang" /> 
		  <img id="cal_req_date1" alt="" src="{$templateDir}/images/cal.png" /> 
		  {/if}</td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder leftBorder bottomBorder">5.</td>
		  <td valign="top" class="rightBorder bottomBorder">Tanggal Penutupan/Pembukaan Lelang</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 1}
		  <input type="text" value="{$ringsatu[0].doc_tutup_lelang|date_format:"%d %b %y"}" class="btn" name="doc_tutup_lelang" id="doc_tutup_lelang" /> 
		  <img id="cal_req_date2" alt="" src="{$templateDir}/images/cal.png" /> 
		  {/if}</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 2}
		  <input type="text" value="{$ringsatu[0].doc_tutup_lelang|date_format:"%d %b %y"}" class="btn" name="doc_tutup_lelang" id="doc_tutup_lelang" /> 
		  <img id="cal_req_date2" alt="" src="{$templateDir}/images/cal.png" /> 
		  {/if}</td>
	  </tr>
	  <tr>
		  <td rowspan="2" valign="top" class="rightBorder leftBorder bottomBorder">6.</td>
		  <td valign="top" class="rightBorder bottomBorder">a. Dalam hal sebagai pelelangan ulang, sebutkan alasan pelelangan gagal </td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 1}
		  <textarea name="doc_alasan_batal" rows="5" class="btn">{$ringsatu[0].doc_alasan_batal}</textarea>
		  {/if}</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 2}
		  <textarea name="doc_alasan_batal" rows="5" class="btn">{$ringsatu[0].doc_alasan_batal}</textarea>
		  {/if}</td>
	  </tr>
	  <tr>
		  <td valign="top" class="rightBorder bottomBorder">b. Tanggal pemberitahuan lelang batal/gagal kepada perusahaan yang mengajukan penawaran </td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 1}
		  <input type="text" value="{$ringsatu[0].doc_batal_lelang|date_format:"%d %b %y"}" class="btn" name="doc_batal_lelang" id="doc_batal_lelang" /> 
		  <img id="cal_req_date3" alt="" src="{$templateDir}/images/cal.png" /> 
		  {/if}</td>
		  <td valign="top" class="rightBorder bottomBorder">{if $_GET.lelang == 2}
		  <input type="text" value="{$ringsatu[0].doc_batal_lelang|date_format:"%d %b %y"}" class="btn" name="doc_batal_lelang" id="doc_batal_lelang" /> 
		  <img id="cal_req_date3" alt="" src="{$templateDir}/images/cal.png" /> 
		  {/if}</td>
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
				{section name="ven" loop=$rfq}
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{$smarty.section.ven.index+1}
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{$vendors[ven].vendor_name|capitalize}
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_vendor_fetch_doc == 1}
					<input type="checkbox" checked="checked" value="1" name="doc_vendor_fetch_doc[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_vendor_fetch_doc[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_vendor_bid == 1}
					<input type="checkbox" value="1" checked="checked" name="doc_vendor_bid[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_vendor_bid[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_vendor_no_bid == 1}
					<input type="checkbox" value="1" checked="checked" name="doc_vendor_no_bid[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_vendor_no_bid[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<input type="text" value="{$ringsatu[ven].doc_rapat_pra|date_format:"%d %b %y"}" name="doc_rapat_pra[{$smarty.section.ven.index}]" id="doc_rapat_pra[]" class="btn" style="width: 50px;" />
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<input type="text" value="{$ringsatu[ven].doc_tinjau_pra|date_format:"%d %b %y"}" name="doc_tinjau_pra[{$smarty.section.ven.index}]" id="doc_tinjau_pra[]" class="btn" style="width: 50px;" />
					</div></td>
				</tr>
				{/section}
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">Jumlah
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">{$total_vendors}
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
				{section name="ven" loop=$rfq}
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder{if $smarty.section.ven.index+1 == $total_vendors} bottomBorder{/if}"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{$smarty.section.ven.index+1}
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{$vendors[ven].vendor_name|capitalize}
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_surat_pengantar == 1}
					<input type="checkbox" value="1" checked="checked" name="doc_surat_pengantar[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_surat_pengantar[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ssmp[ven].akte == 1}
					<input type="checkbox" checked="checked" disabled="disabled" name="doc_akte" />
					{else}
					<input type="checkbox" disabled="disabled" name="doc_akte" />
					{/if}
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ssmp[ven].ref_bank == 1}
					<input type="checkbox" checked="checked" disabled="disabled" name="doc_ref_bank" />
					{else}
					<input type="checkbox" disabled="disabled" name="doc_ref_bank" />
					{/if}
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ssmp[ven].bid_bond > 0}
					<input type="checkbox" checked="checked" disabled="disabled" name="doc_bid_bond" />
					{else}
					<input type="checkbox" disabled="disabled" name="doc_bid_bond" />
					{/if}
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ssmp[ven].rfq == 1}
					<input type="checkbox" checked="checked" disabled="disabled" name="doc_rfq" />
					{else}
					<input type="checkbox" disabled="disabled" name="doc_rfq" />
					{/if}
					</div></td>
				</tr>
				{/section}
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
				{section name="ven" loop=$rfq}
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder{if $smarty.section.ven.index+1 == $total_vendors} bottomBorder{/if}"></td>
					<td width="24" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{$smarty.section.ven.index+1}
					</div></td>
					<td width="179" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{$vendors[ven].vendor_npwp}
					</div></td>
					<td width="91" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_delivery_time == 1}
					<input type="checkbox" value="1" checked="checked" name="doc_delivery_time[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_delivery_time[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_surat_jaminan == 1}
					<input type="checkbox" value="1" checked="checked" name="doc_surat_jaminan[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_surat_jaminan[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td width="73" valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ringsatu[ven].doc_copy_api == 1}
					<input type="checkbox" value="1" checked="checked" name="doc_copy_api[{$smarty.section.ven.index}]" />
					{else}
					<input type="checkbox" value="1" name="doc_copy_api[{$smarty.section.ven.index}]" />
					{/if}
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					{if $ssmp[ven].spek_teknis == 1}
					<input type="checkbox" checked="checked" disabled="disabled" name="doc_spek_teknis" />
					{else}
					<input type="checkbox" disabled="disabled" name="doc_spek_teknis" />
					{/if}
					</div></td>
					<td valign="middle" class="rightBorder bottomBorder"><div align="center">
					<select name="doc_keterangan[{$smarty.section.ven.index}]" class="btn" style="width: 50px;">
						<option value="-1">Pilih..</option>
						<option value="1"{if $ringsatu[ven].doc_keterangan == 1} selected="selected"{/if}>Lengkap</option>
						<option value="0"{if $ringsatu[ven].doc_keterangan == 0} selected="selected"{/if}>Tidak Lengkap</option>
					</select>
					</div></td>
				</tr>
				{/section}
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder">3.</td>
					<td colspan="3" valign="middle" class="rightBorder bottomBorder">
					Jumlah penawar yang lengkap					</td>
					<td colspan="4" valign="middle" class="rightBorder bottomBorder">
					<input type="text" name="doc_penawar_lengkap" value="{$ringsatu[0].doc_penawar_lengkap}" class="btn" />
					</td>
				</tr>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder">4.</td>
					<td colspan="3" valign="middle" class="rightBorder bottomBorder">
					Jumlah penawar yang tidak lengkap					</td>
					<td colspan="4" valign="middle" class="rightBorder bottomBorder">
					<input type="text" name="doc_penawar_tdk_lengkap" value="{$ringsatu[0].doc_penawar_tdk_lengkap}" class="btn" />
					</td>
				</tr>
				<tr>
					<td width="12" valign="top" class="leftBorder rightBorder bottomBorder">5.</td>
					<td colspan="3" valign="top" class="rightBorder bottomBorder">
					Alasan bagi penawaran yang diklarifikasi					</td>
					<td colspan="4" valign="middle" class="rightBorder bottomBorder">
					<textarea name="doc_penawar_klarifikasi" rows="5" class="btn" value="">{$ringsatu[0].doc_penawar_klarifikasi}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="8" valign="top" align="center">
					</td>
				</tr>
		  </table>
		</p>
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Ringkasan II</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  <div align="center"><h4>RINGKASAN PELAKSANAAN PENGADAAN</h4></div>
		<p>&nbsp;</p>
		<p><strong>III. DATA PENGADAAN (Lanjutan) - </strong><input type="button" value="Print to PDF" onclick="print_to_pdf2()" /></strong></p>
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
	  {section name="ven" loop=$vendors}
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder{if $smarty.section.ven.index+1 == $total_vendors} bottomBorder{/if}"></td>
		  <td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">{$vendors[ven].vendor_name}</div></td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder"><div align="center">
		  	<select name="doc_administrasi[{$smarty.section.ven.index}]" class="btn" style="width: 75px;">
				<option value="-1">Pilihan</option>
				<option value="1"{if $ringsatu[ven].doc_administrasi == 1} selected{/if}>Memenuhi</option>
				<option value="0"{if $ringsatu[ven].doc_administrasi == 0} selected{/if}>Tidak Memenuhi</option>
			</select>
		  </div></td>
		  <td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">
		  	<select name="doc_harga[{$smarty.section.ven.index}]" class="btn" style="width: 75px;">
				<option value="-1">Pilihan</option>
				<option value="1"{if $ringsatu[ven].doc_harga == 1} selected{/if}>Memenuhi</option>
				<option value="0"{if $ringsatu[ven].doc_harga == 0} selected{/if}>Tidak Memenuhi</option>
			</select>
		  </div></td>
	  </tr>
	  {/section}
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">7.</td>
		  <td colspan="2" valign="top" class="rightBorder bottomBorder">
		  	Penjelasan untuk masing-masing perusahaan apabila penawaran tidak memenuhi syarat		  </td>
		  <td colspan="5" valign="middle" class="rightBorder bottomBorder">
		  	<textarea name="doc_penjelasan" cols="30" rows="5" class="btn">{$ringsatu[0].doc_penjelasan}</textarea>		  </td>
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
		<td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">Harga ({$quo_currency})<br />
		  Sesuai Penawaran<br />
		  (tidak termasuk PPN)
</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">Delivery Time </div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">Ditandatangani oleh Berwenang (Ya/Tidak) </div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">Masa Berlaku Penawaran (Ya/Tidak) </div></td>
	  </tr>
	  {section name="ven" loop=$vendors}
	  <tr>
	  	<td valign="middle" class="leftBorder rightBorder{if $smarty.section.ven.index+1 == $total_vendors} bottomBorder{/if}">&nbsp;</td>
		<td width="187" valign="middle" class="rightBorder bottomBorder"><div align="center">{$smarty.section.ven.index+1}</div></td>
		<td width="188" valign="middle" class="rightBorder bottomBorder"><div align="center">{$vendors[ven].vendor_name}</div></td>
		<td colspan="2" valign="middle" class="rightBorder bottomBorder"><div align="center">
			{if $vendors[ven].vendor_id == $winner.vendor_id}{$winner.harga_penawaran}{/if}
		</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">
			{$rfq[ven].rfq_delivery_time}
		</div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<select name="doc_tdtgn_berwenang[{$smarty.section.ven.index}]" class="btn" style="width: 75px;">
				<option value="-1">Pilihan</option>
				<option value="1"{if $ringsatu[ven].doc_tdtgn_berwenang == 1} selected{/if}>Ya</option>
				<option value="0"{if $ringsatu[ven].doc_tdtgn_berwenang == 0} selected{/if}>Tidak</option>
			</select>
		</div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<select name="doc_masa_berlaku[{$smarty.section.ven.index}]" class="btn" style="width: 75px;">
				<option value="-1">Pilihan</option>
				<option value="1"{if $ringsatu[ven].doc_masa_berlaku == 1} selected{/if}>Ya</option>
				<option value="0"{if $ringsatu[ven].doc_masa_berlaku == 0} selected{/if}>Tidak</option>
			</select>
		</div></td>
	  </tr>
	  {/section}
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">9.</td>
		  <td colspan="4" valign="top" class="bottomBorder">
		  	Harga terendah yang sah dan memenuhi syarat		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	{$quo_currency} {$winner.harga_penawaran}		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">10.</td>
		  <td colspan="4" valign="top" class="bottomBorder">
		  	Harga tertinggi yang sah dan memenuhi syarat		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<input type="text" name="doc_harga_tertinggi" value="{$ringsatu[0].doc_harga_tertinggi}" class="btn" />		  </td>
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
		<td width="190" valign="middle" class="rightBorder bottomBorder"><div align="center">Nilai (IDR) Semula tidak termasuk PPN
</div></td>
		<td width="135" valign="middle" class="rightBorder bottomBorder"><div align="center">Delivery Time</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">Nilai ({$quo_currency}) Menjadi tidak termasuk PPN</div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">Delivery Time</div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">Ranking</div></td>
	  </tr>
	  <tr>
	  	<td valign="middle" class="leftBorder rightBorder bottomBorder">&nbsp;</td>
		<td width="187" valign="middle" class="rightBorder bottomBorder"><div align="center">1</div></td>
		<td width="188" valign="middle" class="rightBorder bottomBorder"><div align="center">{$winner.vendor_name}</div></td>
		<td width="190" valign="middle" class="rightBorder bottomBorder"><div align="center">{$winner.harga_penawaran}</div></td>
		<td width="135" valign="middle" class="rightBorder bottomBorder"><div align="center">{$winner.delivery_time}</div></td>
		<td width="184" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<input type="text" class="btn" value="{$ringsatu[0].doc_harga_penawaran_menjadi}" name="doc_harga_penawaran_menjadi" style="width: 75px;" />
		</div></td>
		<td width="93" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<input type="text" class="btn" value="{$ringsatu[0].doc_delivery_time_menjadi}" name="doc_delivery_time_menjadi" style="width: 75px;" />
		</div></td>
	    <td width="75" valign="middle" class="rightBorder bottomBorder"><div align="center">
			<input type="text" class="btn" value="{$ringsatu[0].doc_peringkat}" name="doc_peringkat" style="width: 25px;" />
		</div></td>
    </tr>
	   <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">12.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Harga terendah yang sah setelah negosiasi
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">{$quo_currency} {$ringsatu[0].doc_harga_penawaran_menjadi}		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">13.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Perusahaan yang diusulkan
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	{$winner.vendor_name}
		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">14.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Harga usulan
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
			<input type="text" name="doc_harga_usulan" value="{$ringsatu[0].doc_harga_usulan}" class="btn" />
		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">15.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Jangka waktu pelaksanaan/Delivery Time
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">{$ringsatu[0].doc_delivery_time_menjadi}</td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">16.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Alasan yang jelas untuk perusahaan yang diusulkan (baik secara teknis maupun ekonomis)
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<textarea name="doc_alasan_usulan" cols="30" rows="5" class="btn">{$ringsatu[0].doc_alasan_usulan}</textarea>
		  </td>
	  </tr>
	  <tr>
		  <td width="20" valign="top" class="leftBorder rightBorder bottomBorder">17.</td>
		  <td colspan="4" valign="top" class="rightBorder bottomBorder">
		  	Keterangan lain
		  </td>
		  <td colspan="3" valign="middle" class="rightBorder bottomBorder">
		  	<textarea name="doc_keterangan_lain" cols="30" rows="5" class="btn">{$ringsatu[0].doc_keterangan_lain}</textarea>
		  </td>
	  </tr>
	</table>
	<p>&nbsp;</p>
	<table border="0" width="600" cellpadding="0" cellspacing="0" class="smallText">
		  <td width="50%" valign="top">&nbsp;</td>
		  <td width="50%" valign="top">Jakarta, {$smarty.now|date_format}</td>
	      <tr>
	        <td valign="top">&nbsp;</td>
	        <td valign="top">&nbsp;</td>
      <tr>
        <td valign="top">Menyetujui/Tidak Menyetujui </td>
        <td valign="top">Panitia Pengadaan Barang/Jasa</td>
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
					  	<input type="text" name="doc_direktur_utama" value="{$ringsatu[0].doc_direktur_utama}" class="btn" />
					  </td>
	                  <td valign="top">{$ssmp[0].panitia_ketua}</td></tr>
    </table>
		</p>
		<div style="width: 600px;" align="center"><br />&nbsp;<br /><input type="submit" value="MASUKKAN" name="submitRi1" /></div>
	</form>
	<script language="javascript">
		var frmvalidator  = new Validator("docForm");
		frmvalidator.clearAllValidations();
		
		frmvalidator.setAddnlValidationFunction("validateSubmit");
		frmvalidator.addValidation("doc_direktur_utama","req", "Mohon Masukkan Approval Person!");
	</script>
	<div id="calInit">
	    {dhtml_calendar inputField="doc_ambil_dok_lelang" ifFormat="%d %B %Y" button="cal_req_date1" singleClick=false}
		{dhtml_calendar inputField="doc_tutup_lelang" ifFormat="%d %B %Y" button="cal_req_date2" singleClick=false}
		{dhtml_calendar inputField="doc_batal_lelang" ifFormat="%d %B %Y" button="cal_req_date3" singleClick=false}
    </div>
    </p>
	{/if}
    <p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
</div>
{include file="footer.tpl"}