<?php
	if(is_logged()) {
		$_template->assign("loginStatus", 1);
	} else {
		$_template->assign("loginStatus", 0);
	}
	
	if(isset($_POST[lUser]) && isset($_POST[lPassword]) && !is_logged()) {
		$conn = new DbConnector();
		
		// Query to users_info_basic VIEW TABLE
		$q = "SELECT user_level FROM ep_users " .
			 "WHERE user_name = '$_POST[lUser]' " .
			 "AND user_password = MD5('$_POST[lPassword]') AND deleted_reason = '' LIMIT 1";
		$login = $conn->fetchObject($conn->query($q));
		
		if($login->user_level > 0) {
			// Assign login status to template
			$_template->assign("loginStatus", 1);
			
			// Session Initialisation - Step 1
			$_SESSION[logged] = true;

			// Session Initialisation - Step 2
			if($login->user_level == 1 || $login->user_level == 2) {
				$q = "SELECT * FROM users_info_eproc WHERE user_name = '$_POST[lUser]' " .
					 "AND user_password = MD5('$_POST[lPassword]') LIMIT 1";
				$user = $conn->fetchObject($conn->query($q));
				
				$_SESSION[user][id] = $user->user_id;
				$_SESSION[user][name] = $user->user_name;
				$_SESSION[user][level] = $user->user_level;
				$_SESSION[user][lastlogin] = $user->lastlogin;
				$_SESSION[user][detail_table] = $user->detail_table;
				$_SESSION[user][description] = $user->description;
				$_SESSION[user][fName] = $user->fName;
				$_SESSION[user][lName] = $user->lName;
				$_SESSION[user][address] = $user->address;
				$_SESSION[user][city] = $user->city;
				$_SESSION[user][state] = $user->state;
				$_SESSION[user][zip] = $user->zip;
				$_SESSION[user][nik] = $user->nik;
				$_SESSION[user][curr_position] = $user->curr_position;
				$_SESSION[user][division] = $user->division;
				$_SESSION[user][is_admin] = $user->is_admin;
				
				// Eproc & Eproc Admin Default Page
				header("Location: ?mod=landingpage");
			} else if($login->user_level == 3) {
				$q = "SELECT * FROM users_info_division WHERE user_name = '$_POST[lUser]' " .
					 "AND user_password = MD5('$_POST[lPassword]') LIMIT 1";
				$user = $conn->fetchObject($conn->query($q));
				
				$_SESSION[user][id] = $user->user_id;
				$_SESSION[user][name] = $user->user_name;
				$_SESSION[user][level] = $user->user_level;
				$_SESSION[user][lastlogin] = $user->lastlogin;
				$_SESSION[user][detail_table] = $user->detail_table;
				$_SESSION[user][description] = $user->description;
				$_SESSION[user][fName] = $user->fName;
				$_SESSION[user][lName] = $user->lName;
				$_SESSION[user][address] = $user->address;
				$_SESSION[user][city] = $user->city;
				$_SESSION[user][state] = $user->state;
				$_SESSION[user][zip] = $user->zip;
				$_SESSION[user][nik] = $user->nik;
				$_SESSION[user][curr_position] = $user->curr_position;
				$_SESSION[user][division] = $user->division;
				
				header("Location: ?mod=landingpage");
			} else if($login->user_level == 4) {
				$q = "SELECT * FROM users_info_vendor WHERE user_name = '$_POST[lUser]' " .
					 "AND user_password = MD5('$_POST[lPassword]') LIMIT 1";
				$user = $conn->fetchObject($conn->query($q));
				
				$_SESSION[user][id] = $user->user_id;
				$_SESSION[user][name] = $user->user_name;
				$_SESSION[user][level] = $user->user_level;
				$_SESSION[user][lastlogin] = $user->lastlogin;
				$_SESSION[user][detail_table] = $user->detail_table;
				$_SESSION[user][description] = $user->description;
				$_SESSION[user][vendor][name] = $user->vendor_name;
				$_SESSION[user][vendor][npwp] = $user->vendor_npwp;
				$_SESSION[user][vendor][address] = $user->vendor_addr;
				$_SESSION[user][vendor][city] = $user->vendor_city;
				$_SESSION[user][vendor][state] = $user->vendor_state;
				$_SESSION[user][vendor][zip] = $user->vendor_zip;
				$_SESSION[user][vendor][tlp] = $user->vendor_tlp;
				$_SESSION[user][vendor][fax] = $user->vendor_position;
				$_SESSION[user][vendor][email] = $user->vendor_email;
				$_SESSION[user][vendor][web] = $user->vendor_web;
				$_SESSION[user][vendor][akte_pendirian] = $user->vendor_akte_pendirian;
				$_SESSION[user][vendor][tgl_pendirian] = $user->vendor_tgl_pendirian;
				$_SESSION[user][vendor][akte_perubahan] = $user->vendor_akte_perubahan;
				$_SESSION[user][vendor][tgl_perubahan] = $user->vendor_tgl_perubahan;
				$_SESSION[user][vendor][nearest_branch] = $user->nearest_branch;
				$_SESSION[user][vendor][qualification] = $user->vendor_qualification;
				$_SESSION[user][vendor][sub_bidang] = $user->vendor_sub_bidang;
				$_SESSION[user][vendor][resp][name] = $user->resp_name;
				$_SESSION[user][vendor][resp][position] = $user->resp_position;
				$_SESSION[user][vendor][resp][addr] = $user->resp_addr;
				$_SESSION[user][vendor][resp][city] = $user->resp_city;
				$_SESSION[user][vendor][resp][state] = $user->resp_state;
				$_SESSION[user][vendor][resp][zip] = $user->resp_zip;
				$_SESSION[user][vendor][resp][tlp] = $user->resp_tlp;
				$_SESSION[user][vendor][resp][hp] = $user->resp_hp;
				$_SESSION[user][vendor][resp][email] = $user->resp_email;
				$_SESSION[user][vendor][resp][ktp] = $user->resp_ktp;
				$_SESSION[user][vendor][resp][birth_place] = $user->resp_birth_place;
				$_SESSION[user][vendor][resp][birth_date] = $user->resp_birth_date;
			}
		}
				
		// Timestamp the lastlogin field
		$table = "ep_users";
		$where = "WHERE user_id = " . $_SESSION[user][id] . " LIMIT 1";
		$rec[lastlogin] = mktime();
		$conn->update($table, $rec, $where);
		
		$conn->close();
	}
	
	if(isset($_GET[logout])) {
		unset($_SESSION);
		session_destroy();
		header("Location: /");
	}
?>