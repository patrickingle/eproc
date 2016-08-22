{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.successDel == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	SUKSES DIHAPUS
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>PENGHAPUSAN - {$user.user_name}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Mohon sebutkan alasan anda ingin menghapus:
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
		<form name="delForm" method="post" action="index.php?mod=eproc&act=del-user&user_id={$_GET.user_id}">
    	<textarea name="deleted_reason" cols="30" rows="5" class="btn"></textarea>
		<br />&nbsp;<br />
		<input type="submit" name="submitDel" value=" HAPUS " />
		</form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}