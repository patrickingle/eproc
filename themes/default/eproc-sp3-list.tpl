{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>SP3 - Belum Dibuat</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Berikut adalah daftar SP3 yang belum dibuat sebelumnya:
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%">
        	<tr bgcolor="#777">
            	<td valign="top" align="center" style="padding: 5px;"><strong>No.</strong></td>
                <td valign="top" align="center" style="padding: 5px;"><strong>Purpose</strong></td>
                <td valign="top" align="center" style="padding: 5px;"></td>
            </tr>
            {section name=s1 loop=$s1list}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center" style="padding: 5px;">{$smarty.section.s1.index+1}</td>
                <td valign="top" align="center" style="padding: 5px;">{$s1list[s1].req_purpose}</td>
                <td valign="top" align="center" style="padding: 5px;"><a href="?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$s1list[s1].tender_id}&tender_type={$s1list[s1].tender_type}&go=rfq">BUAT SAMPUL</a></td>
            </tr>
            {/section}
        </table>
	</p>
    <!--<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>SP3 - Telah Dibuat</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Berikut adalah daftar SP3 yang telah dibuat sebelumnya:
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%">
        	<tr bgcolor="#777">
            	<td valign="top" align="center" style="padding: 5px;"><strong>No.</strong></td>
                <td valign="top" align="center" style="padding: 5px;"><strong>Purpose</strong></td>
                <td valign="top" align="center" style="padding: 5px;"></td>
            </tr>
            {section name="ys1" loop=$ys1list}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center" style="padding: 5px;">{$smarty.section.ys1.index+1}</td>
                <td valign="top" align="center" style="padding: 5px;">{$ys1list[ys1].req_purpose}</td>
                <td valign="top" align="center" style="padding: 5px;"><a href="?mod=eproc&act=tender-approval&mode=app&step=3&tender_id={$ys1list[ys1].tender_id}&tender_type={$ys1list[ys1].tender_type}&go=rfq">VIEW</a></td>
            </tr>
            {/section}
        </table>
    </p>-->
    <p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}