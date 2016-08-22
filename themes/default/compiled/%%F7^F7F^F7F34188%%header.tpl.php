<?php /* Smarty version 2.6.18, created on 2003-01-01 00:44:06
         compiled from header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'dhtml_calendar_init', 'header.tpl', 13, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $this->_tpl_vars['appTitle']; ?>
</title>
<link href="<?php echo $this->_tpl_vars['templateDir']; ?>
/style.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="<?php echo $this->_tpl_vars['templateDir']; ?>
/style_ie.css" rel="stylesheet" type="text/css">
<![endif]-->
<link rel="shortcut icon" href="<?php echo $this->_tpl_vars['templateDir']; ?>
/favicon.ico" />
<script language="javascript" src="js/gen_validatorv2.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['templateDir']; ?>
/js/autoCurrency.js"></script>
<?php echo smarty_function_dhtml_calendar_init(array('src' => 'js/calendar/calendar.js','setup_src' => 'js/calendar/calendar-setup.js','lang' => 'js/calendar/lang/calendar-en.js','css' => 'js/calendar/calendar-brown.css'), $this);?>

<script type="text/JavaScript" src="<?php echo $this->_tpl_vars['templateDir']; ?>
/js/curvy/rounded_corners_lite.inc.js"></script>
<script type="text/JavaScript" src="<?php echo $this->_tpl_vars['templateDir']; ?>
/js/jquery.js"></script>
<script type="text/JavaScript" src="<?php echo $this->_tpl_vars['templateDir']; ?>
/js/doubleclick.js"></script>
</head>

<body>
<div class="dt main_t" style="border-top: 5px solid black;">
			<div class="header top_l">
				<div class="top fleft">
					<a href="index.php"><img src="themes/default/images/pertagas-logo.jpg" align="top" alt="" style="margin:14px 0px 0px 36px;" /></a>
				</div>
		                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "login.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
			</div>