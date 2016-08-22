	<!-- PENETAPAN VENDOR -->
	{literal}
	<script language="javascript">
		function tetapkan(id) {
			document.getElementById('vendor_id').value = id;
			//alert(document.getElementById('vendor_id').value);
			if(confirm('Apakah anda yakin ingin menetapkan Vendor ini sebagai Pemenang?')) {
				document.getElementById('pntpForm').submit();
			}
		}
	</script>
	{/literal}
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Penetapan Vendor - {$tender.req_purpose}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Gunakan Form dibawah ini untuk menetapkan Vendor. Pilih Vendor dan tekan PILIH.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="pntpForm" id="pntpForm" action="{$PHP_SELF}&go=penetapan" method="post">
			<input type="hidden" id="vendor_id" name="vendor_id" value="0" />
			<table border="0" cellpadding="0" cellspacing="0" width="550" class="rfqTable">
				<tr bgcolor="#777">
					<td valign="top" align="center">No.</td>
					<td valign="top" align="center">Nama Vendor</td>
					<td valign="top" align="center">Jumlah Penawaran</td>
					<td valign="top" align="center">Peringkat</td>
					<td valign="top" align="center"></td>
				</tr>
				{section name=pv loop=$pvlist}
                <tr bgcolor="#ddd">
					<td valign="top" align="center">{$smarty.section.pv.index+1}</td>
					<td valign="top" align="center">{$pvlist[pv].vendor_name}</td>
					<td valign="top" align="center">{$pvlist[pv].req_currency} {$pvlist[pv].req_est_price}</td>
					<td valign="top" align="center">{$pvlist[pv].sampul_peringkat}</td>
					<td valign="top" align="center"><input type="button" value="PILIH" onclick="tetapkan({$pvlist[pv].vendor_id})" /></td>
				</tr>
                {/section}
			</table>
            <input type="hidden" name="tender_id" value="{$tender_id}" />
            <input type="hidden" name="yo" value="penetapan" />
        </form>
    </p>