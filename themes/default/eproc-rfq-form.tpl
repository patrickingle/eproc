{literal}
<script language="javascript">
	function print_to_pdf() {
		html2ps = '{/literal}{$html2psrq}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
</script>
{/literal}
	<p>&nbsp;</p>
    <form name="rfqForm" action="{$PHP_SELF}&go=rfq" method="post">
    <center><table width="100%" border="0" cellspacing="0" cellpadding="0" class="rfqTable fBorder">
      <tr>
        <td valign="top">
        	<img src="themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" />        </td>
        <td valign="top"><input type="button" onclick="print_to_pdf()" value="Print to PDF" /></td>
      </tr>
      <tr>
        <td class="topBorder" valign="top">REQUEST FOR QUOTATION</td>
        <td class="topBorder" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" width="50%">
        	TO:<br />
			{$vendor.vendor_name}<br />
			{$vendor.vendor_addr}<br />
            {$vendor.vendor_city} {$vendor.vendor_zip}        </td>
        <td valign="top" width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td>RFQ DATE</td>
            <td><div align="center">:</div></td>
            <td>{$rfqs.rfq_created_date|date_format:"%d %b %y"}</td>
          </tr>
          <tr>
            <td width="50%">RFQ NUMBER</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%">
            	<input type="text" name="rfq_number" value="{$rfqs.rfq_number}" class="btn"{$disabled} />            </td>
          </tr>
          <tr>
            <td>COLLECTIVE NUMBER</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_collective_number" value="{$rfqs.rfq_collective_number}" class="btn"{$disabled} /></td>
          </tr>
          <tr>
            <td>YOUR VENDOR NUMBER WITH US</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_your_vendor_number" value="{$vendor.user_name}" class="btn"{$disabled} /></td>
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
        <td class="topBorder" valign="top">PLEASE DELIVER TO:<br />
          PT. PERTAGAS<br />
		  JL. MH THAMRIN NO. 55<br />
		  JAKARTA 10350</td>
        <td class="topBorder" valign="top">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td width="50%">QUOTATION DEADLINE</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%"><input type="text" name="rfq_quotation_deadline" id="rfq_quotation_deadline" value="{$rfqs.rfq_quotation_deadline}" class="btn"{$disabled} /></td>
          </tr>
          <tr>
            <td>DEADLINE (DAYS)</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_delivery_time" id="rfq_delivery_time" value="{$rfqs.rfq_delivery_time}" class="btn"{$disabled} /></td>
          </tr>
          <tr>
            <td>TERMS OF DELIVERY</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_terms_of_delivery" id="rfq_terms_of_delivery" value="{$rfqs.rfq_terms_of_delivery}" class="btn"{$disabled} /></td>
          </tr>
          <tr>
            <td>PRICE VALIDITY</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_price_validity" id="rfq_price_validity" value="{$rfqs.rfq_price_validity}" class="btn"{$disabled} /></td>
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
            <td width="7%" class="bottomBorder rightBorder"><div align="center">Item</div></td>
            <td width="12%" class="bottomBorder rightBorder"><div align="center">Quantity</div></td>
            <td width="8%" class="bottomBorder rightBorder"><div align="center">Unit</div></td>
            <td width="44%" class="bottomBorder rightBorder"><div align="center">Description</div></td>
            <td width="15%" class="bottomBorder rightBorder"><div align="center">Mat No/Serv No</div></td>
            <td width="14%" class="bottomBorder"><div align="center">MG/SG</div></td>
          </tr>
          {section name=it loop=$items}
          <tr>
            <td class="rightBorder"><div align="center">{$smarty.section.it.index+1}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_qty}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_uom}</div></td>
            <td class="rightBorder"><div align="center">{$items[it].req_desc}</div></td>
            <td class="rightBorder"><div align="center">
            	<input type="text" name="req_mat_no[]" value="{$items[it].req_mat_no}" class="btn"{$disabled} />
            </div></td>
            <td valign="middle"><div align="center">
            	<input type="text" name="req_mgsg[]" value="{$items[it].req_mgsg}" class="btn"{$disabled} />
                <input type="hidden" name="item_id[]" value="{$items[it].item_id}" />
            </div></td>
          </tr>
          {/section}
        </table></td>
        </tr>
      <tr>
        <td class="topBorder" valign="top"><br />
          &nbsp;Notes:<br />
          <label>
          <textarea name="rfq_notes" id="rfq_notes" class="textBox" cols="45" rows="5"{$disabled}>{$rfqs.rfq_notes}</textarea>
          </label></td>
        <td class="topBorder" valign="top">
        	&nbsp;<br />
        	PT. PERTAGAS<br />
            PROCUREMENT,<br />&nbsp;
            <br />&nbsp;
            <br />&nbsp;
            <br />
            <input type="text" name="rfq_approval_person" class="textBox" value="{$rfqs.rfq_approval_person}"{$disabled} />
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <input type="submit" value=" MASUKKAN " name="submitRfq"{$disabled} />
    </center>
    </form>
	<script language="javascript">
		var frmvalidator  = new Validator("rfqForm");
		frmvalidator.clearAllValidations();
		
		frmvalidator.setAddnlValidationFunction("validateSubmit");
		frmvalidator.addValidation("rfq_approval_person","req", "Mohon Masukkan Approval Person!");
		frmvalidator.addValidation("rfq_price_validity","req","Mohon masukkan Price Validity!");
		frmvalidator.addValidation("rfq_quotation_deadline","req","Mohon masukkan Quotation Deadline!");
		frmvalidator.addValidation("rfq_delivery_time","req","Mohon masukkan Delivery Time!");
		frmvalidator.addValidation("rfq_terms_of_delivery","req","Mohon masukkan Terms of Delivery!");
		frmvalidator.addValidation("rfq_price_validity","req","Mohon masukkan Price Validity!");
	</script>