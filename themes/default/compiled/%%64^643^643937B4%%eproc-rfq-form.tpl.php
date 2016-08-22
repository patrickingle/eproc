<?php /* Smarty version 2.6.18, created on 2008-06-01 14:27:29
         compiled from eproc-rfq-form.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'eproc-rfq-form.tpl', 31, false),)), $this); ?>
<?php echo '
<script language="javascript">
	function print_to_pdf() {
		html2ps = \''; ?>
<?php echo $this->_tpl_vars['html2psrq']; ?>
<?php echo '\';
		newwindow = window.open(html2ps,\'pdfWindow\',\'height=700,width=1000\');
	}
</script>
'; ?>

	<p>&nbsp;</p>
    <form name="rfqForm" action="<?php echo $this->_tpl_vars['PHP_SELF']; ?>
&go=rfq" method="post">
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
			<?php echo $this->_tpl_vars['vendor']['vendor_name']; ?>
<br />
			<?php echo $this->_tpl_vars['vendor']['vendor_addr']; ?>
<br />
            <?php echo $this->_tpl_vars['vendor']['vendor_city']; ?>
 <?php echo $this->_tpl_vars['vendor']['vendor_zip']; ?>
        </td>
        <td valign="top" width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td>RFQ DATE</td>
            <td><div align="center">:</div></td>
            <td><?php echo ((is_array($_tmp=$this->_tpl_vars['rfqs']['rfq_created_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d %b %y") : smarty_modifier_date_format($_tmp, "%d %b %y")); ?>
</td>
          </tr>
          <tr>
            <td width="50%">RFQ NUMBER</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%">
            	<input type="text" name="rfq_number" value="<?php echo $this->_tpl_vars['rfqs']['rfq_number']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 />            </td>
          </tr>
          <tr>
            <td>COLLECTIVE NUMBER</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_collective_number" value="<?php echo $this->_tpl_vars['rfqs']['rfq_collective_number']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 /></td>
          </tr>
          <tr>
            <td>YOUR VENDOR NUMBER WITH US</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_your_vendor_number" value="<?php echo $this->_tpl_vars['vendor']['user_name']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div align="center"></div></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>CONTACT PERSON/TELEPHONE</td>
            <td><div align="center">:</div></td>
            <td><?php echo $this->_tpl_vars['vendor']['resp_name']; ?>
</td>
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
            <td width="47%"><input type="text" name="rfq_quotation_deadline" id="rfq_quotation_deadline" value="<?php echo $this->_tpl_vars['rfqs']['rfq_quotation_deadline']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 /></td>
          </tr>
          <tr>
            <td>DEADLINE (DAYS)</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_delivery_time" id="rfq_delivery_time" value="<?php echo $this->_tpl_vars['rfqs']['rfq_delivery_time']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 /></td>
          </tr>
          <tr>
            <td>TERMS OF DELIVERY</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_terms_of_delivery" id="rfq_terms_of_delivery" value="<?php echo $this->_tpl_vars['rfqs']['rfq_terms_of_delivery']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 /></td>
          </tr>
          <tr>
            <td>PRICE VALIDITY</td>
            <td><div align="center">:</div></td>
            <td><input type="text" name="rfq_price_validity" id="rfq_price_validity" value="<?php echo $this->_tpl_vars['rfqs']['rfq_price_validity']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 /></td>
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
          <?php unset($this->_sections['it']);
$this->_sections['it']['name'] = 'it';
$this->_sections['it']['loop'] = is_array($_loop=$this->_tpl_vars['items']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['it']['show'] = true;
$this->_sections['it']['max'] = $this->_sections['it']['loop'];
$this->_sections['it']['step'] = 1;
$this->_sections['it']['start'] = $this->_sections['it']['step'] > 0 ? 0 : $this->_sections['it']['loop']-1;
if ($this->_sections['it']['show']) {
    $this->_sections['it']['total'] = $this->_sections['it']['loop'];
    if ($this->_sections['it']['total'] == 0)
        $this->_sections['it']['show'] = false;
} else
    $this->_sections['it']['total'] = 0;
if ($this->_sections['it']['show']):

            for ($this->_sections['it']['index'] = $this->_sections['it']['start'], $this->_sections['it']['iteration'] = 1;
                 $this->_sections['it']['iteration'] <= $this->_sections['it']['total'];
                 $this->_sections['it']['index'] += $this->_sections['it']['step'], $this->_sections['it']['iteration']++):
$this->_sections['it']['rownum'] = $this->_sections['it']['iteration'];
$this->_sections['it']['index_prev'] = $this->_sections['it']['index'] - $this->_sections['it']['step'];
$this->_sections['it']['index_next'] = $this->_sections['it']['index'] + $this->_sections['it']['step'];
$this->_sections['it']['first']      = ($this->_sections['it']['iteration'] == 1);
$this->_sections['it']['last']       = ($this->_sections['it']['iteration'] == $this->_sections['it']['total']);
?>
          <tr>
            <td class="rightBorder"><div align="center"><?php echo $this->_sections['it']['index']+1; ?>
</div></td>
            <td class="rightBorder"><div align="center"><?php echo $this->_tpl_vars['items'][$this->_sections['it']['index']]['req_qty']; ?>
</div></td>
            <td class="rightBorder"><div align="center"><?php echo $this->_tpl_vars['items'][$this->_sections['it']['index']]['req_uom']; ?>
</div></td>
            <td class="rightBorder"><div align="center"><?php echo $this->_tpl_vars['items'][$this->_sections['it']['index']]['req_desc']; ?>
</div></td>
            <td class="rightBorder"><div align="center">
            	<input type="text" name="req_mat_no[]" value="<?php echo $this->_tpl_vars['items'][$this->_sections['it']['index']]['req_mat_no']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 />
            </div></td>
            <td valign="middle"><div align="center">
            	<input type="text" name="req_mgsg[]" value="<?php echo $this->_tpl_vars['items'][$this->_sections['it']['index']]['req_mgsg']; ?>
" class="btn"<?php echo $this->_tpl_vars['disabled']; ?>
 />
                <input type="hidden" name="item_id[]" value="<?php echo $this->_tpl_vars['items'][$this->_sections['it']['index']]['item_id']; ?>
" />
            </div></td>
          </tr>
          <?php endfor; endif; ?>
        </table></td>
        </tr>
      <tr>
        <td class="topBorder" valign="top"><br />
          &nbsp;Notes:<br />
          <label>
          <textarea name="rfq_notes" id="rfq_notes" class="textBox" cols="45" rows="5"<?php echo $this->_tpl_vars['disabled']; ?>
><?php echo $this->_tpl_vars['rfqs']['rfq_notes']; ?>
</textarea>
          </label></td>
        <td class="topBorder" valign="top">
        	&nbsp;<br />
        	PT. PERTAGAS<br />
            PROCUREMENT,<br />&nbsp;
            <br />&nbsp;
            <br />&nbsp;
            <br />
            <input type="text" name="rfq_approval_person" class="textBox" value="<?php echo $this->_tpl_vars['rfqs']['rfq_approval_person']; ?>
"<?php echo $this->_tpl_vars['disabled']; ?>
 />
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <input type="submit" value=" MASUKKAN " name="submitRfq"<?php echo $this->_tpl_vars['disabled']; ?>
 />
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