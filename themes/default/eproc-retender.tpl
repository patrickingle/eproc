{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Lelang Ulang - {$tender.req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		<form name="batalForm" action="?mod=eproc&act=retender&tender_id={$_GET.tender_id}" method="post">
    	Apakah anda yakin ingin melelang ulang Tender ini?<br />
		<select name="choice" class="btn">
			<option value="-1">Mohon Pilih..</option>
			<option value="1">Ya</option>
			<option value="0">Tidak</option>
		</select>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
			Nama Tender:<br />
			<textarea name="req_purpose" cols="30" rows="7" class="btn">{$tender.req_purpose}</textarea>
			<br />
			<input type="submit" name="submitBatal" value=" LELANG ULANG " />
		</form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}