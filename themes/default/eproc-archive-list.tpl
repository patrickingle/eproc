{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1 || $_userLevel == 2}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Archive List {$tender.tender_name}</strong>
	</p>
	{if $_GET.tender_id == 0}
    <p style="margin-top: 10px; font-size: 11pt">
		Berikut dibawah ini adalah Daftar Tender yang ada. Klik pada PURPOSE tender untuk melihat dokumen-dokumen yang tersedia.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center"><strong>No.</strong></td>
                <td valign="top" align="center"><strong>Purpose</strong></td>
				<td valign="top" align="center"><strong>Tgl Pembuatan</strong></td>
            </tr>
			{section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">
					<a href="index.php?mod=eproc&act=archive-list&tender_id={$uap[ua].tender_id}">
					{$uap[ua].req_purpose}
					</a>
				</td>
				<td valign="top" align="center">{$uap[ua].created_date|date_format:"%d %b %y"}</td>
            </tr>
			{/section}
  		</table>
    </p>
	{else}
	<p style="margin-top: 10px; font-size: 11pt">
		Dokumen yang tersedia untuk tender ini adalah:
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
                <td valign="top" align="center"><strong>Purpose</strong></td>
				<td valign="top" align="center"></td>
            </tr>
            <tr bgcolor="#ddd">
                <td valign="top" align="center">
					Material/Service Requisition Form
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=divuser&act=view&tender_id={$_GET.tender_id}">VIEW</a>
				</td>
            </tr>
			{if $tender.rfq == 1}
			<tr bgcolor="#ddd">
                <td valign="top" align="center">
					RFQ
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$_GET.tender_id}&tender_type={$tender.tender_type}&go=rfq">VIEW</a>
				</td>
            </tr>
			{/if}
			{if $tender.quoted == 1}
			<tr bgcolor="#ddd">
                <td valign="top" align="center">
					Quotation Form
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=eproc&act=quo-list&tender_id={$_GET.tender_id}">VIEW</a>
				</td>
            </tr>
			{/if}
			{if $tender.sampul1 == 1}
			<tr bgcolor="#ddd">
                <td valign="top" align="center">
					Sampul (1 Sampul)
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$_GET.tender_id}&tender_type={$tender.tender_type}&go=1sampul">VIEW</a>
				</td>
            </tr>
			{/if}
			{if $tender.sampul2 == 1}
			<tr bgcolor="#ddd">
                <td valign="top" align="center">
					Sampul (2 Sampul)
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$_GET.tender_id}&tender_type={$tender.tender_type}&go=2sampul">VIEW</a>
				</td>
            </tr>
			{/if}
			{if $tender.doc == 1}
			<tr bgcolor="#ddd">
                <td valign="top" align="center">
					Dokumentasi
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=eproc&act=dokumentasi&tender_id={$_GET.tender_id}&tender_type={$tender.tender_type}">VIEW</a>
				</td>
            </tr>
			{/if}
			{if $tender.po == 1}
			<tr bgcolor="#ddd">
                <td valign="top" align="center">
					Purchase Order Form
				</td>
				<td valign="top" align="center">
					<a href="index.php?mod=eproc&act=po&tender_id={$_GET.tender_id}&vendor_id={$tender.win_vendor}&disabled=+disabled">VIEW</a>
				</td>
            </tr>
			{/if}
  		</table>
    </p>
	{/if}
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}