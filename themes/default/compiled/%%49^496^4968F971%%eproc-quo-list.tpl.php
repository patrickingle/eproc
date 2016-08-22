<?php /* Smarty version 2.6.18, created on 2008-06-01 14:27:52
         compiled from eproc-quo-list.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'eproc-quo-list.tpl', 31, false),)), $this); ?>
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
	<?php if ($this->_tpl_vars['_GET']['success'] == 1): ?>
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	TENDER SUKSES DILELANG ULANG
        </span>
    </p>
    <?php endif; ?>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Quotation</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		Dibawah ini merupakan Daftar Quotation yang diurutkan berdasarkan tender-tender yang ada.
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<table border="0" cellpadding="0" cellspacing="0" width="80%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center"><strong>No.</strong></td>
                <td valign="top" align="center"><strong>Nama Tender</strong></td>
				<td valign="top" align="center"><strong>Tanggal</strong></td>
                <td valign="top" align="center"></td>
            </tr>
            <?php unset($this->_sections['ua']);
$this->_sections['ua']['name'] = 'ua';
$this->_sections['ua']['loop'] = is_array($_loop=$this->_tpl_vars['uap']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['ua']['show'] = true;
$this->_sections['ua']['max'] = $this->_sections['ua']['loop'];
$this->_sections['ua']['step'] = 1;
$this->_sections['ua']['start'] = $this->_sections['ua']['step'] > 0 ? 0 : $this->_sections['ua']['loop']-1;
if ($this->_sections['ua']['show']) {
    $this->_sections['ua']['total'] = $this->_sections['ua']['loop'];
    if ($this->_sections['ua']['total'] == 0)
        $this->_sections['ua']['show'] = false;
} else
    $this->_sections['ua']['total'] = 0;
if ($this->_sections['ua']['show']):

            for ($this->_sections['ua']['index'] = $this->_sections['ua']['start'], $this->_sections['ua']['iteration'] = 1;
                 $this->_sections['ua']['iteration'] <= $this->_sections['ua']['total'];
                 $this->_sections['ua']['index'] += $this->_sections['ua']['step'], $this->_sections['ua']['iteration']++):
$this->_sections['ua']['rownum'] = $this->_sections['ua']['iteration'];
$this->_sections['ua']['index_prev'] = $this->_sections['ua']['index'] - $this->_sections['ua']['step'];
$this->_sections['ua']['index_next'] = $this->_sections['ua']['index'] + $this->_sections['ua']['step'];
$this->_sections['ua']['first']      = ($this->_sections['ua']['iteration'] == 1);
$this->_sections['ua']['last']       = ($this->_sections['ua']['iteration'] == $this->_sections['ua']['total']);
?>
            <tr bgcolor="#ddd">
            	<td valign="top" align="center"><?php echo $this->_sections['ua']['index']+1; ?>
</td>
                <td valign="top" align="center"><?php echo $this->_tpl_vars['uap'][$this->_sections['ua']['index']]['req_purpose']; ?>
</td>
				<td valign="top" align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['uap'][$this->_sections['ua']['index']]['created_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d %b %y") : smarty_modifier_date_format($_tmp, "%d %b %y")); ?>
</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=quo-list&tender_id=<?php echo $this->_tpl_vars['uap'][$this->_sections['ua']['index']]['tender_id']; ?>
">QUOTE</a></td>
            </tr>
            <?php endfor; endif; ?>
  		</table>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">&nbsp;
    	
  </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>