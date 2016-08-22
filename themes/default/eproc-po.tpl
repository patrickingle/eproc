{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
{if $url != ''}
{literal}
<script language="javascript">
	top.location.href = '{/literal}{$url}{literal}';
</script>
{/literal}
{/if}
{literal}
<script language="javascript">
	function print_to_pdf() {
		html2ps = '{/literal}{$html2pspo1}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
	function print_to_pdf2() {
		html2ps = '{/literal}{$html2pspo2}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
</script>
{/literal}
<div id="wide" style="float: left; margin-left: 20px; width: 1000px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Purchase Order Form</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Mohon gunakan Form dibawah ini untuk membuat PO. Klik tombol MASUKKAN dibawah Form pada saat anda telah selesai.
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
	<input type="button" value="Print to PDF" onclick="print_to_pdf()" />
	<form name="poForm" action="index.php?mod=eproc&act=po&tender_id={$_GET.tender_id}&vendor_id={$_GET.vendor_id}" method="post">
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class="rfqTable fBorder" style="font-size: 9px;">
	  <tr>
		  <td class="bottomBorder" colspan="2" valign="top"><img src="/themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" /></td>
		<td width="232" class="bottomBorder" valign="top"><strong>PT. PERTAMINA (PERSERO)<br />
		</strong>PERTAGAS, GD Oil Center Lt. 2 &amp; 3 Jl MH Thamrin No. 55<br />
		  Jakarta - 10350</td>
		<td width="261" class="bottomBorder" valign="bottom">Purch Organization: PT. PERTAMINA GAS</td>
		<td width="154" class="bottomBorder" valign="bottom">Delivery Time: {$po.rfq_terms_of_delivery} </td>
	  </tr>
	  <tr>
		  <td width="198" rowspan="2" valign="top" class="bottomBorder rightBorder"><strong>Purchase Order<br />
		  PO</strong>
	      <select class="btn" name="po_type"{$_GET.disabled}>
		  	<option value="0">Pilihan..</option>
			<option value="material"{if $apo.po_type == 'material'} selected{/if}>Material</option>
			<option value="service"{if $apo.po_type == 'service'} selected{/if}>Service</option>
		  </select>
	      <br />
	      To:<br />
	      <br />
	      {$po.vendor_name|upper}<br />
	      {$po.vendor_addr}, {$po.vendor_city}, {$po.vendor_state} , {$po.vendor_zip} </td>
	      <td width="155" rowspan="2" valign="top" class="bottomBorder">PO NUMBER/DATE<br />
		  {$apo.po_number}
		  <br />
		  YOUR REFERENCE/DATE<br />
		  <input type="text" name="po_your_ref" value="{$apo.po_your_ref}"{$_GET.disabled} class="btn" />
		  <br />
		  VENDOR NPWP:<br />
		  {$po.vendor_npwp}		  </td>
	      <td rowspan="2" valign="top" class="bottomBorder rightBorder">SHIP TO:<br />
		  <textarea name="po_ship_to" class="btn"{$_GET.disabled}>{$apo.po_ship_to}</textarea>		  </td>
	      <td valign="top" class="bottomBorder">
		  PAYMENT TO:<br />
		  <textarea name="po_payment_to" class="btn"{$_GET.disabled}>{$apo.po_payment_to}</textarea><br />
		  Account No:<br /><input type="text" name="po_acc_no"{$_GET.disabled} class="btn" value="{$apo.po_acc_no}" />		  </td>
	      <td valign="top" class="bottomBorder">
		  DELIVERY DATE:<br />
		  <input type="text" id="po_delivery_date" name="po_delivery_date" class="btn"{$_GET.disabled} value="{$apo.po_delivery_date|date_format:"%d %b %y"}" /> <img id="cal_req_date1" alt="" src="{$templateDir}/images/cal.png" />		  </td>
	  </tr>
	  <tr>
		  <td colspan="2" class="bottomBorder" valign="top">IMPORTANT:<br />
		  <textarea name="po_important" class="btn"{$_GET.disabled}>{$apo.po_important}</textarea>		  </td>
      </tr>
	  <tr>
		  <td colspan="2" class="bottomBorder" valign="top">Terms of Delivery:<br />
		  <input type="text" name="po_terms_of_delivery" class="btn"{$_GET.disabled} value="{$apo.po_terms_of_delivery}" />		  </td>
	      <td valign="top" class="bottomBorder">CURRENCY: {$quo_currency|upper}</td>
	      <td valign="top" class="bottomBorder">Payment Method:<br />
		  	<input type="text" name="po_payment_method" class="btn"{$_GET.disabled} value="{$apo.po_payment_method}" />		  </td>
	      <td valign="top" class="bottomBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="5" valign="top" style="padding: 0">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="4%" valign="top" class="bottomBorder rightBorder"><strong>Item</strong></td>
					<td width="10%" valign="top" class="bottomBorder rightBorder"><strong>Material No</strong></td>
					<td width="11%" valign="top" class="bottomBorder rightBorder"><strong>MG/SG</strong></td>
					<td width="9%" valign="top" class="bottomBorder rightBorder"><strong>Quantity</strong></td>
					<td width="9%" valign="top" class="bottomBorder rightBorder"><strong>Unit</strong></td>
					<td width="23%" valign="top" class="bottomBorder rightBorder"><strong>Description</strong></td>
					<td width="12%" valign="top" class="bottomBorder rightBorder"><strong>Price per Unit </strong></td>
					<td width="11%" valign="top" class="bottomBorder rightBorder"><strong>Value</strong></td>
					<td width="11%" valign="top" class="bottomBorder"><strong>Delivery Date </strong></td>
				</tr>
				{section name=it loop=$items}
				<tr>
					<td width="4%" valign="top" class="rightBorder bottomBorder">{$smarty.section.it.index+1}</td>
					<td width="10%" valign="top" class="rightBorder bottomBorder">{$items[it].req_mat_no}</td>
					<td width="11%" valign="top" class="rightBorder bottomBorder">{$items[it].req_material_group}</td>
					<td width="9%" valign="top" class="rightBorder bottomBorder">{$items[it].req_qty}</td>
					<td width="9%" valign="top" class="rightBorder bottomBorder">{$items[it].req_uom}</td>
					<td width="23%" valign="top" class="rightBorder bottomBorder">{$items[it].req_desc}</td>
					<td width="12%" valign="top" class="rightBorder bottomBorder">
						<input type="text" class="btn" value="{$api[it].item_price_per_unit}"{$_GET.disabled} name="item_price_per_unit[{$smarty.section.it.index}]" />					</td>
					<td width="11%" valign="top" class="rightBorder bottomBorder">
						<input type="text" class="btn" value="{$api[it].item_total_price}"{$_GET.disabled} name="item_total_price[{$smarty.section.it.index}]" />					</td>
					<td width="11%" valign="top" class="bottomBorder">
						{$po.rfq_terms_of_delivery}					</td>
				</tr>
				{/section}
			</table>
		</td>
    </tr>
	  <tr>
		  <td colspan="5" valign="top">Remarks:<br />
		  <textarea name="po_remarks" cols="40" rows="10"{$_GET.disabled} class="btn">{$apo.po_remarks}</textarea>
		  </td>
	  </tr>
  </table>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
	<input type="button" value="Print to PDF" onclick="print_to_pdf2()" />
	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="rfqTable fBorder" style="font-size: 9px;">
	  <tr>
		  <td class="bottomBorder" colspan="2" valign="top"><img src="/themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" /></td>
		<td width="232" class="bottomBorder" valign="top"><strong>PT. PERTAMINA (PERSERO)<br />
		</strong>PERTAGAS, GD Oil Center Lt. 2 &amp; 3 Jl MH Thamrin No. 55<br />
		  Jakarta - 10350</td>
		<td width="261" class="bottomBorder" valign="bottom">Purch Organization: PT. PERTAMINA GAS</td>
		<td width="154" class="bottomBorder" valign="bottom">Delivery Time: {$po.rfq_terms_of_delivery} </td>
	  </tr>
	  <tr>
	    <td width="198" rowspan="2" valign="top" class="bottomBorder rightBorder"><strong>Purchase Order<br />
		  PO</strong></td>
	      <td width="155" rowspan="2" valign="top" class="bottomBorder">PO NUMBER/DATE
          <br /></td>
	      <td rowspan="2" valign="top" class="bottomBorder rightBorder">CURRENCY: {$quo_currency|upper}</td>
	      <td valign="top" class="bottomBorder">&nbsp;</td>
	      <td valign="top" class="bottomBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="bottomBorder" valign="top">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="2" class="bottomBorder" valign="top"><p>&nbsp;</p>        </td>
	      <td valign="top" class="bottomBorder">&nbsp;</td>
	      <td valign="top" class="bottomBorder"><br /></td>
	      <td valign="top" class="bottomBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="5" valign="top" style="padding: 0">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="16%" valign="top">Gross price in {$quo_currency|upper}</td>
					<td width="2%" valign="top">&nbsp;</td>
					<td width="82%" valign="top">
						<input name="po_gross_value" type="text"{$_GET.disabled} class="btn" id="po_gross_value" value="{if $apo.po_gross_value > 0}{$apo.po_gross_value}{else}{$doc.doc_harga_usulan}{/if}" />				  </td>
				</tr>
				<tr>
				  <td valign="top">PPN 10% </td>
				  <td valign="top">&nbsp;</td>
				  <td valign="top"><input name="po_ppn" type="text"{$_GET.disabled} class="btn" id="po_ppn" value="{if $apo.po_ppn == 0}{$doc.po_ppn}{else}{$apo.po_ppn}{/if}" /></td>
			  </tr>
				<tr>
				  <td valign="top">Total Net Value Incl. Tax {$quo_currency|upper} </td>
				  <td valign="top">&nbsp;</td>
				  <td valign="top"><input name="po_net_value" type="text"{$_GET.disabled} class="btn" id="po_net_value" value="{if $apo.po_net_value == 0}{$doc.po_grand_total}{else}{$apo.po_net_value}{/if}" /></td>
			  </tr>
				<tr>
				  <td colspan="3" valign="top">Total Net Value (Wordings): 
			      <input name="po_net_wordings" type="text" class="btn"{$_GET.disabled} id="po_net_wordings" value="{if $apo.po_net_wordings == ''}{$doc.wordings}{else}{$apo.po_net_wordings}{/if}" /></td>
			  </tr>
		</table>		</td>
    </tr>
	  <tr>
	    <td colspan="5" valign="top">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="5" valign="top">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top">We confirm our acceptance of the fore going agreement<br />
        on the terms and conditions herein stated. <br />
        Signature:<br />
        Name:<br />
        Date:</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top" style="padding: 0">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top"><strong>{$po.vendor_name|upper}</strong></td>
					<td width="8%" valign="top"></td>
					<td width="32%" valign="top"><strong>PT. PERTAMINA GAS </strong></td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">&nbsp;</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">&nbsp;</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">&nbsp;</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">
						<input type="text" name="po_vendor_name" class="btn"{$_GET.disabled} value="{$apo.po_vendor_name}" />
					</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top"><input name="po_pertagas_name"{$_GET.disabled} type="text" class="btn" id="po_pertagas_name" value="{$apo.po_pertagas_name}" /></td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">
						<input type="text" name="po_vendor_position" class="btn"{$_GET.disabled} value="{$apo.po_vendor_position}" />
					</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top"><input name="po_pertagas_position"{$_GET.disabled} type="text" class="btn" id="po_pertagas_position" value="{$apo.po_pertagas_position}" /></td>
				</tr>
			</table>
		</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top">&nbsp;</td>
      </tr>
  </table>
  	<p>&nbsp;</p>
  	<center><input type="submit" name="submitPo" value=" MASUKKAN "{$_GET.disabled} /></center>
  	</form>
	<script language="javascript">
		var frmvalidator  = new Validator("poForm");
		frmvalidator.clearAllValidations();
		
		frmvalidator.setAddnlValidationFunction("validateSubmit");
		{section name=val loop=$items}
		frmvalidator.addValidation("item_price_per_unit[{$smarty.section.val.index}]","req", "Mohon Masukkan Harga per Item!");
		frmvalidator.addValidation("item_price_per_unit[{$smarty.section.val.index}]","numeric","Mohon masukkan hanya nilai numerik!");
		frmvalidator.addValidation("item_total_price[{$smarty.section.val.index}]","req", "Mohon Masukkan Harga Total Item!");
		frmvalidator.addValidation("item_total_price[{$smarty.section.val.index}]","numeric","Mohon masukkan hanya nilai numerik!");
		{/section}
		frmvalidator.addValidation("po_ship_to","req", "Mohon Masukkan isian Ship To!");
		frmvalidator.addValidation("po_payment_to","req", "Mohon Masukkan isian Payment To!");
		frmvalidator.addValidation("po_acc_no","req", "Mohon Masukkan isian Nomor Rekening!");
		frmvalidator.addValidation("po_payment_method","req", "Mohon Masukkan isian Metode Pembayaran!");
		frmvalidator.addValidation("po_gross_value","req", "Mohon Masukkan isian Gross Price!");
		frmvalidator.addValidation("po_ppn","req", "Mohon Masukkan isian PPN!");
		frmvalidator.addValidation("po_net_value","req", "Mohon Masukkan isian Nett Value!");
		frmvalidator.addValidation("po_net_wordings","req", "Mohon Masukkan isian Terbilang!");
		frmvalidator.addValidation("po_vendor_name","req", "Mohon Masukkan isian Nama orang penandatangan!");
		frmvalidator.addValidation("po_pertagas_name","req", "Mohon Masukkan isian Nama orang penandatangan!");
		frmvalidator.addValidation("po_vendor_position","req", "Mohon Masukkan isian Jabatan orang penandatangan!");
		frmvalidator.addValidation("po_pertagas_position","req", "Mohon Masukkan isian Jabatan orang penandatangan!");
	</script>
	<div id="calInit">
	    {dhtml_calendar inputField="po_delivery_date" ifFormat="%d %B %Y" button="cal_req_date1" singleClick=false}
    </div>
	</p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}