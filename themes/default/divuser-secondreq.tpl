{include file="header.tpl"}
{literal}
<script language="javascript">
	function print_to_pdf() {
		html2ps = '{/literal}{$html2ps}{$tender_id}{literal}';
		newwindow = window.open(html2ps,'pdfWindow','height=700,width=1000');
	}
</script>
{/literal}
{include file="divuser-conditional.tpl"}
{include file="eproc-conditional.tpl"}
<div id="wide" style="float: left; margin-left: 20px; width: 900px; font-size: 7pt;">
	<p>&nbsp;</p><p>&nbsp;</p>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50%" valign="top" class="tdBorder" style="border-right: 0;">
            <img src="themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" />        </td>
        <td width="50%" valign="top" class="tdBorder" style="border-left: 0;">
            <input name="print_to_pdf" type="button" class="textField" style="color: #000;" value="Print to PDF" onclick="print_to_pdf();">
            <form name="hpdf" action="/pdfgen/division-req.php" method="post">
            	<input type="hidden" name="htmlpdf" id="htmlpdf" value="0" />
                <input type="hidden" name="tender_id" value="{$tender_id}" />
            </form>
        </td>
      </tr>
      <tr>
        <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="4" valign="top" class="tdBorder" style="border-top: 0; border-right: 0; font-size: 13pt; font-weight: bold;">{$req_type} REQUISITION - {$req_mrsr_number}</td>
            <td width="9%" valign="top" class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0;">
                Purposes:</td>
            <td width="47%" valign="top" class="tdBorder" style="border-top: 0; border-left: 0;">{$req_purpose}</td>
          </tr>
          <tr>
            <td width="4%" valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">From</td>
            <td width="19%" valign="top" class="tdBorder" style="border-left: 0; border-top: 0;">{$req_from}</td>
            <td width="3%" valign="top" class="tdBorder" style="border-top: 0; border-left: 0; border-right: 0;">To</td>
            <td width="18%" valign="top" class="tdBorder" style="border-top: 0;">{$req_to}</td>
            <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19%" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Kode Pembebanan</td>
                <td width="23%" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">G/L No.</td>
                <td width="21%" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Cost Center</td>
                <td width="20%" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Project</td>
                <td width="17%" class="tdBorder" style="border-left: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Internal Order</td>
              </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0; border-bottom: 0;"><label>
                  {$req_kode_pembebanan}
                </label></td>
                <td class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0; border-bottom: 0;">{$req_gl_no}</td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-right: 0; border-left: 0; border-top: 0;">
                  {$req_cost_center}
                </td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;">{$req_project}</td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-left: 0; border-top: 0;">{$req_internal_order}</td>
              </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">P Group</td>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Bayer</td>
                </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;">{$req_pgroup}</td>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;">{$req_bayer}</td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="6" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <table id="reqFldTbl" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="3%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">No</div></td>
                <td width="26%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Description</div></td>
                <td width="9%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Quantity</div></td>
                <td width="6%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">UoM</div></td>
                <td width="11%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Required Date</div></td>
                <td width="13%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Material Group</div></td>
                <td width="23%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Estimated Price/Unit</div></td>
                <td width="4%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Currency</div></td>
                <td width="5%" class="tdBorder" style="border-top: 0;"></td>
              </tr>
              {section name=item loop=$tenderItem.req_desc}
              <tr>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">{$smarty.section.item.index+1}</td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	{$tenderItem.req_desc[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	{$tenderItem.req_qty[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	{$tenderItem.req_uom[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	{$tenderItem.req_date[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	{$tenderItem.req_material_group[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	{$tenderItem.req_est_price[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">
                	{$tenderItem.req_currency[item]}                </td>
                <td valign="top" class="tdBorder" style="border-top: 0;">&nbsp;</td>
              </tr>
              {/section}
              </table>
            </table></td>
          </tr>
          <tr>
            <td colspan="4" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" valign="top" style="padding: 7px;">&nbsp;</td>
                <td width="94%" valign="top" style="padding: 7px;">&nbsp;</td>
              </tr>
              <tr>
                <td width="6%" valign="top" class="tdBorder">Remarks</td>
                <td width="94%" valign="top" class="tdBorder" style="border-left: 0;">{$req_remarks}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="4" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    	<tr>
        	<td valign="top" width="50%"><center>Requested By</center></td>
			<td valign="top" width="50%"><center>Approved By</center></td>
        </tr>
        <tr>
        	<td valign="top" width="50%">&nbsp;</td>
			<td valign="top" width="50%">&nbsp;</td>
        </tr>
        <tr>
        	<td valign="top" width="50%">&nbsp;</td>
			<td valign="top" width="50%">&nbsp;</td>
        </tr>
        <tr>
        	<td valign="top" width="50%">&nbsp;</td>
			<td valign="top" width="50%">&nbsp;</td>
        </tr>
        <tr>
        	<td valign="top" width="50%">&nbsp;</td>
			<td valign="top" width="50%">&nbsp;</td>
        </tr>
        <tr>
        	<td valign="top" width="50%"><center>{$user_id}</center></td>
			<td valign="top" width="50%"><center>{$req_approval_by}</center></td>
        </tr>
    </table>
</div>
<br clear="all" />
<p>&nbsp;</p>
{include file="footer.tpl"}