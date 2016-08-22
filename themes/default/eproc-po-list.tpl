{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.success == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	PURCHASE ORDER SUKSES DIBUAT
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Purchase Order - Belum Dibuat</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
                <td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$uap[ua].req_purpose}</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=po&tender_id={$uap[ua].tender_id}&vendor_id={$uap[ua].vendor_id}">BUAT PO</a></td>
            </tr>
            {/section}
        </table>
    </p>
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Purchase Order - Sudah Dibuat</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
                <td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$po}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$po[ua].req_purpose}</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=po&tender_id={$po[ua].tender_id}&vendor_id={$po[ua].vendor_id}&disabled={$disabled}">VIEW</a></td>
            </tr>
            {/section}
        </table>
	</p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}