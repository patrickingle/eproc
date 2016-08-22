<?php /* Smarty version 2.6.18, created on 2008-06-01 14:28:30
         compiled from eproc-cabang-edit.tpl */ ?>
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
	function hapus() {
		if(confirm(\'Apakah anda yakin ingin menghapus cabang ini?\')) {
			id = document.getElementById(\'nearest_branch\').value;
			top.location.href = \'index.php?mod=eproc&act=cabang&del_id=\' + id;
		}
	}
</script>
'; ?>

<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<?php if ($this->_tpl_vars['_GET']['addSuccess'] == 1): ?>
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	SUKSES DITAMBAHKAN
        </span>
    </p>
    <?php endif; ?>
	<?php if ($this->_tpl_vars['_GET']['delSuccess'] == 1): ?>
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	SUKSES DIHAPUS
        </span>
    </p>
    <?php endif; ?>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Cabang Pertagas</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		Gunakan Editor dibawah ini untuk melakukan perubahan Cabang.
	</p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Tambah Cabang</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
  		<form name="addCabang" method="post" action="index.php?mod=eproc&act=cabang">
			<p>Nama Cabang:</p>
			<p><input type="text" name="description" value="" class="btn" /></p>
			<p>&nbsp;</p>
			<p>Kode Cabang:</p>
			<p><input type="text" name="ep_code" value="" class="btn" /></p>
			<p>&nbsp;</p>
			<p>Kota:</p>
			<p><input type="text" name="city" value="" class="btn" /></p>
			<p>&nbsp;</p>
			<p><input type="submit" name="submitAddCabang" value=" TAMBAHKAN " /></p>
		</form>
    </p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" />
        <strong>Hapus Cabang</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<select name="nearest_branch" id="nearest_branch" class="btn">
			<option value="0">Silahkan Pilih..</option>
			<?php $_from = $this->_tpl_vars['branch']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['branch_id'] => $this->_tpl_vars['branch_desc']):
?>
			<option value="<?php echo $this->_tpl_vars['branch_id']; ?>
"<?php if ($this->_tpl_vars['branch_id'] == $this->_tpl_vars['user']['nearest_branch']): ?> selected<?php endif; ?>><?php echo $this->_tpl_vars['branch_desc']; ?>
</option>
			<?php endforeach; endif; unset($_from); ?>
		</select> <input type="button" value=" HAPUS " onclick="hapus();" />
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>