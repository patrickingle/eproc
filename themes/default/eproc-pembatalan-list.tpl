{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.success == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	TENDER SUKSES DIBATALKAN
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Pembatalan</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
				<td valign="top" align="center">Tanggal</td>
				<td valign="top" align="center">Jenis Tender</td>
                <td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$uap[ua].req_purpose}</td>
				<td valign="top" align="center">{$uap[ua].created_date|date_format:"%d %b %y"}</td>
				<td valign="top" align="center">{$uap[ua].type_name}</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=pembatalan&tender_id={$uap[ua].tender_id}">BATALKAN</a></td>
            </tr>
            {/section}
        </table>
    </p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender yang Dibatalkan</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">&nbsp;
    	<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
				<td valign="top" align="center">Tanggal</td>
				<td valign="top" align="center">Alasan</td>
            </tr>
            {section name=ua loop=$btl}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$btl[ua].req_purpose}</td>
				<td valign="top" align="center">{$btl[ua].created_date|date_format:"%d %b %y"}</td>
				<td valign="top" align="center">{$btl[ua].deleted_reason}</td>
            </tr>
            {/section}
        </table>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}