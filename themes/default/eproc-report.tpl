{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{literal}
<script language="javascript">
	function submitYearly() {
		year = document.getElementById('yearly').value;
		url = '{/literal}{$repYearly}{literal}' + year;
		newwindow = window.open(url,'pdfWindow','height=700,width=1000,resizable=yes,scrollbars=yes,location=yes');
	}
</script>
{/literal}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Laporan Tender - Tahunan</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Gunakan Form dibawah untuk mendownload laporan tender-tender berdasarkan periode waktu.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Per Tahun:<br />
		<select class="btn" style="width: 50px" id="yearly">
			<option value="2008">2008</option>
			{section name=year loop=50}
			<option value="{$smarty.section.year.index+2009}">{$smarty.section.year.index+2009}</option>
			{/section}
		</select> <input type="button" value=" LIHAT REPORT " onclick="submitYearly()" />
    </p>
<!--	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Laporan Tender - Bulanan</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		Bulan:<br />
		<select class="btn" style="width: 75px" id="month">
			<option value="1">January</option>
			<option value="2">February</option>
			<option value="3">March</option>
			<option value="4">April</option>
			<option value="5">May</option>
			<option value="6">June</option>
			<option value="7">July</option>
			<option value="8">August</option>
			<option value="9">September</option>
			<option value="10">October</option>
			<option value="11">November</option>
			<option value="12">December</option>
		</select> <select class="btn" style="width: 50px" id="year">
			<option value="2008">2008</option>
			{section name=year loop=50}
			<option value="{$smarty.section.year.index+2009}">{$smarty.section.year.index+2009}</option>
			{/section}
		</select> <input type="button" value=" LIHAT REPORT " onchange="submitMonthly()" />
	</p>
-->	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}