{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1 || $_userLevel == 2}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Dokumentasi - Belum Dibuat</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Berikut dibawah ini adalah Daftar Dokumentasi yang belum dibuat.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Purpose</td>
				<td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$uap[ua].req_purpose}</td>
				<td valign="top" align="center">
					<input type="button" value=" BUAT " onclick="top.location.href='index.php?mod=eproc&act=dokumentasi&tender_id={$uap[ua].tender_id}&tender_type={$uap[ua].tender_type}'" />
				</td>
            </tr>
            {/section}
        </table>
    </p>
	<!--<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Dokumentasi - Telah Dibuat</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Berikut dibawah ini adalah Dokumentasi yang telah dibuat sebelumnya.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Purpose</td>
				<td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$doc[ua].req_purpose}</td>
				<td valign="top" align="center">
					<input type="button" value=" VIEW " onclick="top.location.href='index.php?mod=eproc&act=dokumentasi&tender_id={$doc[ua].tender_id}&tender_type={$doc[ua].tender_type}'" />
				</td>
            </tr>
            {/section}
        </table>
    </p>-->
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}