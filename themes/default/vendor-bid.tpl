{include file="header.tpl"}
{include file="vendor-conditional.tpl"}
{include file="eproc-conditional.tpl"}
{literal}
<script type="text/javascript">
	function submitThis() {
		if(confirm('Apakah anda yakin ingin memasukkan penawaran anda?')) {
			document.form.bidForm.submit();
		}
	}
	
	function print_to_pdf() {
		html2ps = '{/literal}{$html2ps}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
</script>
{/literal}
<div class="clear"></div><p>&nbsp;</p>
<div id="wide" style="float: left; margin-left: 20px; width: 1000px; font-size: 10pt;">
	{if $successBid == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	QUOTATION SUKSES DIMASUKKAN
        </span>
    </p>
    {/if}
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
		<h2>{$vendor_name} - {$tender_name}</h2>
	</p>
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>QUOTATION FORM</strong>
    </p>
  <form name="bidForm" id="bidForm" action="?mod=vendor&act=bid&tender_id={$_GET.tender_id}&vendor_id={$_GET.vendor_id}" method="post">
  <p style="margin-top: 10px; font-size: 11pt">
  	<span style="color:red;"><strong>Pilih Mata Uang yang hendak anda gunakan:</strong></span>
	<select name="quo_currency" class="btn"{$disabled}>
		<option value="idr"{if $quo[0].quo_currency == "idr"} selected{/if}>IDR - RUPIAH</option>
		<option value="usd"{if $quo[0].quo_currency == "usd"} selected{/if}>USD - US DOLLAR</option>
	</select> <span style="color: red" class="smallText"><strong>* WAJIB DIISIKAN!</strong></span>
  </p>
  <p style="margin-top: 10px; font-size: 11pt">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="rfqTable fBorder">
      <tr>
        <td valign="top">
        	<img src="themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" />        </td>
        <td valign="top"><input type="button" onclick="print_to_pdf()" value="Print to PDF" /> <input type="button" onclick="top.location.href='{$next}'" value=" NEXT&raquo; " /></td>
      </tr>
      <tr>
        <td class="topBorder" valign="top">QUOTATION</td>
        <td class="topBorder" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" width="50%">
        	TO:<br />
       	  PT. PERTAGAS<br />
JL. MH THAMRIN NO. 55<br />
JAKARTA 10350</td>
        <td valign="top" width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td width="50%">RFQ NUMBER/DATE</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%">{$rfqs.rfq_number}</td>
          </tr>
          <tr>
            <td>COLLECTIVE NUMBER</td>
            <td><div align="center">:</div></td>
            <td>{$rfqs.rfq_collective_number}</td>
          </tr>
          <tr>
            <td>YOUR VENDOR NUMBER WITH US</td>
            <td><div align="center">:</div></td>
            <td>{$rfqs.rfq_your_vendor_number}</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div align="center"></div></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>CONTACT PERSON/TELEPHONE</td>
            <td><div align="center">:</div></td>
            <td>{$vendor.resp_name}</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" class="smallText">Enclose RFQ Number, Collective Number and Vendor Number when submitting quotation.</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="topBorder" valign="top">FROM:<br />
          {$vendor.vendor_name}<br />
{$vendor.vendor_addr}<br />
{$vendor.vendor_city} {$vendor.vendor_zip}</td>
        <td class="topBorder" valign="top">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td width="50%">QUOTATION DEADLINE</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%">{$rfqs.rfq_quotation_deadline}</td>
          </tr>
          <tr>
            <td>DEADLINE (DAYS)</td>
            <td><div align="center">:</div></td>
            <td>{$rfqs.rfq_delivery_time}</td>
          </tr>
          <tr>
            <td>TERMS OF DELIVERY</td>
            <td><div align="center">:</div></td>
            <td>{$rfqs.rfq_terms_of_delivery}</td>
          </tr>
          <tr>
            <td>PRICE VALIDITY</td>
            <td><div align="center">:</div></td>
            <td>{$rfqs.rfq_price_validity}</td>
          </tr>
          <tr>
            <td colspan="3" class="smallText">&nbsp;</td>
            </tr>
        </table>        </td>
      </tr>
      <tr id="zeropad1">
        <td colspan="2" valign="top" class="topBorder">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="bottomBorder rightBorder"><div align="center">Item</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Quantity</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Unit</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Description</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Mat No/Serv No</div></td>
            <td class="bottomBorder rightBorder"><div align="center">MG/SG</div></td>
			<td class="bottomBorder rightBorder"><div align="center">Price/Unit</div></td>
			<td class="bottomBorder"><div align="center">Total Price</div></td>
          </tr>
          {section name=it loop=$items}
          <tr>
            <td class="rightBorder"><div align="center">{$smarty.section.it.index+1}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_qty}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_uom}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_desc}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_mat_no}</div></td>
            <td class="rightBorder" valign="middle"><div align="center">
              {$items[it].req_mgsg}</div></td>
			<td class="rightBorder" align="center">
				<input type="text"{$disabled} class="btn" name="quo_unit_price[{$smarty.section.it.index}]" value="{$quo[it].quo_unit_price}" />			</td>
			<td align="center">
				<input type="text"{$disabled} class="btn" name="quo_total_price[{$smarty.section.it.index}]" value="{$quo[it].quo_total_price}" />			</td>
          </tr>
          {/section}
        </table></td>
        </tr>
      <tr id="zeropad1">
        <td colspan="2" valign="top" class="topBorder">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="50%"><div align="center">&nbsp;</div></td>
				<td width="18%"><div align="center">Total</div></td>
				<td width="17%"><div align="left">{$itemTotal}</div></td>
			  </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td><div align="center">PPN (10%) </div></td>
			    <td>{$itemPpn}</td>
		      </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td><div align="center">Grand Total </div></td>
			    <td>{$itemGrand}</td>
		      </tr>
			 </table>
		</td>
      </tr>
      <tr>
        <td class="topBorder" valign="top"><br />
          &nbsp;Notes:<br />
          <label>
          <textarea name="quo_notes"{$disabled} id="quo_notes" class="btn" cols="45" rows="5">{$quo[0].quo_notes}</textarea>
          </label></td>
        <td class="topBorder" valign="top">
        	&nbsp;<br />
        	{$vendor.vendor_name}<br />
			Division/Department: <input type="text"{$disabled} name="quo_division" class="btn" value="{$quo[0].quo_division}" />,<br />
        	&nbsp;
            <br />&nbsp;
            <br />&nbsp;
            <br />
            Approval By: <input type="text"{$disabled} name="quo_approval_person" class="btn" value="{$quo[0].quo_approval_person}" />        </td>
      </tr>
    </table>
  </p>
    <p style="margin-top: 10px; font-size: 11pt; width: 90%" align="center">
      <input type="submit" name="submitBid"{$disabled} value=" MASUKKAN " />
    </p>
  </form>
  {$jsValidate}
</div>
<br clear="all" />
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
{include file="footer.tpl"}