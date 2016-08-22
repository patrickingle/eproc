{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Application Settings - Mail Server</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Gunakan Form dibawah ini untuk menentukan Mail Server yang hendak anda gunakan untuk pengiriman email.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="smtpForm" action="?mod=eproc&act=smtp" method="post">
			SMTP Server:<br />
			<textarea name="smtp_server" cols="40" rows="5" class="btn">{$smtp.smtp_server}</textarea>
			<p>&nbsp;</p>
			SMTP Port:<br />
			<input type="text" class="btn" name="smtp_port" value="{$smtp.smtp_port}" />
			<p>&nbsp;</p>
			<input type="submit" name="submitSmtp" value=" MASUKKAN " />
		</form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}