{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - BELUM Ditetapkan</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
				<td valign="top" align="center">Jenis Tender</td>
                <td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$uap[ua].req_purpose}</td>
				<td valign="top" align="center">{$uap[ua].type_name}</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=tender-approval&mode=app&step=3&go=penetapan&tender_id={$uap[ua].tender_id}&tender_type={$uap[ua].tender_type}">TETAPKAN</a></td>
            </tr>
            {/section}
        </table>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    
    </p>
</div>
{/if}
{include file="footer.tpl"}