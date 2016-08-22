<?php /* Smarty version 2.6.18, created on 2008-05-30 15:32:42
         compiled from eproc-tender-list.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'capitalize', 'eproc-tender-list.tpl', 60, false),array('modifier', 'date_format', 'eproc-tender-list.tpl', 61, false),)), $this); ?>
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
<?php echo '
<script language="javascript">
	function approveTender(tid, idx) {
		tenderType = document.getElementById(\'tender_type\' + idx).value;
		if(confirm(\'Apakah anda yakin ingin menyetujui Tender ini?\')) {
			url = \'?mod=eproc&act=tender-approval&mode=app&step=2&tender_id=\';
			url2 = tid + \'&tender_type=\' + tenderType;
			top.location.href = url + url2;
		}
	}
	function delTender(tid) {
		if(confirm(\'Apakah anda yakin ingin menolak TENDER ini?\')) {
			top.location.href=\'?mod=eproc&act=tender-approval&mode=del&tender_id=\' + tid;
		}
	}
</script>
'; ?>

<?php endif; ?>
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<?php if ($this->_tpl_vars['_appTender'] == 1): ?>
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>TENDER TELAH APPROVE</strong></span>
    </p>
    <?php endif; ?>
	<?php if ($this->_tpl_vars['_delTender'] == 1): ?>
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>TENDER TELAH DITOLAK</strong></span>
    </p>
    <?php endif; ?>
	<?php if ($this->_tpl_vars['ditetapkan'] == 1): ?>
	<p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>PEMENANG TENDER TELAH DITETAPKAN</strong></span>
    </p>
	<?php endif; ?>
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Pending Approval</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px"><strong>No.</strong></td>
              <td valign="top" style="padding: 5px"><strong>Request Status</strong></td>
              <td valign="top" style="padding: 5px"><strong>Tanggal Request</strong></td>
              <td valign="top" style="padding: 5px"><strong>Request Type</strong></td>
              <td valign="top" style="padding: 5px"><strong>Purpose</strong></td>
              <?php if ($this->_tpl_vars['_userLevel'] == 1): ?>
                <td valign="top" style="padding: 5px"><strong>Jenis Tender</strong></td>
              <td valign="top" style="padding: 5px"><strong>Approval</strong></td>
              <td valign="top" style="padding: 5px">&nbsp;</td>
                <?php endif; ?>
                <td valign="top" style="padding: 5px">&nbsp;</td>
            </tr>
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
                <td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['req_purpose'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
                <?php if ($this->_tpl_vars['_userLevel'] == 1): ?>
                <td valign="top" style="padding: 5px">
                	<select id="tender_type<?php echo $this->_sections['tender']['index']+1; ?>
" name="tender_type<?php echo $this->_sections['tender']['index']+1; ?>
" class="textBox">
                    	<?php unset($this->_sections['type']);
$this->_sections['type']['name'] = 'type';
$this->_sections['type']['loop'] = is_array($_loop=$this->_tpl_vars['types']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['type']['show'] = true;
$this->_sections['type']['max'] = $this->_sections['type']['loop'];
$this->_sections['type']['step'] = 1;
$this->_sections['type']['start'] = $this->_sections['type']['step'] > 0 ? 0 : $this->_sections['type']['loop']-1;
if ($this->_sections['type']['show']) {
    $this->_sections['type']['total'] = $this->_sections['type']['loop'];
    if ($this->_sections['type']['total'] == 0)
        $this->_sections['type']['show'] = false;
} else
    $this->_sections['type']['total'] = 0;
if ($this->_sections['type']['show']):

            for ($this->_sections['type']['index'] = $this->_sections['type']['start'], $this->_sections['type']['iteration'] = 1;
                 $this->_sections['type']['iteration'] <= $this->_sections['type']['total'];
                 $this->_sections['type']['index'] += $this->_sections['type']['step'], $this->_sections['type']['iteration']++):
$this->_sections['type']['rownum'] = $this->_sections['type']['iteration'];
$this->_sections['type']['index_prev'] = $this->_sections['type']['index'] - $this->_sections['type']['step'];
$this->_sections['type']['index_next'] = $this->_sections['type']['index'] + $this->_sections['type']['step'];
$this->_sections['type']['first']      = ($this->_sections['type']['iteration'] == 1);
$this->_sections['type']['last']       = ($this->_sections['type']['iteration'] == $this->_sections['type']['total']);
?>
                        	<option value="<?php echo $this->_tpl_vars['types'][$this->_sections['type']['index']]['type_id']; ?>
"><?php echo $this->_tpl_vars['types'][$this->_sections['type']['index']]['type_desc']; ?>
</option>
                        <?php endfor; endif; ?>
                    </select>                </td>
                <td valign="top" style="padding: 5px">
                	<input type="button" value="APPROVE" name="appBtn<?php echo $this->_sections['tender']['index']+1; ?>
" onclick="approveTender(<?php echo $this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['tender_id']; ?>
, <?php echo $this->_sections['tender']['index']+1; ?>
);" />                </td>
                <td valign="top" style="padding: 5px">
                	<input type="button" value="TOLAK" name="delBtn<?php echo $this->_sections['tender']['index']+1; ?>
" onclick="delTender(<?php echo $this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['tender_id']; ?>
)" />                </td>
                <?php endif; ?>
                <td valign="top" style="padding: 5px"><a href="?mod=divuser&act=view&tender_id=<?php echo $this->_tpl_vars['tenders'][$this->_sections['tender']['index']]['tender_id']; ?>
">VIEW</a></td>
            </tr>
            <?php endfor; endif; ?>
            <!--<tr bgcolor="#cccccc">
            	<td colspan="9" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA!</strong>                </td>
            </tr>
			<tr bgcolor="#cccccc">
            	<td colspan="6" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA!</strong>                </td>
            </tr>-->
        </table>
</p>
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Daftar Tender - Approved</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
			  <td valign="top" style="padding: 5px" align="center"><strong>No.</strong></td>
			  <td valign="top" style="padding: 5px" align="center"><strong>Purpose</strong></td>
			  <td valign="top" style="padding: 5px" align="center"><strong>Status</strong></td>
              <td valign="top" style="padding: 5px" align="center"><strong>Tanggal Request</strong></td>
              <td valign="top" style="padding: 5px" align="center"><strong>Request Type</strong></td>
			  <td valign="top" style="padding: 5px" align="center"><strong>Jenis Tender</strong></td>
              <td valign="top" style="padding: 5px" align="center">&nbsp;</td>
            </tr>
            <?php unset($this->_sections['approved']);
$this->_sections['approved']['name'] = 'approved';
$this->_sections['approved']['loop'] = is_array($_loop=$this->_tpl_vars['appr']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['approved']['show'] = true;
$this->_sections['approved']['max'] = $this->_sections['approved']['loop'];
$this->_sections['approved']['step'] = 1;
$this->_sections['approved']['start'] = $this->_sections['approved']['step'] > 0 ? 0 : $this->_sections['approved']['loop']-1;
if ($this->_sections['approved']['show']) {
    $this->_sections['approved']['total'] = $this->_sections['approved']['loop'];
    if ($this->_sections['approved']['total'] == 0)
        $this->_sections['approved']['show'] = false;
} else
    $this->_sections['approved']['total'] = 0;
if ($this->_sections['approved']['show']):

            for ($this->_sections['approved']['index'] = $this->_sections['approved']['start'], $this->_sections['approved']['iteration'] = 1;
                 $this->_sections['approved']['iteration'] <= $this->_sections['approved']['total'];
                 $this->_sections['approved']['index'] += $this->_sections['approved']['step'], $this->_sections['approved']['iteration']++):
$this->_sections['approved']['rownum'] = $this->_sections['approved']['iteration'];
$this->_sections['approved']['index_prev'] = $this->_sections['approved']['index'] - $this->_sections['approved']['step'];
$this->_sections['approved']['index_next'] = $this->_sections['approved']['index'] + $this->_sections['approved']['step'];
$this->_sections['approved']['first']      = ($this->_sections['approved']['iteration'] == 1);
$this->_sections['approved']['last']       = ($this->_sections['approved']['iteration'] == $this->_sections['approved']['total']);
?>
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px" align="center"><?php echo $this->_sections['approved']['index']+1; ?>
</td>
				<td valign="top" style="padding: 5px"><?php echo ((is_array($_tmp=$this->_tpl_vars['appr'][$this->_sections['approved']['index']]['req_purpose'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
				<td valign="top" style="padding: 5px" align="center"><strong><?php echo $this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status']; ?>
</strong></td>
                <td valign="top" style="padding: 5px" align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['appr'][$this->_sections['approved']['index']]['created_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d-%m-%Y") : smarty_modifier_date_format($_tmp, "%d-%m-%Y")); ?>
</td>
                <td valign="top" style="padding: 5px" align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['appr'][$this->_sections['approved']['index']]['req_type'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
				<td valign="top" style="padding: 5px" align="center"><?php echo $this->_tpl_vars['appr'][$this->_sections['approved']['index']]['type_desc']; ?>
</td>
                <td valign="top" style="padding: 5px">
				<?php if ($this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status'] == 'RFQ Empty'): ?>
					<a href="index.php?mod=eproc&act=tender-approval&mode=app&step=3&tender_id=<?php echo $this->_tpl_vars['appr'][$this->_sections['approved']['index']]['tender_id']; ?>
&tender_type=<?php echo $this->_tpl_vars['appr'][$this->_sections['approved']['index']]['tender_type']; ?>
&go=rfq">VIEW</a>
				<?php elseif ($this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status'] == 'Quotation Empty'): ?>
					<a href="index.php?mod=eproc&act=quo-list">VIEW</a>
				<?php elseif ($this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status'] == '1 Sampul Empty'): ?>
					<a href="index.php?mod=eproc&act=1sampul-list">VIEW</a>
				<?php elseif ($this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status'] == '2 Sampul 1 Empty' || $this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status'] == '2 Sampul 2 Empty'): ?>
					<a href="index.php?mod=eproc&act=2sampul-list">VIEW</a>
				<?php elseif ($this->_tpl_vars['appr'][$this->_sections['approved']['index']]['status'] == 'No Winner'): ?>
					<a href="index.php?mod=eproc&act=penetapan-list">VIEW</a>
				<?php endif; ?>
				</td>
            </tr>
            <?php endfor; endif; ?>
            <!--<tr bgcolor="#cccccc">
            	<td colspan="7" valign="top" style="padding: 5px" align="center">
                	<strong>TIDAK ADA!</strong>                </td>
            </tr>-->
        </table>
  </p>
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong><a name="ditetapkan">Daftar Tender - Telah Ditetapkan</a></strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
        	<tr bgcolor="#999999">
            	<td valign="top" style="padding: 5px" align="center"><strong>No.</strong></td>
                <td valign="top" style="padding: 5px" align="center"><strong>Purpose</strong></td>
				<td valign="top" style="padding: 5px" align="center"><strong>Status</strong></td>
                <td valign="top" style="padding: 5px" align="center"><strong>Tanggal Penetapan</strong></td>
				<td valign="top" style="padding: 5px" align="center"><strong>Jenis Tender</strong></td>
                <td valign="top" style="padding: 5px" align="center"><strong>Pemenang Tender</strong></td>
                <td valign="top" style="padding: 5px" align="center">&nbsp;</td>
            </tr>
			<?php if ($this->_tpl_vars['pntp'][0]['won_date'] > 0): ?>
            <?php unset($this->_sections['tetap']);
$this->_sections['tetap']['name'] = 'tetap';
$this->_sections['tetap']['loop'] = is_array($_loop=$this->_tpl_vars['pntp']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['tetap']['show'] = true;
$this->_sections['tetap']['max'] = $this->_sections['tetap']['loop'];
$this->_sections['tetap']['step'] = 1;
$this->_sections['tetap']['start'] = $this->_sections['tetap']['step'] > 0 ? 0 : $this->_sections['tetap']['loop']-1;
if ($this->_sections['tetap']['show']) {
    $this->_sections['tetap']['total'] = $this->_sections['tetap']['loop'];
    if ($this->_sections['tetap']['total'] == 0)
        $this->_sections['tetap']['show'] = false;
} else
    $this->_sections['tetap']['total'] = 0;
if ($this->_sections['tetap']['show']):

            for ($this->_sections['tetap']['index'] = $this->_sections['tetap']['start'], $this->_sections['tetap']['iteration'] = 1;
                 $this->_sections['tetap']['iteration'] <= $this->_sections['tetap']['total'];
                 $this->_sections['tetap']['index'] += $this->_sections['tetap']['step'], $this->_sections['tetap']['iteration']++):
$this->_sections['tetap']['rownum'] = $this->_sections['tetap']['iteration'];
$this->_sections['tetap']['index_prev'] = $this->_sections['tetap']['index'] - $this->_sections['tetap']['step'];
$this->_sections['tetap']['index_next'] = $this->_sections['tetap']['index'] + $this->_sections['tetap']['step'];
$this->_sections['tetap']['first']      = ($this->_sections['tetap']['iteration'] == 1);
$this->_sections['tetap']['last']       = ($this->_sections['tetap']['iteration'] == $this->_sections['tetap']['total']);
?>
            <tr bgcolor="#cccccc">
            	<td valign="top" style="padding: 5px" align="center"><?php echo $this->_sections['tetap']['index']+1; ?>
</td>
                <td valign="top" style="padding: 5px" align="center"><?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['req_purpose']; ?>
</td>
				<td valign="top" style="padding: 5px" align="center"><strong><?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['status']; ?>
</strong></td>
                <td valign="top" style="padding: 5px" align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['won_date'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d-%m-%Y") : smarty_modifier_date_format($_tmp, "%d-%m-%Y")); ?>
</td>
				<td valign="top" style="padding: 5px" align="center"><?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['tender_type']; ?>
</td>
                <td valign="top" style="padding: 5px" align="center"><?php echo ((is_array($_tmp=$this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['vendor_name'])) ? $this->_run_mod_handler('capitalize', true, $_tmp) : smarty_modifier_capitalize($_tmp)); ?>
</td>
                <td valign="top" style="padding: 5px">
				<?php if ($this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['status'] == 'Dokumentasi Empty'): ?>
					<a href="?mod=eproc&act=dokumentasi&tender_id=<?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['tender_id']; ?>
&tender_type=<?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['type_id']; ?>
">VIEW</a>
				<?php else: ?>
					<a href="index.php?mod=eproc&act=po&tender_id=<?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['tender_id']; ?>
&vendor_id=<?php echo $this->_tpl_vars['pntp'][$this->_sections['tetap']['index']]['win_vendor']; ?>
&disabled=+disabled">VIEW</a>
				<?php endif; ?>
				</td>
            </tr>
            <?php endfor; endif; ?>
			<?php endif; ?>
  </table>
    </p>
</div>
<br clear="all" />&nbsp;<br />
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>