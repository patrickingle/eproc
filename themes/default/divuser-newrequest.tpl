{include file="header.tpl"}
{include file="divuser-conditional.tpl"}
<div class="clear"></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div id="wide" style="float: left; margin-left: 20px; width: 900px; font-size: 7pt;">
	<form name="reqForm" id="reqForm" action="?mod=divuser&act=newrequest" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50%" valign="top" class="tdBorder" style="border-right: 0;">
            <img src="themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" />        </td>
        <td width="50%" valign="top" class="tdBorder" style="border-left: 0;">
            <input type="hidden" id="rwi" name="rwi" value="1" />
        </td>
      </tr>
      <tr>
        <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="4" valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">
          <select name="req_type" class="textField reqFormSelect">
                    <!--<option value="0">--- Requisition Type ---</option>-->
                    <option value="service">Service Requisition</option>
                    <option value="material">Material Requisition</option>
            </select>            </td>
            <td width="9%" valign="top" class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0;">
                Purposes:</td>
            <td width="47%" class="tdBorder" style="border-top: 0; border-left: 0;">
            <textarea name="req_purpose" class="textField" cols="35" rows="2" style="width: 80%;"></textarea>            </td>
          </tr>
          <tr>
            <td width="4%" valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">From</td>
            <td width="19%" valign="top" class="tdBorder" style="border-left: 0; border-top: 0;"><textarea name="req_from" class="textField" cols="20" rows="2"></textarea></td>
            <td width="3%" valign="top" class="tdBorder" style="border-top: 0; border-left: 0; border-right: 0;">To</td>
            <td width="18%" valign="top" class="tdBorder" style="border-top: 0;"><textarea name="req_to" class="textField" cols="20" rows="2" id="req_to"></textarea></td>
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
                  <input type="text" name="req_kode_pembebanan" id="req_kode_pembebanan" class="textField" style="width: 85px;" />
                </label></td>
                <td class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0; border-bottom: 0;"><input type="text" name="req_gl_no" class="textField" style="width: 85px;" id="req_gl_no" /></td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-right: 0; border-left: 0; border-top: 0;"><label>
                  <textarea name="req_cost_center" class="textField" style="width: 85px; height: 45px;"></textarea>
                </label></td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;"><textarea name="req_project" class="textField" style="width: 85px; height: 45px;" id="req_project"></textarea></td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-left: 0; border-top: 0;"><textarea name="req_internal_order" class="textField" style="width: 85px; height: 45px;" id="req_internal_order"></textarea></td>
              </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">P Group</td>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Bayer</td>
                </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;"><input type="text" name="req_pgroup" class="textField" style="width: 85px;" id="req_pgroup" /></td>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;"><input type="text" name="req_bayer" class="textField" style="width: 85px;" id="req_bayer" /></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="6" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <table id="reqFldTbl" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <!--<td width="3%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">No</div></td>-->
                <td width="26%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Description</div></td>
                <td width="9%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Quantity</div></td>
                <td width="6%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">UoM</div></td>
                <td width="11%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Required Date</div></td>
                <td width="13%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">MG/SG</div></td>
                <td width="23%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Estimated Price/Unit</div></td>
                <td width="4%" class="tdBorder" style="border-top: 0; border-right: 0;"><div align="center">Currency</div></td>
                <td width="5%" class="tdBorder" style="border-top: 0;"></td>
              </tr>
              <tr>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<input type="text" name="req_desc[1]" id="req_desc[1]" class="textField" maxlength="40" style="width: 95%;">
				</td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<input type="text" name="req_qty[1]" id="req_qty[1]" class="textField" style="width: 90%;" />                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<input type="text" name="req_uom[1]" id="req_uom[1]" class="textField" style="width: 90%;" />                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<input type="text" name="req_date1" id="req_date1" class="textField" style="width: 75%;" /> 
                    <img id="cal_req_date1" alt="" src="{$templateDir}/images/cal.png" />                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<textarea name="req_material_group[1]" id="req_material_group[1]" class="textField" rows="1" cols="20" style="width: 95%;"></textarea>                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<textarea name="req_est_price[1]" id="req_est_price[1]" class="textField" rows="1" cols="20" style="width: 95%;"></textarea>                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">
                	<select name="req_currency[1]" id="req_currency[1]" class="textField" style="font-size: 8px;">
                    	<option value="idr">IDR</option>
                        <option value="usd">USD</option>
                    </select>                </td>
                <td valign="top" class="tdBorder" style="border-top: 0;">&nbsp;</td>
              </tr>
              </table>
              <input type="hidden" name="txtIndex" value="2" />
            </table></td>
          </tr>
          <tr>
            <td colspan="4" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" valign="top" style="padding: 7px;">&nbsp;</td>
                <td width="94%" valign="top" style="padding: 7px;"><input type="button" class="textField" style="color: black" onclick="" value=" TAMBAH ITEM " name="addRowBtn" /></td>
              </tr>
              <tr>
                <td width="6%" valign="top" class="tdBorder">Remarks</td>
                <td width="94%" valign="top" class="tdBorder" style="border-left: 0;"><textarea name="req_remarks" class="textField" style="width: 100%; height: 40px;"></textarea></td>
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
        	<td valign="top" width="50%"><center>{$_fullName}</center></td>
			<td valign="top" width="50%"><center><input type="text" name="req_approval_by" class="textField" /></center></td>
        </tr>
    </table>
    <center><input type="submit" name="submitReqNew" class="textField" style="color: black" value=" MASUKKAN " /></center>
    </form>
    <div id="calInit">
	    {dhtml_calendar inputField="req_date1" ifFormat="%d %B %Y" button="cal_req_date1" singleClick=false}
    </div>
	<script language="javascript">
		var frmvalidator  = new Validator("reqForm");
		frmvalidator.clearAllValidations();
		
		frmvalidator.setAddnlValidationFunction("validateSubmit");
		frmvalidator.addValidation("req_type","req", "Mohon Masukkan Jenis Request!");
		frmvalidator.addValidation("req_from","req", "Mohon Masukkan isian Tender From!");
		frmvalidator.addValidation("req_to","req", "Mohon Masukkan isian Tender To!");
		frmvalidator.addValidation("req_kode_pembebanan","req", "Mohon Masukkan Kode Pembebanan!");
		frmvalidator.addValidation("req_purpose","req","Mohon masukkan Tender Purpose!");
		frmvalidator.addValidation("req_gl_no","req","Mohon Masukkan GL Account Number!");
		frmvalidator.addValidation("req_cost_center","req","Mohon Masukkan Cost Center!");
		frmvalidator.addValidation("req_approval_by","req","Mohon Masukkan Nama Approval!");
		frmvalidator.addValidation("req_desc[" + 1 + "]","req","Mohon Masukkan Description!");
		frmvalidator.addValidation("req_qty[" + 1 + "]","req","Mohon Masukkan Quantity!");
		frmvalidator.addValidation("req_qty[" + 1 + "]","numeric","Mohon masukkan hanya nilai numerik!");
		frmvalidator.addValidation("req_est_price[" + 1 + "]","req","Mohon Masukkan Estimate Price!");
		frmvalidator.addValidation("req_est_price[" + 1 + "]","numeric","Mohon masukkan hanya nilai numerik!");
	</script>
	<div id="validator"></div>
    <script language="javascript">
		templateDir = '{$templateDir}';
	</script>
    {literal}
    <script language="javascript">
		// Validate Submit Form
		function validateSubmit() {
			if(confirm('Apakah anda yakin?')) {
				return true;
			}
			else {
				return false;
			}
		}
		
		// Add Row Variables
		$(function() {
			$('input[@name=addRowBtn]')
				.bind('click', function() {
					rowIndex = parseInt(document.getElementById('rwi').value);
					nextRowIndex = rowIndex + 1;
					document.getElementById('rwi').value = nextRowIndex;
					trId = 'reqRow' + nextRowIndex;
					
					html = '<tr id="' + trId + '">';
					//html += '<td width="3%" class="tdBorder" style="border-top: 0; border-right: 0;">';
					//html += nextRowIndex;
					//html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<input type="text" name="req_desc[]" class="textField" maxlength="40" style="width: 95%;">';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<input type="text" name="req_qty[]" class="textField" style="width: 90%;" />';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<input type="text" name="req_uom[]" class="textField" style="width: 90%;" />';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<input type="text" name="req_date' + nextRowIndex + '" id="req_date' + nextRowIndex + '" class="textField" style="width: 75%;" /> ';
					html += '<img id="cal_req_date' + nextRowIndex + '" alt="" src="' + templateDir + '/images/cal.png" />';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<textarea name="req_material_group[]" class="textField" rows="1" cols="20" style="width: 95%;"></textarea>';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<textarea name="req_est_price[]" class="textField" rows="1" cols="20" style="width: 95%;"></textarea>';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">';
					html += '<select name="req_currency[]" class="textField" style="font-size: 8px;">';
					html += '<option value="idr">IDR</option>';
					html += '<option value="usd">USD</option>';
					html += '</select>';
					html += '</td>';
					html += '<td valign="top" class="tdBorder" style="border-top: 0;"><input type="button" id="delBtn' + nextRowIndex + '" class="textField" style="font-size: 8px; color: black;" value="HAPUS?" /></td>';
					html += '</tr>';
					
					$('table#reqFldTbl').append(html);
					
					Calendar.setup({"inputField":"req_date" + nextRowIndex,"button":"cal_req_date" + nextRowIndex,"singleClick":false,"ifFormat":"%d %B %Y"});
					
					// Delete Button
					$('input#delBtn' + nextRowIndex).bind('click', function() {
						var btnId = $(this).attr('id');
						btnId = btnId.split('delBtn');
						$('tr#reqRow' + btnId[1]).remove();
						this.blur();
						return false;
					});
					this.blur();
				});
		});
	</script>
    {/literal}
</div>
<br clear="all" />
<p>&nbsp;</p>
{include file="footer.tpl"}