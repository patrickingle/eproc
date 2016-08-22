<?php /* Smarty version 2.6.18, created on 2003-01-01 00:44:06
         compiled from login.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'date_format', 'login.tpl', 11, false),)), $this); ?>
				<div id="loginBar">
                <?php if ($this->_tpl_vars['loginStatus'] == 0): ?>
                	<p style="color: #000;"><strong>Login</strong></p>
                    <form name="loginForm" action="index.php" method="post">
                        <input type="text" name="lUser" value="Username" size="10" class="btn" onfocus="this.value=''" />
                        <input type="password" name="lPassword" value="password" size="10" class="btn" onfocus="this.value=''" />
                        <input type="submit" name="submitLogin" value="Go " class="btn" />
                    </form>
                    <p id="loginForgot"><a href="?mod=reset-pass" title="Forgot Password?" style="color: #000;">Forgot Password?</a></p>
                <?php else: ?>
                	<p style="color: #000;">Selamat datang <strong><?php echo $this->_tpl_vars['_username']; ?>
</strong>, Login terakhir: <?php echo ((is_array($_tmp=$this->_tpl_vars['_lastlogin'])) ? $this->_run_mod_handler('date_format', true, $_tmp, "%d %b %Y - %H:%M") : smarty_modifier_date_format($_tmp, "%d %b %Y - %H:%M")); ?>
</p>
                    <input type="button" name="logoutBtn" value="Log Out " class="btn" onclick="top.location.href='index.php?logout'" />
                <?php endif; ?>
                </div>