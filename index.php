<?php
	/* --------------------------------------
	   Pertagas eProcurement Application v1.0
	   -------------------------------------- 
	   PT. ERP Solusi - Februari 2008
	   Programmer: Batista R. Harahap
	   Email: tistaharahap@gmail.com
	   ---------------------------	----------- */
	
	// Config
	include 'config.inc.php';
	
	// Super Global
	define(DIRECTORY_SEPARATOR, "/"); // Change if in Windows with double backslash
	
	include "inc/globals.inc.php";
	if(!isset($_SESSION)) {
		session_start();
	}
	
	// Database connector - MySQL
	include "classes/DbConnector.class.php";
	//include "classes/numbers/Words.php";
	
	include "inc/functions.inc.php";
	include SMARTY_DIR . "Smarty.class.php";
	
	// Smarty Initialisation
	$_template = new Smarty();
	$_template->template_dir = THEME_DIR . getCurrentTheme();
	$_template->compile_dir = $_template->template_dir . "/compiled";
	$_template->cache_dir = $_template->template_dir . "/cached";
	$_template->config_dir = $_template->template_dir . "/config";
	
	$_template->assign("appTitle", getAppTitle());
	$_template->assign("templateDir", $_template->template_dir);
	$_template->assign("ABS_DIR", ABS_DIR);
	
	// Mandatory Logged-In Initialisation
	include "libs/login.php";
	if($_SESSION[logged]) {
		$_template->assign("loginStatus", 1);
		$_template->assign("_username", $_SESSION[user][name]);
		$_template->assign("_lastlogin", $_SESSION[user][lastlogin]);
		$_template->assign("_userLevel", $_SESSION[user][level]);
		$_template->assign("_fullName", $_SESSION[user][fName] . " " . $_SESSION[user][lName]);
		$_template->assign("_SESSION", $_SESSION);
	}
	
	if($_GET[mod] == "") {
		$_GET[mod] = "frontpage";
	}
	
	/* ------------ Per-Module Libraries - START ------------ */
	
	if($_GET[mod] == "frontpage") {					// Frontpage
		include "libs/frontpage.php";
		$_template->display("frontpage.tpl");
	}
	else if($_GET[mod] == "reset-pass") {			// Forgot Password
		include "libs/reset-password.php";
		$_template->display("reset-password.tpl");
	}
	else if($_GET[mod] == "vendor") {				// Vendor
		if($_SESSION[logged]) {
			include "libs/vendor.php";
		}
		else {
			header("Location: ?mod=frontpage");
		}
	}
	else if($_GET[mod] == "landingpage") {			// Landing Page
		if($_SESSION[user][level] == 1 || $_SESSION[user][level] == 2) {
			include "libs/landingpage-eproc.php";
		}
		if($_SESSION[user][level] == 3) {
			include "libs/landingpage-divuser.php";
		}
		if($_SESSION[user][level] == 4) {
			include "libs/landingpage-vendor.php";
		}
	}
	else if($_GET[mod] == "eproc") {				// eProcurement Users
		if($_SESSION[user][level] == 1 || $_SESSION[user][level] == 2) {
			include "libs/eproc.php";
		}
		else {
			// Not Valid eProc User
			header("Location: ?mod=frontpage");
		}
	}	
	else if($_GET[mod] == "divuser") {				// Division Users
		include "libs/division.php";
	}
	else if($_GET[mod] == "about") {
		include "libs/about.php";
	}
	else {
		header("Location: index.php?logout");
	}
	
	/* ------------- Per-Module Libraries - END ------------- */
?>
