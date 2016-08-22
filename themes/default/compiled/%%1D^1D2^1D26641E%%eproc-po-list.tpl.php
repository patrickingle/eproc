<?php /* Smarty version 2.6.18, created on 2008-06-01 14:27:39
         compiled from eproc-po-list.tpl */ ?>
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
        	PURCHASE ORDER SUKSES DIBUAT
        </span>
    </p>
    <?php endif; ?>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Purchase Order - Belum Dibuat</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
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
                <td valign="top" align="center"><a href="?mod=eproc&act=po&tender_id=<?php echo $this->_tpl_vars['uap'][$this->_sections['ua']['index']]['tender_id']; ?>
&vendor_id=<?php echo $this->_tpl_vars['uap'][$this->_sections['ua']['index']]['vendor_id']; ?>
">BUAT PO</a></td>
            </tr>
            <?php endfor; endif; ?>
        </table>
    </p>
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Purchase Order - Sudah Dibuat</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		<table border="0" cellpadding="0" cellspacing="0" width="60%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Nama Tender</td>
                <td valign="top" align="center"></td>
            </tr>
            <?php unset($this->_sections['ua']);
$this->_sections['ua']['name'] = 'ua';
$this->_sections['ua']['loop'] = is_array($_loop=$this->_tpl_vars['po']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
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
                <td valign="top" align="center"><?php echo $this->_tpl_vars['po'][$this->_sections['ua']['index']]['req_purpose']; ?>
</td>
                <td valign="top" align="center"><a href="?mod=eproc&act=po&tender_id=<?php echo $this->_tpl_vars['po'][$this->_sections['ua']['index']]['tender_id']; ?>
&vendor_id=<?php echo $this->_tpl_vars['po'][$this->_sections['ua']['index']]['vendor_id']; ?>
&disabled=<?php echo $this->_tpl_vars['disabled']; ?>
">VIEW</a></td>
            </tr>
            <?php endfor; endif; ?>
        </table>
	</p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>