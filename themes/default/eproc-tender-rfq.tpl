{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
{literal}
<script language="javascript">
	function goRFQ(id, ttype, tid) {
		if(id > 0) {
			url = "index.php?mod=eproc&act=tender-approval&go=rfq&mode=app&step=3&tender_id=" + 
				  tid + "&tender_type=" + ttype + "&vendor_id=" + id;
			top.location.href = url;
		} else {
			alert("Mohon pilih vendor yang ingin dikehendaki");
		}
	}
	function goPntp() {
		id = document.getElementById('pntpId').value;
		if(id > 0 && confirm('Apakah anda yakin ingin menetapkan Vendor ini sebagai pemenang?')) {
			document.getElementById('pntpForm').submit();
		}
	}
</script>
{/literal}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_madeRFQ == 1}
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>RFQ Sukses Dibuat</strong></span>
    </p>
    {/if}
    {if $disabled == " disabled" && $go == "rfq"}
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>RFQ Sudah Pernah Dibuatkan. Mohon pilih vendor lain.</strong></span>
    </p>
    {/if}
    {if $go == "rfq"}
    <!-- RFQ Form -->
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Request for Quotation - {$tender.req_purpose}</strong>
        </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Mohon gunakan <em>drop down box</em> dibawah ini untuk memilih vendor mana yang ingin dibuatkan RFQ. Jika anda telah selesai membuatkan RFQ, mohon lanjutkan dengan menggunakan menu di sebelah kiri untuk membuat Berita Acara menurut jenis sampul.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
   	  <select name="vendor_list" class="textBox" id="vendor_list" style="font-size: 10pt;">
	   	  <option value="0">Mohon Pilih..</option>
            {section name=vl loop=$vlist}
            <option value="{$vlist[vl].vendor_id}">{$vlist[vl].vendor_name}</option>
            {/section}
        </select> <input type="button" onclick="goRFQ(document.getElementById('vendor_list').value, {$tender_type}, {$tender_id})" value=" PILIH " name="selBtn" style="font-size: 10pt;" /> <input style="font-size: 10pt;" onclick="top.location.href='{$next}'" type="button" value=" NEXT&raquo; " />
  	</p>
  	{if $showRfq == 1}
    {include file="eproc-rfq-form.tpl"}
    {/if}
    {/if}
	<p>&nbsp;</p>
    {if $go == "1sampul"}
    <!-- PEMBUATAN 1 SAMPUL -->
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Pembuatan 1 Sampul - {$tender.req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Masukkan jumlah penawaran tiap vendor dan kelengkapan dokumen vendor dengan menggunakan form dibawah ini.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  		{if $tender_type == 3 || $tender_type == 5 || $tender_type == 8}
        {include file="eproc-1sampul.tpl"}
        {/if}
    </p>
    {/if}
    <p>&nbsp;</p>
    {if $go == "penetapan"}
    {include file="eproc-penetapan.tpl"}
    {/if}
    {if $go == "2sampul"}
    {include file="eproc-2sampul.tpl"}
    {/if}
    {if $go == "2sampul2"}
    {include file="eproc-2sampul2.tpl"}
    {/if}
	{if $go == "2sampul-complete"}
	{include file="eproc-2sampul-complete.tpl"}
	{/if}
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}