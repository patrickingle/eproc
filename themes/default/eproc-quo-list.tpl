{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.success == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	TENDER SUKSES DILELANG ULANG
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Quotation</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		Dibawah ini merupakan Daftar Quotation yang diurutkan berdasarkan tender-tender yang ada.
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<table border="0" cellpadding="0" cellspacing="0" width="80%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center"><strong>No.</strong></td>
                <td valign="top" align="center"><strong>Nama Tender</strong></td>
				<td valign="top" align="center"><strong>Tanggal</strong></td>
                <td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$uap}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$uap[ua].req_purpose}</td>
				<td valign="top" align="center">{$uap[ua].created_date|date_format:"%d %b %y"}</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=quo-list&tender_id={$uap[ua].tender_id}">QUOTE</a></td>
            </tr>
            {/section}
  		</table>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">&nbsp;
    	
  </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}