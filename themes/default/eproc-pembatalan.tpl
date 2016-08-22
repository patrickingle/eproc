{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Pembatalan - {$tender.req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Mohon sebutkan alasan Pembatalan Tender dengan menggunakan Form dibawah ini.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="batalForm" action="?mod=eproc&act=pembatalan&tender_id={$_GET.tender_id}" method="post">
			Alasan Pembatalan:<br />
			<textarea name="deleted_reason" cols="40" rows="5" class="btn"></textarea>
			<p>&nbsp;</p>
			<input type="submit" name="submitBatal" value=" BATALKAN " />
		</form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}