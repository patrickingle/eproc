{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
{literal}
<script language="javascript">
	function approveTender(tid, idx) {
		tenderType = document.getElementById('tender_type' + idx).value;
		if(confirm('Apakah anda yakin ingin menyetujui Tender ini?')) {
			url = '?mod=eproc&act=tender-approval&mode=app&step=2&tender_id=';
			url2 = tid + '&tender_type=' + tenderType;
			top.location.href = url + url2;
		}
	}
	function delTender(tid) {
		if(confirm('Apakah anda yakin ingin menolak TENDER ini?')) {
			top.location.href='?mod=eproc&act=tender-approval&mode=del&tender_id=' + tid;
		}
	}
</script>
{/literal}
{/if}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_appTender == 1}
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>TENDER TELAH APPROVE</strong></span>
    </p>
    {/if}
	{if $_delTender == 1}
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>TENDER TELAH DITOLAK</strong></span>
    </p>
    {/if}
	{if $ditetapkan == 1}
	<p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>PEMENANG TENDER TELAH DITETAPKAN</strong></span>
    </p>
	{/if}
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Pending Approval</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px"><strong>No.</strong></td>
              <td valign="top" style="padding: 5px"><strong>Request Status</strong></td>
              <td valign="top" style="padding: 5px"><strong>Tanggal Request</strong></td>
              <td valign="top" style="padding: 5px"><strong>Request Type</strong></td>
              <td valign="top" style="padding: 5px"><strong>Purpose</strong></td>
              {if $_userLevel == 1}
                <td valign="top" style="padding: 5px"><strong>Jenis Tender</strong></td>
              <td valign="top" style="padding: 5px"><strong>Approval</strong></td>
              <td valign="top" style="padding: 5px">&nbsp;</td>
                {/if}
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            {section name=tender loop=$tenders}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px">{$smarty.section.tender.index+1}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].request_status|capitalize}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].req_type|capitalize}</td>
                <td valign="top" style="padding: 5px">{$tenders[tender].req_purpose|capitalize}</td>
                {if $_userLevel == 1}
                <td valign="top" style="padding: 5px">
                	<select id="tender_type{$smarty.section.tender.index+1}" name="tender_type{$smarty.section.tender.index+1}" class="textBox">
                    	{section name=type loop=$types}
                        	<option value="{$types[type].type_id}">{$types[type].type_desc}</option>
                        {/section}
                    </select>                </td>
                <td valign="top" style="padding: 5px">
                	<input type="button" value="APPROVE" name="appBtn{$smarty.section.tender.index+1}" onclick="approveTender({$tenders[tender].tender_id}, {$smarty.section.tender.index+1});" />                </td>
                <td valign="top" style="padding: 5px">
                	<input type="button" value="TOLAK" name="delBtn{$smarty.section.tender.index+1}" onclick="delTender({$tenders[tender].tender_id})" />                </td>
                {/if}
                <td valign="top" style="padding: 5px"><a href="?mod=divuser&act=view&tender_id={$tenders[tender].tender_id}">VIEW</a></td>
            </tr>
            {/section}
            <!--<tr bgcolor="#cccccc">
            	<td colspan="9" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA!</strong>                </td>
            </tr>
			<tr bgcolor="#cccccc">
            	<td colspan="6" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA!</strong>                </td>
            </tr>-->
        </table>
</p>
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Approved</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
			  <td valign="top" style="padding: 5px" align="center"><strong>No.</strong></td>
			  <td valign="top" style="padding: 5px" align="center"><strong>Purpose</strong></td>
			  <td valign="top" style="padding: 5px" align="center"><strong>Status</strong></td>
              <td valign="top" style="padding: 5px" align="center"><strong>Tanggal Request</strong></td>
              <td valign="top" style="padding: 5px" align="center"><strong>Request Type</strong></td>
			  <td valign="top" style="padding: 5px" align="center"><strong>Jenis Tender</strong></td>
              <td valign="top" style="padding: 5px" align="center">&nbsp;</td>
            </tr>
            {section name=approved loop=$appr}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px" align="center">{$smarty.section.approved.index+1}</td>
				<td valign="top" style="padding: 5px">{$appr[approved].req_purpose|capitalize}</td>
				<td valign="top" style="padding: 5px" align="center"><strong>{$appr[approved].status}</strong></td>
                <td valign="top" style="padding: 5px" align="center">{$appr[approved].created_date|date_format:"%d-%m-%Y"}</td>
                <td valign="top" style="padding: 5px" align="center">{$appr[approved].req_type|capitalize}</td>
				<td valign="top" style="padding: 5px" align="center">{$appr[approved].type_desc}</td>
                <td valign="top" style="padding: 5px">
				{if $appr[approved].status == "RFQ Empty"}
					<a href="index.php?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$appr[approved].tender_id}&tender_type={$appr[approved].tender_type}&go=rfq">VIEW</a>
				{elseif $appr[approved].status == "Quotation Empty"}
					<a href="index.php?mod=eproc&act=quo-list">VIEW</a>
				{elseif $appr[approved].status == "1 Sampul Empty"}
					<a href="index.php?mod=eproc&act=1sampul-list">VIEW</a>
				{elseif $appr[approved].status == "2 Sampul 1 Empty" || $appr[approved].status == "2 Sampul 2 Empty"}
					<a href="index.php?mod=eproc&act=2sampul-list">VIEW</a>
				{elseif $appr[approved].status == "No Winner"}
					<a href="index.php?mod=eproc&act=penetapan-list">VIEW</a>
				{/if}
				</td>
            </tr>
            {/section}
            <!--<tr bgcolor="#cccccc">
            	<td colspan="7" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA!</strong>                </td>
            </tr>-->
        </table>
  </p>
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong><a name="ditetapkan">Daftar Tender - Telah Ditetapkan</a></strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px" align="center"><strong>No.</strong></td>
                <td valign="top" style="padding: 5px" align="center"><strong>Purpose</strong></td>
				<td valign="top" style="padding: 5px" align="center"><strong>Status</strong></td>
                <td valign="top" style="padding: 5px" align="center"><strong>Tanggal Penetapan</strong></td>
				<td valign="top" style="padding: 5px" align="center"><strong>Jenis Tender</strong></td>
                <td valign="top" style="padding: 5px" align="center"><strong>Pemenang Tender</strong></td>
                <td valign="top" style="padding: 5px" align="center">&nbsp;</td>
            </tr>
			{if $pntp[0].won_date > 0}
            {section name=tetap loop=$pntp}
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px" align="center">{$smarty.section.tetap.index+1}</td>
                <td valign="top" style="padding: 5px" align="center">{$pntp[tetap].req_purpose}</td>
				<td valign="top" style="padding: 5px" align="center"><strong>{$pntp[tetap].status}</strong></td>
                <td valign="top" style="padding: 5px" align="center">{$pntp[tetap].won_date|date_format:"%d-%m-%Y"}</td>
				<td valign="top" style="padding: 5px" align="center">{$pntp[tetap].tender_type}</td>
                <td valign="top" style="padding: 5px" align="center">{$pntp[tetap].vendor_name|capitalize}</td>
                <td valign="top" style="padding: 5px">
				{if $pntp[tetap].status == "Dokumentasi Empty"}
					<a href="?mod=eproc&act=dokumentasi&tender_id={$pntp[tetap].tender_id}&tender_type={$pntp[tetap].type_id}">VIEW</a>
				{else}
					<a href="index.php?mod=eproc&act=po&tender_id={$pntp[tetap].tender_id}&vendor_id={$pntp[tetap].win_vendor}&disabled=+disabled">VIEW</a>
				{/if}
				</td>
            </tr>
            {/section}
			{/if}
  </table>
    </p>
</div>
<br clear="all" />&nbsp;<br />
{include file="footer.tpl"}