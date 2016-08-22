{include file="header.tpl"}
{include file="vendor-conditional.tpl"}
{include file="eproc-conditional.tpl"}
{literal}
<script language="javascript">
	function bidBtn(id) {
		if(confirm('Apakah anda yakin ingin mengikuti Tender ini? Quotation hanya bisa dimasukkan SEKALI saja.')) {
			top.location.href = '?mod=vendor&act=bid&tender_id=' + id + '&vendor_id={/literal}{$vid}{literal}';
		}
	}
</script>
{/literal}
<div id="wide" style="float: left; margin-left: 20px; width: 1000px; font-size: 10pt;">
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
		<h2>{$vendor_name}</h2>
	</p>
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Berjalan - Belum ada Quotation</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Dibawah ini merupakan Daftar Tender Berjalan. Mohon gunakan tombol QUOTE untuk melakukan proses bidding anda. Quotation hanya bisa dimasukkan SEKALI, oleh karena itu, mohon hati-hati dengan isian anda.
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="80%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px">No.</td>
                <td valign="top" style="padding: 5px">Purpose</td>
                <td valign="top" style="padding: 5px">Tanggal Request</td>
                <td valign="top" style="padding: 5px">Request Type</td>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            {section name=tender loop=$tenders}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px">{$smarty.section.tender.index+1}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].req_purpose|capitalize}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].req_type|capitalize}</td>
                <td valign="top" style="padding: 5px">
                	<input type="button" value=" QUOTE " onclick="javascript:bidBtn({$tenders[tender].tender_id})" name="bidBtn" />
                </td>
            </tr>
            {/section}
        </table>
    </p>
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Berjalan - Sudah ada Quotation</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Dibawah ini merupakan daftar Tender yang anda sudah masukkan Quotation.
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		<table border="0" cellpadding="0" cellspacing="0" width="80%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px">No.</td>
                <td valign="top" style="padding: 5px">Purpose</td>
                <td valign="top" style="padding: 5px">Tanggal Request</td>
                <td valign="top" style="padding: 5px">Request Type</td>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            {section name=tender loop=$quoted}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px">{$smarty.section.tender.index+1}</td>
                <td valign="top" style="padding: 5px">{$quoted[tender].req_purpose|capitalize}</td>
                <td valign="top" style="padding: 5px">{$quoted[tender].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px">{$quoted[tender].req_type|capitalize}</td>
                <td valign="top" style="padding: 5px">
                	<a href="index.php?mod=vendor&vendor_id={$vid}&tender_id={$quoted[tender].tender_id}&act=bid">VIEW</a>
                </td>
            </tr>
            {/section}
        </table>
	</p>
</div>
<br clear="all" />
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
{include file="footer.tpl"}