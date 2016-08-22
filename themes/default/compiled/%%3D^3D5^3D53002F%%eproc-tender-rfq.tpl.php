<?php /* Smarty version 2.6.18, created on 2008-06-01 14:27:25
         compiled from eproc-tender-rfq.tpl */ ?>
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
	function goRFQ(id, ttype, tid) {
		if(id > 0) {
			url = "index.php?mod=eproc&act=tender-approval&go=rfq&mode=app&step=3&tender_id=" + 
				  tid + "&tender_type=" + ttype + "&vendor_id=" + id;
			top.location.href = url;
		} else {
			alert("Mohon pilih vendor yang ingin dikehendaki");
		}
	}
	function goPntp() {
		id = document.getElementById(\'pntpId\').value;
		if(id > 0 && confirm(\'Apakah anda yakin ingin menetapkan Vendor ini sebagai pemenang?\')) {
			document.getElementById(\'pntpForm\').submit();
		}
	}
</script>
'; ?>

<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<?php if ($this->_tpl_vars['_madeRFQ'] == 1): ?>
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>RFQ Sukses Dibuat</strong></span>
    </p>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['disabled'] == ' disabled' && $this->_tpl_vars['go'] == 'rfq'): ?>
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>RFQ Sudah Pernah Dibuatkan. Mohon pilih vendor lain.</strong></span>
    </p>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['go'] == 'rfq'): ?>
    <!-- RFQ Form -->
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Request for Quotation - <?php echo $this->_tpl_vars['tender']['req_purpose']; ?>
</strong>
        </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Mohon gunakan <em>drop down box</em> dibawah ini untuk memilih vendor mana yang ingin dibuatkan RFQ. Jika anda telah selesai membuatkan RFQ, mohon lanjutkan dengan menggunakan menu di sebelah kiri untuk membuat Berita Acara menurut jenis sampul.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
   	  <select name="vendor_list" class="textBox" id="vendor_list" style="font-size: 10pt;">
	   	  <option value="0">Mohon Pilih..</option>
            <?php unset($this->_sections['vl']);
$this->_sections['vl']['name'] = 'vl';
$this->_sections['vl']['loop'] = is_array($_loop=$this->_tpl_vars['vlist']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['vl']['show'] = true;
$this->_sections['vl']['max'] = $this->_sections['vl']['loop'];
$this->_sections['vl']['step'] = 1;
$this->_sections['vl']['start'] = $this->_sections['vl']['step'] > 0 ? 0 : $this->_sections['vl']['loop']-1;
if ($this->_sections['vl']['show']) {
    $this->_sections['vl']['total'] = $this->_sections['vl']['loop'];
    if ($this->_sections['vl']['total'] == 0)
        $this->_sections['vl']['show'] = false;
} else
    $this->_sections['vl']['total'] = 0;
if ($this->_sections['vl']['show']):

            for ($this->_sections['vl']['index'] = $this->_sections['vl']['start'], $this->_sections['vl']['iteration'] = 1;
                 $this->_sections['vl']['iteration'] <= $this->_sections['vl']['total'];
                 $this->_sections['vl']['index'] += $this->_sections['vl']['step'], $this->_sections['vl']['iteration']++):
$this->_sections['vl']['rownum'] = $this->_sections['vl']['iteration'];
$this->_sections['vl']['index_prev'] = $this->_sections['vl']['index'] - $this->_sections['vl']['step'];
$this->_sections['vl']['index_next'] = $this->_sections['vl']['index'] + $this->_sections['vl']['step'];
$this->_sections['vl']['first']      = ($this->_sections['vl']['iteration'] == 1);
$this->_sections['vl']['last']       = ($this->_sections['vl']['iteration'] == $this->_sections['vl']['total']);
?>
            <option value="<?php echo $this->_tpl_vars['vlist'][$this->_sections['vl']['index']]['vendor_id']; ?>
"><?php echo $this->_tpl_vars['vlist'][$this->_sections['vl']['index']]['vendor_name']; ?>
</option>
            <?php endfor; endif; ?>
        </select> <input type="button" onclick="goRFQ(document.getElementById('vendor_list').value, <?php echo $this->_tpl_vars['tender_type']; ?>
, <?php echo $this->_tpl_vars['tender_id']; ?>
)" value=" PILIH " name="selBtn" style="font-size: 10pt;" /> <input style="font-size: 10pt;" onclick="top.location.href='<?php echo $this->_tpl_vars['next']; ?>
'" type="button" value=" NEXT&raquo; " />
  	</p>
  	<?php if ($this->_tpl_vars['showRfq'] == 1): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-rfq-form.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php endif; ?>
    <?php endif; ?>
	<p>&nbsp;</p>
    <?php if ($this->_tpl_vars['go'] == '1sampul'): ?>
    <!-- PEMBUATAN 1 SAMPUL -->
    <p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Pembuatan 1 Sampul - <?php echo $this->_tpl_vars['tender']['req_purpose']; ?>
</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Masukkan jumlah penawaran tiap vendor dan kelengkapan dokumen vendor dengan menggunakan form dibawah ini.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<?php if ($this->_tpl_vars['tender_type'] == 3 || $this->_tpl_vars['tender_type'] == 5 || $this->_tpl_vars['tender_type'] == 8): ?>
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-1sampul.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        <?php endif; ?>
    </p>
    <?php endif; ?>
    <p>&nbsp;</p>
    <?php if ($this->_tpl_vars['go'] == 'penetapan'): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-penetapan.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['go'] == '2sampul'): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-2sampul.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['go'] == '2sampul2'): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-2sampul2.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    <?php endif; ?>
	<?php if ($this->_tpl_vars['go'] == "2sampul-complete"): ?>
	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "eproc-2sampul-complete.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	<?php endif; ?>
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>