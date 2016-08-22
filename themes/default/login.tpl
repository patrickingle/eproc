				<div id="loginBar">
                {if $loginStatus == 0}
                	<p style="color: #000;"><strong>Login</strong></p>
                    <form name="loginForm" action="index.php" method="post">
                        <input type="text" name="lUser" value="Username" size="10" class="btn" onfocus="this.value=''" />
                        <input type="password" name="lPassword" value="password" size="10" class="btn" onfocus="this.value=''" />
                        <input type="submit" name="submitLogin" value="Go " class="btn" />
                    </form>
                    <p id="loginForgot"><a href="?mod=reset-pass" title="Forgot Password?" style="color: #000;">Forgot Password?</a></p>
                {else}
                	<p style="color: #000;">Selamat datang <strong>{$_username}</strong>, Login terakhir: {$_lastlogin|date_format:"%d %b %Y - %H:%M"}</p>
                    <input type="button" name="logoutBtn" value="Log Out " class="btn" onclick="top.location.href='index.php?logout'" />
                {/if}
                </div>