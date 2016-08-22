{include file="header.tpl"}
{include file="divuser-conditional.tpl"}
<div id="wide" style="float: left; margin-left: 20px; width: 900px; font-size: 7pt;">
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Request - Approved/Winner</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Berikut adalah Daftar Tender yang anda majukan yang telah disetujui ataupun yang telah mempunyai pemenang.
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px"><strong>No.</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Status</strong></td>
                <td valign="top" style="padding: 5px"><strong>Tanggal Request</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Type</strong></td>
                <td valign="top" style="padding: 5px"><strong>Purpose</strong></td>
				<td valign="top" style="padding: 5px"><strong>Winning Vendor</strong></td>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            {if $no-records == 0}
            {section name=tender loop=$tenders}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px">{$smarty.section.tender.index+1}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].request_status|capitalize}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].req_type|capitalize}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].req_purpose|upper}</td>
				<td valign="top" style="padding: 5px">{$tenders[tender].vendor_name|upper}</td>
                <td valign="top" style="padding: 5px"><a href="?mod=divuser&act=view&tender_id={$tenders[tender].tender_id}">VIEW</a></td>
            </tr>
            {/section}
            {else if $no-records == 1}
            <tr bgcolor="#cccccc">
            	<td colspan="6" valign="top" style="padding: 5px" align="center">
                	<strong>BELUM ADA REQUEST YANG ANDA MASUKKAN</strong>                </td>
            </tr>
            {/if}
  </table>
  </p>
  <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Request - Rejected</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Berikut adalah Daftar Tender yang anda majukan yang ditolak.
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px"><strong>No.</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Status</strong></td>
                <td valign="top" style="padding: 5px"><strong>Tanggal Request</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Type</strong></td>
                <td valign="top" style="padding: 5px"><strong>Purpose</strong></td>
				<td valign="top" style="padding: 5px"><strong>Reason</strong></td>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            {if $no-records2 == 0}
            {section name=tender loop=$rej}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px">{$smarty.section.tender.index+1}</td>
                <td valign="top" style="padding: 5px">{$rej[tender].request_status|capitalize}</td>
                <td valign="top" style="padding: 5px">{$rej[tender].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px">{$rej[tender].req_type|capitalize}</td>
                <td valign="top" style="padding: 5px">{$rej[tender].req_purpose|upper}</td>
				<td valign="top" style="padding: 5px">{$rej[tender].deleted_reason}</td>
                <td valign="top" style="padding: 5px"><a href="?mod=divuser&act=view&tender_id={$rej[tender].tender_id}">VIEW</a></td>
            </tr>
            {/section}
            {else if $no-records2 == 1}
            <tr bgcolor="#cccccc">
            	<td colspan="7" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA</strong>                </td>
            </tr>
            {/if}
  		</table>
	</p>
</div>
<br clear="all" />
<p>&nbsp;</p>
{include file="footer.tpl"}