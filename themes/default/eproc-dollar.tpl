{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.success == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	KURS DOLLAR SUKSES DIUBAH
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Application Settings - Kurs Dollar</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Gunakan Form dibawah ini untuk menentukan Mail Server yang hendak anda gunakan untuk pengiriman email.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="smtpForm" action="?mod=eproc&act=dollar&success=1" method="post">
			Kurs Dollar:<br />
			<textarea name="kurs_dollar" cols="40" rows="5" class="btn">{$kurs}</textarea>
			<p>&nbsp;</p>
			<input type="submit" name="submitDollar" value=" MASUKKAN " />
		</form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}