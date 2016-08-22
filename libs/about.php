<?php
	$conn = new DbConnector();
	$q = "SELECT settings_desc FROM ep_app_settings WHERE settings_name = 'aboutPage' LIMIT 1";
	$about = $conn->fetchArray($conn->query($q));
	$_template->assign("about", $about);
	$conn->close();
	
	$_template->display("frontpage-about.tpl");
?>