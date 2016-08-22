<?php /* Smarty version 2.6.18, created on 2008-05-30 15:32:34
         compiled from frontpage.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "short-info.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	<div class="dr">
		<div class="dc">
			<div class="cont">
				<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="24" alt="" /><br />
				<div class="dt mrg">
					<div class="dr">
						<div class="dc" style="line-height:11px; border-bottom:1px solid #cacac0">&nbsp;</div>
					</div>
					<div class="dr">
						<div class="dc" style="line-height:10px;">&nbsp;</div>
					</div>
				</div>
				<div class="dt mrg">
					<div class="dr">
						<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontpage-tenders.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="dr">
    	<div class="dc">
        	<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="15" alt="" /><br />
        </div>
    </div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>