{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_eNoneSelected == 1}
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>MOHON PILIH VENDOR YANG DIKEHENDAKI</strong></span>
    </p>
    {/if}
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>RFQ List</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Berikut adalah daftar RFQ yang belum dibuat sebelumnya:
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%">
        	<tr bgcolor="#777">
            	<td valign="top" align="center" style="padding: 5px;"><strong>No.</strong></td>
                <td valign="top" align="center" style="padding: 5px;"><strong>Purpose</strong></td>
                <td valign="top" align="center" style="padding: 5px;"></td>
            </tr>
            {section name="rfq" loop=$rfqs}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center" style="padding: 5px;">{$smarty.section.rfq.index+1}</td>
                <td valign="top" align="center" style="padding: 5px;">{$rfqs[rfq].req_purpose}</td>
                <td valign="top" align="center" style="padding: 5px;"><a href="?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$rfqs[rfq].tender_id}&tender_type={$rfqs[rfq].tender_type}&go=rfq">VIEW</a></td>
            </tr>
            {/section}
        </table>
</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}