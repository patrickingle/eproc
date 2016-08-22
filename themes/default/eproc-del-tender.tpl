{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1 || $_userLevel == 2}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Penolakan Tender - {$req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Mohon tuliskan alasan penolakan tender dengan menggunakan Form dibawah ini. Jika tender telah dihapus, maka tender tersebut tidak akan diproses kembali. Mohon buat Tender Request baru jika ingin melakukan Tender ulang.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="delTender" action="index.php?mod=eproc&act=tender-approval&mode=del&tender_id={$_GET.tender_id}" method="post">
			Ditolak oleh: <strong>{$_SESSION.user.name}</strong><br />&nbsp;<br />
			<textarea name="deleted_reason" class="btn" rows="7" cols="50"></textarea>
			<br />&nbsp;<br />
			<input type="submit" name="submitDel" value=" TOLAK! " /> <input type="button" name="batalTolak" value=" KEMBALI KE TENDER LIST " onclick="top.location.href='index.php?mod=eproc&act=tender-list'" />
		</form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}