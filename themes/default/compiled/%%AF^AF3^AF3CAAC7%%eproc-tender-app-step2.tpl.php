<?php /* Smarty version 2.6.18, created on 2008-06-01 14:27:20
         compiled from eproc-tender-app-step2.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-conditional.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php if ($this->_tpl_vars['_userLevel'] == 1): ?>
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<?php if ($this->_tpl_vars['_eNoneSelected'] == 1): ?>
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>MOHON PILIH VENDOR YANG DIKEHENDAKI</strong></span>
    </p>
    <?php endif; ?>
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Tender Approval - Appointing Vendor</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Mohon pilih vendor-vendor mana yang dapat mengikuti TENDER ini. Gunakan list dibawah ini untuk memilih vendor dan tekan tombol PILIH untuk memilih. Nama-nama vendor diurutkan berdasarkan abjad.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="vendorFrm" action="<?php echo $this->_tpl_vars['PHP_SELF']; ?>
" method="post">
        <input type="hidden" name="tender_id" value="<?php echo $this->_tpl_vars['tender_id']; ?>
" />
    	<select name="vendor_list[]" size="10" multiple class="textBox" style="width: 250px; font-size: 10pt;">
            <?php unset($this->_sections['vendor']);
$this->_sections['vendor']['name'] = 'vendor';
$this->_sections['vendor']['loop'] = is_array($_loop=$this->_tpl_vars['vendors']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['vendor']['show'] = true;
$this->_sections['vendor']['max'] = $this->_sections['vendor']['loop'];
$this->_sections['vendor']['step'] = 1;
$this->_sections['vendor']['start'] = $this->_sections['vendor']['step'] > 0 ? 0 : $this->_sections['vendor']['loop']-1;
if ($this->_sections['vendor']['show']) {
    $this->_sections['vendor']['total'] = $this->_sections['vendor']['loop'];
    if ($this->_sections['vendor']['total'] == 0)
        $this->_sections['vendor']['show'] = false;
} else
    $this->_sections['vendor']['total'] = 0;
if ($this->_sections['vendor']['show']):

            for ($this->_sections['vendor']['index'] = $this->_sections['vendor']['start'], $this->_sections['vendor']['iteration'] = 1;
                 $this->_sections['vendor']['iteration'] <= $this->_sections['vendor']['total'];
                 $this->_sections['vendor']['index'] += $this->_sections['vendor']['step'], $this->_sections['vendor']['iteration']++):
$this->_sections['vendor']['rownum'] = $this->_sections['vendor']['iteration'];
$this->_sections['vendor']['index_prev'] = $this->_sections['vendor']['index'] - $this->_sections['vendor']['step'];
$this->_sections['vendor']['index_next'] = $this->_sections['vendor']['index'] + $this->_sections['vendor']['step'];
$this->_sections['vendor']['first']      = ($this->_sections['vendor']['iteration'] == 1);
$this->_sections['vendor']['last']       = ($this->_sections['vendor']['iteration'] == $this->_sections['vendor']['total']);
?>
            <option value="<?php echo $this->_tpl_vars['vendors'][$this->_sections['vendor']['index']]['user_id']; ?>
">
                <?php echo $this->_tpl_vars['vendors'][$this->_sections['vendor']['index']]['vendor_name']; ?>
 - <?php echo $this->_tpl_vars['vendors'][$this->_sections['vendor']['index']]['vendor_state']; ?>

      </option>
            <?php endfor; endif; ?>
        </select> <br /><input type="submit" name="vendorBtn" value=" PILIH " />
        </form>
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
</div>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>