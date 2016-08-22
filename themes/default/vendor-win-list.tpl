{include file="header.tpl"}
{include file="vendor-conditional.tpl"}
<div id="wide" style="float: left; margin-left: 20px; width: 1000px; font-size: 10pt;">
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Yang Dimenangi</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Dibawah ini merupakan Daftar Tender yang telah dimenangkan oleh Perusahaan anda.
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
            {section name=tender loop=$won}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px">{$smarty.section.tender.index+1}</td>
                <td valign="top" style="padding: 5px">{$won[tender].req_purpose|capitalize}</td>
                <td valign="top" style="padding: 5px">{$won[tender].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px">{$won[tender].req_type|capitalize}</td>
                <td valign="top" style="padding: 5px">
                	<a href="index.php?mod=vendor&vendor_id={$vid}&tender_id={$won[tender].tender_id}&act=bid">VIEW</a>
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