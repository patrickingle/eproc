<?php /* Smarty version 2.6.18, created on 2008-06-01 14:26:37
         compiled from divuser-secondreq.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php echo '
<script language="javascript">
	function print_to_pdf() {
		html2ps = \''; ?>
<?php echo $this->_tpl_vars['html2ps']; ?>
<?php echo $this->_tpl_vars['tender_id']; ?>
<?php echo '\';
		newwindow = window.open(html2ps,\'pdfWindow\',\'height=700,width=1000\');
	}
</script>
'; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "divuser-conditional.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-conditional.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
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
                <input type="hidden" name="tender_id" value="<?php echo $this->_tpl_vars['tender_id']; ?>
" />
            </form>
        </td>
      </tr>
      <tr>
        <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="4" valign="top" class="tdBorder" style="border-top: 0; border-right: 0; font-size: 13pt; font-weight: bold;"><?php echo $this->_tpl_vars['req_type']; ?>
 REQUISITION - <?php echo $this->_tpl_vars['req_mrsr_number']; ?>
</td>
            <td width="9%" valign="top" class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0;">
                Purposes:</td>
            <td width="47%" valign="top" class="tdBorder" style="border-top: 0; border-left: 0;"><?php echo $this->_tpl_vars['req_purpose']; ?>
</td>
          </tr>
          <tr>
            <td width="4%" valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">From</td>
            <td width="19%" valign="top" class="tdBorder" style="border-left: 0; border-top: 0;"><?php echo $this->_tpl_vars['req_from']; ?>
</td>
            <td width="3%" valign="top" class="tdBorder" style="border-top: 0; border-left: 0; border-right: 0;">To</td>
            <td width="18%" valign="top" class="tdBorder" style="border-top: 0;"><?php echo $this->_tpl_vars['req_to']; ?>
</td>
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
                  <?php echo $this->_tpl_vars['req_kode_pembebanan']; ?>

                </label></td>
                <td class="tdBorder" style="border-left: 0; border-top: 0; border-right: 0; border-bottom: 0;"><?php echo $this->_tpl_vars['req_gl_no']; ?>
</td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-right: 0; border-left: 0; border-top: 0;">
                  <?php echo $this->_tpl_vars['req_cost_center']; ?>

                </td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;"><?php echo $this->_tpl_vars['req_project']; ?>
</td>
                <td rowspan="3" valign="top" class="tdBorder" style="border-left: 0; border-top: 0;"><?php echo $this->_tpl_vars['req_internal_order']; ?>
</td>
              </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">P Group</td>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0; border-bottom: 0; padding-bottom: 0;">Bayer</td>
                </tr>
              <tr>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;"><?php echo $this->_tpl_vars['req_pgroup']; ?>
</td>
                <td class="tdBorder" style="border-left: 0; border-right: 0; border-top: 0;"><?php echo $this->_tpl_vars['req_bayer']; ?>
</td>
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
              <?php unset($this->_sections['item']);
$this->_sections['item']['name'] = 'item';
$this->_sections['item']['loop'] = is_array($_loop=$this->_tpl_vars['tenderItem']['req_desc']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['item']['show'] = true;
$this->_sections['item']['max'] = $this->_sections['item']['loop'];
$this->_sections['item']['step'] = 1;
$this->_sections['item']['start'] = $this->_sections['item']['step'] > 0 ? 0 : $this->_sections['item']['loop']-1;
if ($this->_sections['item']['show']) {
    $this->_sections['item']['total'] = $this->_sections['item']['loop'];
    if ($this->_sections['item']['total'] == 0)
        $this->_sections['item']['show'] = false;
} else
    $this->_sections['item']['total'] = 0;
if ($this->_sections['item']['show']):

            for ($this->_sections['item']['index'] = $this->_sections['item']['start'], $this->_sections['item']['iteration'] = 1;
                 $this->_sections['item']['iteration'] <= $this->_sections['item']['total'];
                 $this->_sections['item']['index'] += $this->_sections['item']['step'], $this->_sections['item']['iteration']++):
$this->_sections['item']['rownum'] = $this->_sections['item']['iteration'];
$this->_sections['item']['index_prev'] = $this->_sections['item']['index'] - $this->_sections['item']['step'];
$this->_sections['item']['index_next'] = $this->_sections['item']['index'] + $this->_sections['item']['step'];
$this->_sections['item']['first']      = ($this->_sections['item']['iteration'] == 1);
$this->_sections['item']['last']       = ($this->_sections['item']['iteration'] == $this->_sections['item']['total']);
?>
              <tr>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;"><?php echo $this->_sections['item']['index']+1; ?>
</td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<?php echo $this->_tpl_vars['tenderItem']['req_desc'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<?php echo $this->_tpl_vars['tenderItem']['req_qty'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<?php echo $this->_tpl_vars['tenderItem']['req_uom'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<?php echo $this->_tpl_vars['tenderItem']['req_date'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<?php echo $this->_tpl_vars['tenderItem']['req_material_group'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;" align="center">
                	<?php echo $this->_tpl_vars['tenderItem']['req_est_price'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0; border-right: 0;">
                	<?php echo $this->_tpl_vars['tenderItem']['req_currency'][$this->_sections['item']['index']]; ?>
                </td>
                <td valign="top" class="tdBorder" style="border-top: 0;">&nbsp;</td>
              </tr>
              <?php endfor; endif; ?>
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
                <td width="94%" valign="top" class="tdBorder" style="border-left: 0;"><?php echo $this->_tpl_vars['req_remarks']; ?>
</td>
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
        	<td valign="top" width="50%"><center><?php echo $this->_tpl_vars['user_id']; ?>
</center></td>
			<td valign="top" width="50%"><center><?php echo $this->_tpl_vars['req_approval_by']; ?>
</center></td>
        </tr>
    </table>
</div>
<br clear="all" />
<p>&nbsp;</p>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>