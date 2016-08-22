<?php /* Smarty version 2.6.18, created on 2008-06-01 14:26:34
         compiled from divuser-allreq.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'divuser-allreq.tpl', 26, false),array('modifier', 'date_format', 'divuser-allreq.tpl', 27, false),array('modifier', 'upper', 'divuser-allreq.tpl', 29, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "divuser-conditional.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div id="wide" style="float: left; margin-left: 20px; width: 900px; font-size: 7pt;">
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Request - Approved/Winner</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Berikut adalah Daftar Tender yang anda majukan yang telah disetujui ataupun yang telah mempunyai pemenang.
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px"><strong>No.</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Status</strong></td>
                <td valign="top" style="padding: 5px"><strong>Tanggal Request</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Type</strong></td>
                <td valign="top" style="padding: 5px"><strong>Purpose</strong></td>
				<td valign="top" style="padding: 5px"><strong>Winning Vendor</strong></td>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            <?php if ($this->_tpl_vars['no']-$this->_tpl_vars['ecords'] == 0): ?>
            <?php unset($this->_sections['tender']);
$this->_sections['tender']['name'] = 'tender';
$this->_sections['tender']['loop'] = is_array($_loop=$this->_tpl_vars['tenders']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['tender']['show'] = true;
$this->_sections['tender']['max'] = $this->_sections['tender']['loop'];
$this->_sections['tender']['step'] = 1;
$this->_sections['tender']['start'] = $this->_sections['tender']['step'] > 0 ? 0 : $this->_sections['tender']['loop']-1;
if ($this->_sections['tender']['show']) {
    $this->_sections['tender']['total'] = $this->_sections['tender']['loop'];
    if ($this->_sections['tender']['total'] == 0)
        $this->_sections['tender']['show'] = false;
} else
    $this->_sections['tender']['total'] = 0;
if ($this->_sections['tender']['show']):

            for ($this->_sections['tender']['index'] = $this->_sections['tender']['start'], $this->_sections['tender']['iteration'] = 1;
                 $this->_sections['tender']['iteration'] <= $this->_sections['tender']['total'];
                 $this->_sections['tender']['index'] += $this->_sections['tender']['step'], $this->_sections['tender']['iteration']++):
$this->_sections['tender']['rownum'] = $this->_sections['tender']['iteration'];
$this->_sections['tender']['index_prev'] = $this->_sections['tender']['index'] - $this->_sections['tender']['step'];
$this->_sections['tender']['index_next'] = $this->_sections['tender']['index'] + $this->_sections['tender']['step'];
$this->_sections['tender']['first']      = ($this->_sections['tender']['iteration'] == 1);
$this->_sections['tender']['last']       = ($this->_sections['tender']['iteration'] == $this->_sections['tender']['total']);
?>
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px"><?php echo $this->_sections['tender']['index']+1; ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['request_status'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['created_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d-%m-%Y") : smarty_modifier_date_format($_tmp, "%d-%m-%Y")); ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['req_type'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['req_purpose'])) ? $this->_run_mod_handler('upper', true, $_tmp) : smarty_modifier_upper($_tmp)); ?>
</td>
				<td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['vendor_name'])) ? $this->_run_mod_handler('upper', true, $_tmp) : smarty_modifier_upper($_tmp)); ?>
</td>
                <td valign="top" style="padding: 5px"><a href="?mod=divuser&act=view&tender_id=<?php echo $this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['tender_id']; ?>
">VIEW</a></td>
            </tr>
            <?php endfor; endif; ?>
            <?php else: ?>
            <tr bgcolor="#cccccc">
            	<td colspan="6" valign="top" style="padding: 5px" align="center">
                	<strong>BELUM ADA REQUEST YANG ANDA MASUKKAN</strong>                </td>
            </tr>
            <?php endif; ?>
  </table>
  </p>
  <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender Request - Rejected</strong>
    </p>
	<p style="margin-top: 10px; font-size: 11pt">
		Berikut adalah Daftar Tender yang anda majukan yang ditolak.
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px"><strong>No.</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Status</strong></td>
                <td valign="top" style="padding: 5px"><strong>Tanggal Request</strong></td>
                <td valign="top" style="padding: 5px"><strong>Request Type</strong></td>
                <td valign="top" style="padding: 5px"><strong>Purpose</strong></td>
				<td valign="top" style="padding: 5px"><strong>Reason</strong></td>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
            <?php if ($this->_tpl_vars['no']-$this->_tpl_vars['ecords2'] == 0): ?>
            <?php unset($this->_sections['tender']);
$this->_sections['tender']['name'] = 'tender';
$this->_sections['tender']['loop'] = is_array($_loop=$this->_tpl_vars['rej']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['tender']['show'] = true;
$this->_sections['tender']['max'] = $this->_sections['tender']['loop'];
$this->_sections['tender']['step'] = 1;
$this->_sections['tender']['start'] = $this->_sections['tender']['step'] > 0 ? 0 : $this->_sections['tender']['loop']-1;
if ($this->_sections['tender']['show']) {
    $this->_sections['tender']['total'] = $this->_sections['tender']['loop'];
    if ($this->_sections['tender']['total'] == 0)
        $this->_sections['tender']['show'] = false;
} else
    $this->_sections['tender']['total'] = 0;
if ($this->_sections['tender']['show']):

            for ($this->_sections['tender']['index'] = $this->_sections['tender']['start'], $this->_sections['tender']['iteration'] = 1;
                 $this->_sections['tender']['iteration'] <= $this->_sections['tender']['total'];
                 $this->_sections['tender']['index'] += $this->_sections['tender']['step'], $this->_sections['tender']['iteration']++):
$this->_sections['tender']['rownum'] = $this->_sections['tender']['iteration'];
$this->_sections['tender']['index_prev'] = $this->_sections['tender']['index'] - $this->_sections['tender']['step'];
$this->_sections['tender']['index_next'] = $this->_sections['tender']['index'] + $this->_sections['tender']['step'];
$this->_sections['tender']['first']      = ($this->_sections['tender']['iteration'] == 1);
$this->_sections['tender']['last']       = ($this->_sections['tender']['iteration'] == $this->_sections['tender']['total']);
?>
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px"><?php echo $this->_sections['tender']['index']+1; ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['rej'][$this->_sections['tender']['index']]['request_status'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['rej'][$this->_sections['tender']['index']]['created_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d-%m-%Y") : smarty_modifier_date_format($_tmp, "%d-%m-%Y")); ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['rej'][$this->_sections['tender']['index']]['req_type'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['rej'][$this->_sections['tender']['index']]['req_purpose'])) ? $this->_run_mod_handler('upper', true, $_tmp) : smarty_modifier_upper($_tmp)); ?>
</td>
				<td valign="top" style="padding: 5px"><?php echo $this->_tpl_vars['rej'][$this->_sections['tender']['index']]['deleted_reason']; ?>
</td>
                <td valign="top" style="padding: 5px"><a href="?mod=divuser&act=view&tender_id=<?php echo $this->_tpl_vars['rej'][$this->_sections['tender']['index']]['tender_id']; ?>
">VIEW</a></td>
            </tr>
            <?php endfor; endif; ?>
            <?php else: ?>
            <tr bgcolor="#cccccc">
            	<td colspan="7" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA</strong>                </td>
            </tr>
            <?php endif; ?>
  		</table>
	</p>
</div>
<br clear="all" />
<p>&nbsp;</p>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>