<?php
	$conn = new DbConnector();
	$html2ps = "http://" . $_SERVER[SERVER_NAME] . HTML2PSL_SETTINGS . $_SERVER[SERVER_NAME] . "/pdfgen/1sampul.php?tender_id=";
	$sets = urlencode("/pdfgen/ringkasan1.php?tender_id=" . $_GET[tender_id] . "&tender_type=" . $_GET[tender_type] .
			"&lelang=" . $_GET[lelang]);
	$html2pspt = "http://" . $_SERVER[SERVER_NAME] . HTML2PSPT_SETTINGS . $_SERVER[SERVER_NAME] . $sets;
	$sets = urlencode("/pdfgen/ringkasan2.php?tender_id=" . $_GET[tender_id] . "&tender_type=" . $_GET[tender_type] .
			"&lelang=" . $_GET[lelang]);
	$html2pspt2 = "http://" . $_SERVER[SERVER_NAME] . HTML2PSPT_SETTINGS . $_SERVER[SERVER_NAME] . $sets;
	$sets = urlencode("/pdfgen/purchase-order.php?tender_id=" . $_GET[tender_id] . "&vendor_id=" . $_GET[vendor_id]);
	$html2pspo1 = "http://" . $_SERVER[SERVER_NAME] . HTML2PS3_SETTINGS . $_SERVER[SERVER_NAME] . $sets;
	$sets = urlencode("/pdfgen/purchase-order2.php?tender_id=" . $_GET[tender_id] . "&vendor_id=" . $_GET[vendor_id]);
	$html2pspo2 = "http://" . $_SERVER[SERVER_NAME] . HTML2PS3_SETTINGS . $_SERVER[SERVER_NAME] . $sets;
	
	$sets = urlencode("/pdfgen/rfq-form.php?tender_id=" . $_GET[tender_id] . "&vendor_id=" . $_GET[vendor_id]);
	$html2psrq = "http://" . $_SERVER[SERVER_NAME] . HTML2PS3_SETTINGS . 
				 $_SERVER[SERVER_NAME] . $sets;
	
	$_template->assign("html2psrq", $html2psrq);
	$_template->assign("html2pspo1", $html2pspo1);
	$_template->assign("html2pspo2", $html2pspo2);
	$_template->assign("html2ps", $html2ps);
	$_template->assign("html2pspt", $html2pspt);
	$_template->assign("html2pspt2", $html2pspt2);
	
	$repYearly = "http://" . $_SERVER['SERVER_NAME'] . "/pdfgen/report-yearly.php?year=";
	$_template->assign("repYearly", $repYearly);
	
	$_template->assign("_GET", $_GET);
	$_template->assign("_SESSION", $_SESSION);
	
	if($_GET[act] == "reg") {
		if($_GET[step] == 1) {
			$_eprocStep1Error = false;
			
			// Check if $_POST is not empty
			if(isset($_POST[submitEprocReg])) {
				// Check username availability
				if(isset($_POST[user_name]) && is_username($_POST[user_name])) {
					$_eprocStep1Error = true;
					$_template->assign("eUser_name", 1);
				}
				
				// Check if both the Password fields are identical
				if(isset($_POST[user_password1]) && $_POST[user_password1] != $_POST[user_password2]) {
					$_template->assign("eUser_password", 1);
					$_eprocStep1Error = true;
				}
				
				// Assign POST values to Template
				$_template->assign("pUser_name", $_POST[user_name]);
				$_template->assign("pFName", $_POST[fName]);
				$_template->assign("pLName", $_POST[lName]);
				$_template->assign("pCurr_position", $_POST[curr_position]);
				$_template->assign("pNik", $_POST[nik]);
				$_template->assign("pBirth_place", $_POST[birth_place]);
				$_template->assign("pBirth_date", $_POST[birth_date]);
				$_template->assign("pDiv_tlp", $_POST[div_tlp]);
				$_template->assign("pDiv_fax", $_POST[div_fax]);
				$_template->assign("pDiv_email", $_POST[div_email]);
				$_template->assign("pDiv_hp", $_POST[div_hp]);
				$_template->assign("pAddress", $_POST[address]);
				$_template->assign("pCity", $_POST[city]);
				$_template->assign("pState", $_POST[state]);
				$_template->assign("pZip", $_POST[zip]);
			}
			
			// Action if no Errors are found
			if(isset($_POST[submitEprocReg]) && $_eprocStep1Error == false) {
				unset($rec);
				$table = "ep_users";
				$rec[user_name] = $_POST[user_name];
				$rec[user_password] = md5($_POST[user_password1]);
				if(strtolower($_POST[is_admin]) == "on") {
					$rec[user_level] = 1;
				} else {
					$rec[user_level] = 2;
				}
				$rec[lastlogin] = mktime();
				$conn->insert($table, $rec);
				
				$q = "SELECT user_id FROM ep_users WHERE user_name = '$_POST[user_name]' " .
					 "AND user_level = $rec[user_level] LIMIT 1";
				$u = $conn->fetchObject($conn->query($q));
				$uid = $u->user_id;
				
				unset($rec);
				$table = "ep_users_eproc";
				$rec[user_id] = $uid;
				$rec[fName] = $_POST[fName];
				$rec[lName] = $_POST[lName];
				$rec[address] = $_POST[address];
				$rec[city] = $_POST[city];
				$rec[state] = $_POST[state];
				$rec[zip] = $_POST[zip];
				$rec[nik] = $_POST[nik];
				$rec[curr_position] = $_POST[curr_position];
				$rec[birth_place] = $_POST[birth_place];
				$rec[birth_date] = strtotime($_POST[birth_date]);
				$rec[div_tlp] = $_POST[div_tlp];
				$rec[div_fax] = $_POST[div_fax];
				$rec[div_email] = $_POST[div_email];
				$rec[div_hp] = $_POST[div_hp];
				$conn->insert($table, $rec);
				
				header("Location: ?mod=eproc&act=reg&step=2&uid=" . $uid . "&session=" . session_id());
			}
			
			$_template->display("eproc-reg1.tpl");
		}
		else if($_GET[step] == 2) {
			$_template->display("eproc-reg2.tpl");
		}
	}
	else if($_GET[act] == "smtp") {
		if(isset($_POST[submitSmtp])) {
			$table = "ep_app_settings";
			unset($rec);
			
			$rec[settings_value] = $_POST[smtp_server];
			$where = "WHERE settings_name = 'smtp_server' LIMIT 1";
			$conn->update($table, $rec, $where);
			
			$rec[settings_value] = $_POST[smtp_port];
			$where = "WHERE settings_name = 'smtp_port' LIMIT 1";
			$conn->update($table, $rec, $where);
		}
		
		$smtp[smtp_server] = getSmtpServer();
		$smtp[smtp_port] = getSmtpPort();
		$_template->assign("smtp", $smtp);
		
		$_template->display("eproc-smtp.tpl");
	}
	else if($_GET[act] == "dollar") {
		if(isset($_POST[submitDollar])) {
			$table = "ep_app_settings";
			unset($rec);
			
			$rec[settings_value] = $_POST[kurs_dollar];
			$where = "WHERE settings_name = 'kurs_dollar' LIMIT 1";
			$conn->update($table, $rec, $where);
		}
		
		$kurs = getKursDollar();
		$_template->assign("kurs", $kurs);
		
		$_template->display("eproc-dollar.tpl");
	}
	else if($_GET[act] == "report") {
		$_template->display("eproc-report.tpl");
	}
	else if($_GET[act] == "vendor-edit") {
		if(isset($_POST[submitEditVendor])) {
			unset($rec);
			foreach($_POST as $key => $value) {
				if(substr($key, 0, 6) == "vendor") {
					$rec[$key] = $value;
					if(substr($key, 0, 10) == "vendor_tgl") {
						$rec[$key] = strtotime($value);
					}
				}
			}
			$table = "users_info_vendor";
			$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			unset($rec);
			foreach($_POST as $key => $value) {
				if(substr($key, 0, 4) == "resp") {
					$rec[$key] = $value;
					if($key == "resp_birth_date") {
						$rec[$key] = strtotime($value);
					}
				}
			}
			$table = "users_info_vendor";
			$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			unset($rec);
			$rec[nearest_branch] = $_POST[nearest_branch];
			$table = "users_info_vendor";
			$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			header("Location: index.php?mod=eproc&act=vendor-edit&success=1&user_id=" . $_GET[user_id]);
		}
		
		$q = "SELECT * FROM users_info_vendor WHERE user_id = $_GET[user_id] LIMIT 1";
		$user = $conn->fetchArray($conn->query($q));
		$_template->assign("user", $user);
		
		$q = "SELECT * FROM ep_branches ORDER BY city";
		$res = $conn->query($q);
		$branch = "";
		while($row = $conn->fetchObject($res)) {
			$branch[$row->branch_id] = $row->ep_code . " - " . $row->description . " - " . $row->city;
		}
		$_template->assign("branch", $branch);
		
		$_template->display("eproc-vendor-edit.tpl");
	}
	else if($_GET[act] == "div-edit") {
		if(isset($_POST[submitDivReg])) {
			if($_POST[user_password1] == $_POST[user_password2] && $_POST[user_password1] != '') {
				unset($rec);
				$table = "ep_users";
				$rec[user_password] = md5($_POST[user_password1]);
				$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
				$conn->update($table, $rec, $where);
			}
			unset($rec);
			$table = "users_info_division";
			foreach($_POST as $key => $value) {
				if($key != 'submitDivReg' && $key != "user_password1" && $key != "user_password2") {
					$rec[$key] = $value;
				}
			}
			$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			header("Location: index.php?mod=eproc&act=div-edit&success=1&user_id=" . $_GET[user_id]);
		}
		
		$q = "SELECT * FROM users_info_division WHERE user_id = $_GET[user_id] LIMIT 1";
		$res = $conn->query($q);
		while($dd = $conn->fetchArray($res)) {
			foreach($dd as $key => $value) {
				$user[$key] = $value;
			}
		}
		$_template->assign("user", $user);
		
		$_template->display("eproc-div-edit.tpl");
	}
	else if($_GET[act] == "user-list") {
		// Eproc User
		$q = "SELECT user_id, user_name, lastlogin, user_level FROM ep_users " .
			 "WHERE (user_level = 1 OR user_level = 2) AND deleted_reason = '' " .
			 "ORDER BY user_level, user_id";
		$res = $conn->query($q); $i = 0;
		while($us = $conn->fetchArray($res)) {
			foreach($us as $key => $value) {
				$eusers[$i][$key] = $value;
			}
			if($us[user_level] == 1) {
				$eusers[$i][admin] = 1;
			}
			$i++;
		}
		$_template->assign("eusers", $eusers);
		
		// Division
		$q = "SELECT user_id, user_name, lastlogin FROM ep_users " .
			 "WHERE user_level = 3 AND deleted_reason = '' " .
			 "ORDER BY user_level, user_id";
		$res = $conn->query($q); $i = 0;
		while($dus = $conn->fetchArray($res)) {
			foreach($dus as $key => $value) {
				$dusers[$i][$key] = $value;
			}
			$i++;
		}
		$_template->assign("dusers", $dusers);
		
		// Vendors
		$q = "SELECT user_id FROM ep_users WHERE deleted_reason = '' " .
			 "AND user_level = 4 ORDER BY user_name ASC";
		$res = $conn->query($q); $i = 0;
		while($vus = $conn->fetchArray($res)) {
			$vusers[$i][user_id] = $vus[user_id];
			$vusers[$i][vendor_name] = getVendorNameById($vus[user_id]);
			$i++;
		}
		$_template->assign("vusers", $vusers);
		
		$_template->display("eproc-user-list.tpl");
	}
	else if($_GET[act] == "eproc-user") {
		if(isset($_POST[submitEprocReg])) {
			unset($rec);
			if($_POST[user_password1] != '' && $_POST[user_password2] != '' && $_POST[user_password1] == $_POST[user_password2]) {
				$rec[user_password] = md5($_POST[user_password1]);
				$table = "ep_users";
				$conn->update($table, $rec, "WHERE user_id = $_GET[user_id] LIMIT 1");
			}
			unset($rec);
			$table = "ep_users_eproc";
			$rec[fName] = $_POST[fName];
			$rec[lName] = $_POST[lName];
			$rec[curr_position] = $_POST[curr_position];
			$rec[address] = $_POST[address];
			$rec[city] = $_POST[city];
			$rec[state] = $_POST[state];
			$rec[zip] = $_POST[zip];
			$rec[nik] = $_POST[nik];
			$rec[birth_place] = $_POST[birth_place];
			$rec[div_tlp] = $_POST[div_tlp];
			$rec[div_fax] = $_POST[div_fax];
			$rec[div_email] = $_POST[div_email];
			$rec[div_hp] = $_POST[div_hp];
			$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			$url = "index.php?mod=eproc&act=eproc-user&success=1&user_id=" . $_GET[user_id];
			header("Location: " . $url);
		}
		
		$q = "SELECT * FROM users_info_eproc WHERE user_id = $_GET[user_id] LIMIT 1";
		$user = $conn->fetchArray($conn->query($q));
		
		$_template->assign("user", $user);
		$_template->display("eproc-euser-edit.tpl");
	}
	else if($_GET[act] == "del-user") {
		if(isset($_POST[submitDel])) {
			unset($rec);
			$rec[deleted_reason] = $_POST[deleted_reason];
			$table = "ep_users";
			$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			header("Location: index.php?mod=eproc&act=user-list&successDel=1");
		}
		
		if(getUserLevelById($_GET[user_id]) != 4) {
			$q = "SELECT user_name FROM ep_users WHERE user_id = $_GET[user_id] LIMIT 1";
			$user = $conn->fetchArray($conn->query($q));
		}
		else {
			$user[user_name] = getVendorNameById($_GET[user_id]);
		}
		
		$_template->assign("user", $user);
		$_template->display("eproc-user-del.tpl");
	}
	else if($_GET[act] == "archive-list") {
		if($_GET[tender_id] == 0) {
			$q = "SELECT req_purpose, tender_id, created_date FROM ep_tender_requests " .
				 "WHERE request_status != 'deleted' ORDER BY tender_id DESC";
			$res = $conn->query($q); $i = 0;
			while($rr = $conn->fetchArray($res)) {
				foreach($rr as $key => $value) {
					$uap[$i][$key] = $value;
				}
				$i++;
			}
			$_template->assign("uap", $uap);
		}
		else {
			if(is_rfqed($_GET[tender_id])) {
				$tender[rfq] = 1;
			}
			if(is_quoted2($_GET[tender_id])) {
				$tender[quoted] = 1;
			}
			switch(getTenderTypeByTenderId($_GET[tender_id])) {
				case 3: if(is_1sampul($_GET[tender_id])) $tender[sampul1] = 1; break;
				case 5: if(is_1sampul($_GET[tender_id])) $tender[sampul1] = 1; break;
				case 8: if(is_1sampul($_GET[tender_id])) $tender[sampul1] = 1; break;
				case 4: if(is_2sampul($_GET[tender_id])) $tender[sampul2] = 1; break;
				case 6: $tender[sp3] = 1; break;
			}
			if(is_won($_GET[tender_id])) {
				$tender[won] = 1;
			}
			if(is_doc2($_GET[tender_id])) {
				$tender[doc] = 1;
			}
			if(is_po2($_GET[tender_id])) {
				$tender[po] = 1;
			}
			$tender[win_vendor] = getTenderWinnerByTenderId($_GET[tender_id]);
			$tender[tender_name] = getTenderNameById($_GET[tender_id]);
			$tender[tender_type] = getTenderTypeByTenderId($_GET[tender_id]);
			$_template->assign("tender", $tender);
		}
		
		$_template->display("eproc-archive-list.tpl");
	}
	else if($_GET[act] == "quo-list") {
		if(!isset($_GET[tender_id])) {
			$q = "SELECT req_purpose, created_date, tender_id FROM ep_tender_requests WHERE request_status != 'deleted' " .
				 "ORDER BY tender_id DESC";
			$res = $conn->query($q); $i = 0;
			while($tp = $conn->fetchArray($res)) {
				if(!is_quoted3($tp[tender_id]) && getTenderStatus($tp[tender_id]) == 'Quotation Empty') {
					foreach($tp as $key => $value) {
						$uap[$i][$key] = $value;
					}
					$i++;
				}
			}
			$_template->assign("uap", $uap);
			
			$_template->display("eproc-quo-list.tpl");
		} else {
			$q = "SELECT vendor_id FROM ep_tender_rfq WHERE " .
				 "tender_id = $_GET[tender_id] ORDER BY vendor_id";
			$res = $conn->query($q); $i = 0;
			while($tp = $conn->fetchArray($res)) {
				foreach($tp as $key => $value) {
					$uap[$i][vendor_name] = strtoupper(getVendorNameById($value));
					$uap[$i][$key] = $value;
				}
				$i++;
			}
			
			$_template->assign("uap", $uap);
			$_template->assign("req_purpose", getTenderNameById($_GET[tender_id]));
			$_template->display("eproc-quo-vendor.tpl");
		}
	}
	else if($_GET[act] == "rfq-list") {
		/*$q = "SELECT a.vendor_id, a.tender_id, a.rfq_created_date, b.req_purpose, b.tender_type FROM ep_tender_rfq AS a, " .
			 "ep_tender_requests AS b WHERE a.tender_id = b.tender_id AND b.request_status != 'deleted' GROUP BY a.tender_id";
		$res = $conn->query($q); $i = 0;
		while($ite = $conn->fetchArray($res)) {
			if(is_rfqed2($ite[tender_id])) {
				foreach($ite as $key => $value) {
					if($key == "vendor_id") {
						$rfqs[$i][$key] = $value;
						$rfqs[$i][vendor_name] = getVendorNameById($value);
					} else {
						$rfqs[$i][$key] = $value;
					}
				}
				$i++;
			}
		}
		$_template->assign("rfqs", $rfqs);*/
		$q = "SELECT tender_id, vendor_id FROM ep_tender_bids GROUP BY tender_id ORDER BY bid_id DESC";
		$res = $conn->query($q); $i = 0;
		while($ite = $conn->fetchArray($res)) {
			if(!is_rfqed2($ite[tender_id])) {
				foreach($ite as $key => $value) {
					if($key == "vendor_id") {
						$rfqs[$i][$key] = $value;
						$rfqs[$i][vendor_name] = getVendorNameById($value);
					} else {
						$rfqs[$i][$key] = $value;
					}
				}
				$rfqs[$i][req_purpose] = getTenderNameById($ite[tender_id]);
				$rfqs[$i][tender_type] = getTenderTypeByTenderId($ite[tender_id]);
				$i++;
			}
		}
		$_template->assign("rfqs", $rfqs);
		
		$_template->display("eproc-rfq-list.tpl");
	}
	else if($_GET[act] == "doc-list") {
		$q = "SELECT tender_id, req_purpose, tender_type FROM ep_tender_requests WHERE " .
			 "request_status = 'winner' AND vendor_id > 0 ORDER BY tender_id DESC";
		$res = $conn->query($q); $i = 0; $j = 0;
		while($tt = $conn->fetchArray($res)) {
			if(!is_doc2($tt[tender_id])) {
				foreach($tt as $key => $value) {
						$uap[$i][$key] = $value;
				}
				$i++;
			}
			else {
				foreach($tt as $key => $value) {
						$doc[$j][$key] = $value;
				}
				$j++;
			}
		}
		
		$_template->assign("uap", $uap);
		$_template->assign("doc", $doc);
		$_template->display("eproc-doc-list.tpl");
	}
	else if($_GET[act] == "1sampul-list") {
		$q = "SELECT tender_id, tender_type, req_purpose FROM ep_tender_requests WHERE " .
			 "request_status != 'pending-approval' AND tender_type = 3 OR tender_type = 5 " .
			 "OR tender_type = 8 ORDER BY tender_id";
		$res = $conn->query($q); $i = 0;
		while($rd = $conn->fetchArray($res)) {
			if(!is_1sampul($rd[tender_id])) {
				foreach($rd as $key => $value) {
					$s1list[$i][$key] = $value;
				}
				$i++;
			}
		}
		
		$q = "SELECT tender_id, tender_type, req_purpose FROM ep_tender_requests WHERE " .
			 "request_status != 'pending-approval' AND tender_type = 3 OR tender_type = 5 " .
			 "OR tender_type = 8 ORDER BY tender_id";
		$res = $conn->query($q); $i = 0;
		while($rd = $conn->fetchArray($res)) {
			if(is_1sampul($rd[tender_id])) {
				foreach($rd as $key => $value) {
					$ys1list[$i][$key] = $value;
				}
				$i++;
			}
		}
		$_template->assign("s1list", $s1list);
		$_template->assign("ys1list", $ys1list);
		
		$_template->display("eproc-1sampul-list.tpl");
	}
	else if($_GET[act] == "2sampul-list") {
		$q = "SELECT tender_id, tender_type, req_purpose FROM ep_tender_requests WHERE " .
			 "request_status != 'pending-approval' AND tender_type = 4 ORDER BY tender_id";
		$res = $conn->query($q); $i = 0;
		while($rd = $conn->fetchArray($res)) {
			if(!is_2sampul($rd[tender_id])) {
				foreach($rd as $key => $value) {
					$s1list[$i][$key] = $value;
				}
				$i++;
			}
		}
		
		$q = "SELECT tender_id, tender_type, req_purpose FROM ep_tender_requests WHERE " .
			 "request_status != 'pending-approval' AND tender_type = 4 ORDER BY tender_id";
		$res = $conn->query($q); $i = 0;
		while($rd = $conn->fetchArray($res)) {
			if(is_2sampul($rd[tender_id])) {
				foreach($rd as $key => $value) {
					$ys1list[$i][$key] = $value;
				}
				$i++;
			}
		}
		$_template->assign("s1list", $s1list);
		$_template->assign("ys1list", $ys1list);
		
		$_template->display("eproc-2sampul-list.tpl");
	}
	else if($_GET[act] == "sp3-list") {
		$q = "SELECT tender_id, tender_type, req_purpose FROM ep_tender_requests WHERE " .
			 "request_status != 'pending-approval' AND tender_type = 6 ORDER BY tender_id";
		$res = $conn->query($q); $i = 0;
		while($rd = $conn->fetchArray($res)) {
			if(!is_sp3($rd[tender_id])) {
				foreach($rd as $key => $value) {
					$s1list[$i][$key] = $value;
				}
				$i++;
			}
		}
		
		$q = "SELECT tender_id, tender_type, req_purpose FROM ep_tender_requests WHERE " .
			 "request_status != 'pending-approval' AND tender_type = 6 ORDER BY tender_id";
		$res = $conn->query($q); $i = 0;
		while($rd = $conn->fetchArray($res)) {
			if(is_sp3($rd[tender_id])) {
				foreach($rd as $key => $value) {
					$ys1list[$i][$key] = $value;
				}
				$i++;
			}
		}
		$_template->assign("s1list", $s1list);
		$_template->assign("ys1list", $ys1list);
		
		$_template->display("eproc-sp3-list.tpl");
	}
	else if($_GET[act] == "dokumentasi") {
		if(is_won($_GET[tender_id])) {
			if(isset($_POST[submitRi1])) {
				$tbl = "ep_ringkasan1";
				unset($rec);
				
				$rec[tender_id] = $_GET[tender_id];
				$rec[tender_type] = $_GET[tender_type];
				$rec[doc_no_lelang] = $_POST[doc_no_lelang];
				$rec[doc_alasan_batal] = $_POST[doc_alasan_batal];
				$rec[doc_ambil_dok_lelang] = strtotime($_POST[doc_ambil_dok_lelang]);
				$rec[doc_tutup_lelang] = strtotime($_POST[doc_tutup_lelang]);
				$rec[doc_batal_lelang] = strtotime($_POST[doc_batal_lelang]);
				$rec[doc_penawar_lengkap] = $_POST[doc_penawar_lengkap];
				$rec[doc_penawar_tdk_lengkap] = $_POST[doc_penawar_tdk_lengkap];
				$rec[doc_penawar_klarifikasi] = $_POST[doc_penawar_klarifikasi];
				
				// Ringkasan 2
				$rec[doc_penjelasan] = $_POST[doc_penjelasan];
				$rec[doc_harga_tertinggi] = $_POST[doc_harga_tertinggi];
				$rec[doc_harga_penawaran_menjadi] = $_POST[doc_harga_penawaran_menjadi];
				$rec[doc_delivery_time_menjadi] = $_POST[doc_delivery_time_menjadi];
				$rec[doc_peringkat] = $_POST[doc_peringkat];
				$rec[doc_harga_usulan] = $_POST[doc_harga_usulan];
				$rec[doc_alasan_usulan] = $_POST[doc_alasan_usulan];
				$rec[doc_keterangan_lain] = $_POST[doc_keterangan_lain];
				$rec[doc_direktur_utama] = $_POST[doc_direktur_utama];

				for($i=0; $i<count($_POST[vendors]); $i++) {
					$rec[vendor_id] = $vid = $_POST[vendors][$i];
					$rec[doc_vendor_fetch_doc] = $_POST[doc_vendor_fetch_doc][$i];
					$rec[doc_vendor_bid] = $_POST[doc_vendor_bid][$i];
					$rec[doc_vendor_no_bid] = $_POST[doc_vendor_no_bid][$i];
					$rec[doc_rapat_pra] = strtotime($_POST[doc_rapat_pra][$i]);
					$rec[doc_tinjau_pra] = strtotime($_POST[doc_tinjau_pra][$i]);
					$rec[doc_surat_pengantar] = $_POST[doc_surat_pengantar][$i];
					$rec[doc_delivery_time] = $_POST[doc_delivery_time][$i];
					$rec[doc_surat_jaminan] = $_POST[doc_surat_jaminan][$i];
					$rec[doc_copy_api] = $_POST[doc_copy_api][$i];
					$rec[doc_keterangan] = $_POST[doc_keterangan][$i];
					
					// Ringkasan 2
					$rec[doc_administrasi] = $_POST[doc_administrasi][$i];
					$rec[doc_harga] = $_POST[doc_harga][$i];
					$rec[doc_tdtgn_berwenang] = $_POST[doc_tdtgn_berwenang][$i];
					$rec[doc_masa_berlaku] = $_POST[doc_masa_berlaku][$i];
					
					if($_POST[editMode] == 1) {
						$where = "WHERE tender_id = $_GET[tender_id] AND tender_type = " .
								 "$_GET[tender_type] AND vendor_id = $vid LIMIT 1";
						$conn->update($tbl, $rec, $where);
						$_template->assign("updateSuccess", 1);
					} else {
						$conn->insert($tbl, $rec);
					}
				}
			}
			
			// PDF Upload
			if(isset($_POST[submitPdf])) {
				$table = "ep_fp_items";
				unset($rec);
				$rec[pdf_desc] = $_POST[pdf_desc];
				$rec[pdf_upload_date] = mktime();
				$rec[tender_id] = $_GET[tender_id];
				
				if($_FILES[pdfFile][name] != '') {
					$ext = getFileExt($_FILES[pdfFile][name]);
					$seed_fn = rand(3342, 23423098) . rand(12, 123123) . "." . $ext;
					$target_fn = FP_REQ_DIR . $seed_fn;
					if(@move_uploaded_file($_FILES[pdfFile][tmp_name], $target_fn)) {
						@chmod($target_fn, 0777);
						$rec[pdf_filename] = urlencode($seed_fn);
						$conn->insert($table, $rec);
						$_template->assign("upl", 1);
					}
				}
				
				$url = "index.php?mod=eproc&act=dokumentasi&tender_id=" . $_GET[tender_id] . "&tender_type=" .
					   $_GET[tender_type] . "&lelang=" . $_GET[lelang] . "&upl=1";
				header("Location: " . $url);
			}
			
			// Delete PDF
			if($_GET[sub] == "hapus" && $_GET[fp_id] > 0) {
				$q = "DELETE FROM ep_fp_items WHERE fp_id = $_GET[fp_id] && tender_id = $_GET[tender_id] LIMIT 1";
				$conn->query($q);
				$_template->assign("del", 1);
			}
			
			// Frontpage PDF File Check
			$q = "SELECT fp_id FROM ep_fp_items WHERE tender_id = $_GET[tender_id] LIMIT 1";
			$pdf = @$conn->fetchArray($conn->query($q));
			if($pdf[fp_id] > 0) {
				$_template->assign("fp_id", $pdf[fp_id]);
				$_template->assign("pdfDisable", " disabled");
			}
			
			// ep_tender_requests
			$q = "SELECT * FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
			$tender = @$conn->fetchArray($conn->query($q));
			$_template->assign("tender", $tender);
			
			// Tender Winner
			$q = "SELECT vendor_id FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
			$vv = $conn->fetchObject($conn->query($q));
			$winner[vendor_id] = $vv->vendor_id;
			$winner[vendor_name] = getVendorNameById($winner[vendor_id]);
			if($_GET[tender_type] == 3 || $_GET[tender_type] == 5 || $_GET[tender_type] == 8) {
				$q = "SELECT sampul_harga_penawaran FROM ep_sampul_1s WHERE " .
					 "tender_id = $_GET[tender_id] AND vendor_id = $winner[vendor_id] LIMIT 1";
				$rrr = $conn->fetchObject($conn->query($q));
				$winner[harga_penawaran] = numberFormat($rrr->sampul_harga_penawaran);
			}
			else if($_GET[tender_type] == 4) {
				$q = "SELECT sampul_total_harga FROM ep_sampul_2s2 WHERE " .
					 "tender_id = $_GET[tender_id] AND vendor_id = $winner[vendor_id] LIMIT 1";
				$rrr = $conn->fetchObject($conn->query($q));
				$winner[harga_penawaran] = numberFormat($rrr->sampul_total_harga);
			}
			$q = "SELECT rfq_delivery_time FROM ep_tender_rfq WHERE " .
				 "tender_id = $_GET[tender_id] AND vendor_id = $winner[vendor_id] LIMIT 1";
			$vvv = $conn->fetchObject($conn->query($q));
			$winner[delivery_time] = $vvv->rfq_delivery_time;
			$_template->assign("winner", $winner);
			
			// ep_tender_items
			$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id] ORDER BY item_id";
			$res = $conn->query($q);
			$tval = 0; $i = 0;
			while($it = $conn->fetchArray($res)) {
				foreach($it as $key => $value) {
					$items[$i][$key] = $value;
					if($key == "req_est_price") {
						$tval += $value * $items[$i][req_qty];
					}
				}
				$i++;
			}
			$_template->assign("items", $items);
			$_template->assign("tval", numberFormat($tval));
			
			// ep_tender_rfq
			$q = "SELECT * FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id DESC";
			$res = $conn->query($q); $i = 0;
			while(@$rr = $conn->fetchArray($res)) {
				foreach($rr as $key => $value) {
					$rfq[$i][$key] = $value;
					if($key == "vendor_id") {
						$rfq[$i][vendor_name] = getVendorNameById($value);
						$rfq[$i][vendor_npwp] = getNpwpById($value);
						$vendors[$i][vendor_id] = $rfq[$i][vendor_id];
						$vendors[$i][vendor_npwp] = $rfq[$i][vendor_npwp];
						$vendors[$i][vendor_name] = $rfq[$i][vendor_name];
					}
				}
				$i++;
			}
			$_template->assign("rfq", $rfq);
			$_template->assign("total_vendors", count($vendors));
			$_template->assign("vendors", $vendors);
			
			// Sampul Details
			if($_GET[tender_type] == 3 || $_GET[tender_type] == 5 || $_GET[tender_type] == 8) {
				$table[0] = "ep_sampul_1s";
			}
			else if($_GET[tender_type] == 4) {
				$table[0] = "ep_sampul_2s1";
				$table[1] = "ep_sampul_2s2";
			}
			else if($_GET[tender_type] == 6) {
				$table[0] = false;
			}
			if($table[0] != false) { 
				$j = 0;
				for($i=0; $i<count($table); $i++) {
					$q = "SELECT * FROM $table[$i] WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id DESC";
					$res = $conn->query($q);
					while($smp = $conn->fetchArray($res)) {
						foreach($smp as $key => $value) {
							$sampul[$i][$j][$key] = $value;
						}
						$j++;
					}
					$j = 0;
				}
			}
			else if($table[0] == false) {
				$url = "?mod=eproc&act=tender-approval&mode=app&step=3&tender_id=" . $_GET[tender_id] .
					   "&tender_type=6&go=rfq";
				header("Location: " . $url);
			}
			
			// Standarized Sampul Items
			for($i=0; $i<count($sampul[0]); $i++) {
				if(count($table) == 1) {
					$ssmp[$i][vendor_id] = $sampul[0][$i][vendor_id];
					$ssmp[$i][akte] = $sampul[0][$i][sampul_akte_pendirian];
					$ssmp[$i][ref_bank] = $sampul[0][$i][sampul_ref_bank];
					$ssmp[$i][bid_bond] = $sampul[0][$i][sampul_nilai_penawaran];
					$ssmp[$i][panitia_ketua] = $sampul[0][$i][sampul_panitia_ketua_nama];
					if(is_rfqed($_GET[tender_id])) {
						$ssmp[$i][rfq] = 1;
					}
					$ssmp[$i][spek_teknis] = $sampul[0][$i][sampul_ulasan_teknis];
				}
				else if(count($table) == 2) {
					$ssmp[$i][vendor_id] = $sampul[0][$i][vendor_id];
					$ssmp[$i][akte] = $sampul[0][$i][sampul_akte];
					$ssmp[$i][ref_bank] = $sampul[0][$i][sampul_ref_bank];
					$ssmp[$i][bid_bond] = $sampul[1][$i][sampul_nilai];
					$ssmp[$i][panitia_ketua] = $sampul[0][$i][sampul_panitia_ketua];
					if(is_rfqed($_GET[tender_id])) {
						$ssmp[$i][rfq] = 1;
					}
					$ssmp[$i][spek_teknis] = $sampul[0][$i][sampul_spek];
				}
			}
			$_template->assign("ssmp", $ssmp);
			
			// Available data
			$q = "SELECT * FROM ep_ringkasan1 WHERE tender_id = $_GET[tender_id] AND " .
				 "tender_type = $_GET[tender_type] ORDER BY vendor_id DESC";
			$res = $conn->query($q); $i = 0;
			if($conn->counter($res) > 0) {
				while($rin = $conn->fetchArray($res)) {
					foreach($rin as $key => $value) {
						$ringsatu[$i][$key] = $value;
					}
					$i++;
				}
				$_template->assign("ringsatu", $ringsatu);
				$_template->assign("editMode", 1);
			} else {
				$_template->assign("editMode", 0);
			}
			
			// Sampul Type
			$_template->assign("tender_parent", getTenderTypeById(getTenderTypeParentById($_GET[tender_type])));
			$_template->assign("tender_desc", getTenderTypeById($_GET[tender_type]));
			
			// Tender Ulang Bukan?
			if($tender[lelang_ulang] == 1) {
				$_GET[lelang] = 2;
			} 
			else if($tender[lelang_ulang] == 0) {
				$_GET[lelang] = 1;
			}
			
			$_template->assign("sampul", $sampul);
			$_template->assign("_GET", $_GET);
			$_template->assign("quo_currency", getQuoteCurrency($_GET[tender_id]));
			$_template->display("eproc-ringkasan.tpl");
		}
	}
	else if($_GET[act] == "po-list") {
		$q = "SELECT req_purpose, tender_id, tender_type, vendor_id FROM ep_tender_requests " .
			 "WHERE vendor_id > 0 AND request_status = 'winner' ORDER BY created_date";
		$res = $conn->query($q); $i = 0; $j = 0;
		while($the = $conn->fetchArray($res)) {
			if(!is_po($the[tender_id], $the[vendor_id])) {
				if(is_doc($the[tender_id], $the[vendor_id])) {
					foreach($the as $key => $value) {
						$holder[$i][$key] = $value;
					}
					$i++;
				}
			} else {
				foreach($the as $key => $value) {
					$po[$j][$key] = $value;
				}
				$j++;
			}
		}
		$_template->assign("uap", $holder);
		$_template->assign("po", $po);
		$_template->assign("disabled", urlencode(" disabled"));
		
		$_template->display("eproc-po-list.tpl");
	}
	else if($_GET[act] == "po") {
		if($_GET[tender_id] > 0 && $_GET[vendor_id] > 0) {
			if(isset($_POST[submitPo])) {
				$table = "ep_tender_po";
				unset($rec);
				$rec[po_type] = $_POST[po_type];
				$rec[po_number] = "3" . getLatestPoNumber();
				$rec[po_your_ref] = $_POST[po_your_ref];
				$rec[po_ship_to] = $_POST[po_ship_to];
				$rec[po_acc_no] = $_POST[po_acc_no];
				$rec[po_important] = $_POST[po_important];
				$rec[po_delivery_date] = strtotime($_POST[po_delivery_date]);
				$rec[po_payment_method] = $_POST[po_payment_method];
				$rec[po_remarks] = $_POST[po_remarks];
				$rec[po_gross_value] = $_POST[po_gross_value];
				$rec[po_payment_to] = $_POST[po_payment_to];
				$rec[po_terms_of_delivery] = $_POST[po_terms_of_delivery];
				$rec[po_ppn] = $_POST[po_ppn];
				$rec[po_net_value] = $_POST[po_net_value];
				$rec[po_net_wordings] = $_POST[po_net_wordings];
				$rec[po_vendor_name] = $_POST[po_vendor_name];
				$rec[po_vendor_position] = $_POST[po_vendor_position];
				$rec[po_pertagas_name] = $_POST[po_pertagas_name];
				$rec[po_pertagas_position] = $_POST[po_pertagas_position];
				$rec[tender_id] = $_GET[tender_id];
				$rec[vendor_id] = $_GET[vendor_id];
				$conn->insert($table, $rec);
				
				$table = "ep_tender_po_items";
				unset($rec);
				for($i=0; $i<count($_POST[item_price_per_unit]); $i++) {
					$rec[tender_id] = $_GET[tender_id];
					$rec[vendor_id] = $_GET[vendor_id];
					$rec[item_price_per_unit] = $_POST[item_price_per_unit][$i];
					$rec[item_total_price] = $_POST[item_total_price][$i];
					$conn->insert($table, $rec);
				}
				
				$url = "index.php?mod=eproc&act=po-list&success=1";
				$_template->assign("url", $url);
			}
			
			if(isset($_GET[disabled]) && $_GET[disabled] == '+disabled') {
				$_GET[disabled] = " disabled";
			}
			
			$q = "SELECT * FROM op_purchase_order WHERE tender_id = $_GET[tender_id] LIMIT 1";
			$po = $conn->fetchArray($conn->query($q));
			$_template->assign("po", $po);
			$_template->assign("quo_currency", getQuoteCurrency($_GET[tender_id]));
			
			// RFQ
			$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id]";
			$res = $conn->query($q); $i = 0;
			while($the = $conn->fetchArray($res)) {
				foreach($the as $key => $value) {
					$items[$i][$key] = $value;
				}
				$i++;
			}
			$_template->assign("items", $items);
			
			// PO Items
			$q = "SELECT * FROM ep_tender_po WHERE tender_id = $_GET[tender_id] AND vendor_id = $_GET[vendor_id] LIMIT 1";
			$apo = $conn->fetchArray($conn->query($q));
			$_template->assign("apo", $apo);
			$q = "SELECT * FROM ep_tender_po_items WHERE tender_id = $_GET[tender_id] " .
				 "AND vendor_id = $_GET[vendor_id] ORDER BY vendor_id";
			$res = $conn->query($q); $i = 0;
			while($a = $conn->fetchArray($res)) {
				foreach($a as $key => $value) {
					$api[$i][$key] = $value;
				}
				$i++;
			}
			$_template->assign("api", $api);
			
			// Doc Items
			$vid = getTenderWinnerByTenderId($_GET[tender_id]);
			$q = "SELECT doc_harga_usulan FROM ep_ringkasan1 WHERE " .
				 "tender_id = $_GET[tender_id] AND vendor_id = $_GET[vendor_id] LIMIT 1";
			$doc = $conn->fetchArray($conn->query($q));
			$doc[po_ppn] = $doc[doc_harga_usulan] * 0.1;
			$doc[po_grand_total] = $doc[doc_harga_usulan] + $doc[po_ppn];
			$doc[wordings] = terbilang($doc[po_grand_total], 4);
			$_template->assign("doc", $doc);
			
			$_template->assign("_GET", $_GET);
			$_template->display("eproc-po.tpl");
		}
	}
	else if($_GET[act] == "frontpage") {
		if(isset($_POST[settings_desc])) {
			unset($rec);
			$table = "ep_app_settings";
			$rec[settings_desc] = $_POST[settings_desc];
			$where = "WHERE settings_name = 'aboutPage' LIMIT 1";
			$conn->update($table, $rec, $where);
			
			header("Location: index.php?mod=eproc&success=1&act=frontpage");
		}
		
		$q = "SELECT settings_desc FROM ep_app_settings WHERE settings_name = 'aboutPage' LIMIT 1";
		$about = $conn->fetchArray($conn->query($q));
		$_template->assign("about", $about);
		
		$_template->display("eproc-frontpage-edit.tpl");
	}
	else if($_GET[act] == "cabang") {
		if(isset($_GET[del_id])) {
			$q = "DELETE FROM ep_branches WHERE branch_id = $_GET[del_id] LIMIT 1";
			$conn->query($q);
			
			header("Location: index.php?mod=eproc&act=cabang&delSuccess=1");
		}
		if(isset($_POST[submitAddCabang])) {
			unset($rec);
			$table = "ep_branches";
			$rec[ep_code] = $_POST[ep_code];
			$rec[description] = $_POST[description];
			$rec[city] = $_POST[city];
			$conn->insert($table, $rec);
			
			header("Location: index.php?mod=eproc&act=cabang&addSuccess=1");
		}
		
		// Cabang
		$q = "SELECT * FROM ep_branches ORDER BY city";
		$res = $conn->query($q);
		$branch = "";
		while($row = $conn->fetchObject($res)) {
			$branch[$row->branch_id] = $row->ep_code . " - " . $row->description . " - " . $row->city;
		}
		$_template->assign("branch", $branch);
		
		$_template->display("eproc-cabang-edit.tpl");
	}
	else if($_GET[act] == "penetapan-list") {
		$q = "SELECT tender_id, req_purpose, tender_type FROM ep_tender_requests WHERE request_status = 'approved' AND " .
			 "vendor_id = 0 ORDER BY tender_id ASC";
		$res = $conn->query($q); $i = 0;
		while($ua = $conn->fetchArray($res)) {
			if(is_rfqed($ua[tender_id])) {
				switch($ua[tender_type]) {
					case 3: $sampul = is_1sampul($ua[tender_id]); break;
					case 4: $sampul = is_2sampul($ua[tender_id]); break;
					case 5: $sampul = is_1sampul($ua[tender_id]); break;
					case 6: $sampul = is_sp3($ua[tender_id]); break;
					case 8: $sampul = is_1sampul($ua[tender_id]); break;
				}
				if($sampul) {
					foreach($ua as $key => $value) {
						if($key == "tender_type") {
							$uap[$i][type_name] = getTenderTypeById($value);
						}
						$uap[$i][$key] = $value;
					}
				}
			}
		}
		$i++;
		$_template->assign("uap", $uap);
		
		$_template->display("eproc-penetapan-list.tpl");
	}
	else if($_GET[act] == "pembatalan-list") {
		$q = "SELECT tender_id, req_purpose, created_date, tender_type FROM ep_tender_requests " .
			 "WHERE request_status = 'approved' ORDER BY created_date";
		$res = $conn->query($q); $i = 0;
		while($uu = $conn->fetchArray($res)) {
			foreach($uu as $key => $value) {
				$uap[$i][$key] = $value;
				if($key == "tender_type") {
					$uap[$i][type_name] = getTenderTypeById($value);
				}
			}
			$i++;
		}
		$_template->assign("uap", $uap);
		
		$q = "SELECT tender_id, deleted_reason, req_purpose, created_date, tender_type FROM ep_tender_requests " .
			 "WHERE request_status = 'deleted' ORDER BY created_date";
		$res = $conn->query($q); $i = 0;
		while($uu = $conn->fetchArray($res)) {
			foreach($uu as $key => $value) {
				$btl[$i][$key] = $value;
				if($key == "tender_type") {
					$btl[$i][type_name] = getTenderTypeById($value);
				}
			}
			$i++;
		}
		$_template->assign("btl", $btl);
			 
		$_template->display("eproc-pembatalan-list.tpl");
	}
	else if($_GET[act] == "pembatalan" && $_GET[tender_id] > 0) {
		if(isset($_POST[submitBatal])) {
			$table = "ep_tender_requests";
			unset($rec);
			$rec[deleted_reason] = $_POST[deleted_reason];
			$rec[deleted_date] = mktime();
			$rec[deleted_user_id] = $_SESSION[user][id];
			$rec[request_status] = "deleted";
			$where = "WHERE tender_id = $_GET[tender_id] LIMIT 1";
			$conn->update($table, $rec, $where);
			
			header("Location: index.php?mod=eproc&act=pembatalan-list&success=1");
		}
		
		$q = "SELECT req_purpose FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
		$tender = $conn->fetchArray($conn->query($q));
		$_template->assign("tender", $tender);
		
		$_template->assign("_GET", $_GET);
		$_template->display("eproc-pembatalan.tpl");
	}
	else if($_GET[act] == "retender-list") {
		$q = "SELECT tender_id, req_purpose, deleted_date, deleted_reason " .
			 "FROM ep_tender_requests WHERE request_status = 'deleted' ORDER BY deleted_date";
		$res = $conn->query($q); $i = 0;
		while($ret = $conn->fetchArray($res)) {
			foreach($ret as $key => $value) {
				$uap[$i][$key] = $value;
			}
			$i++;
		}
		$_template->assign("uap", $uap);
		
		$_template->display("eproc-retender-list.tpl");
	}
	else if($_GET[act] == "retender" && $_GET[tender_id] > 0) {
		if(isset($_POST[submitBatal]) && $_POST[choice] == 1) {
			// Tender Request Clone
			$q = "SELECT * FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
			$the = $conn->fetchArray($conn->query($q));
			unset($rec);
			foreach($the as $key => $value) {
				if($key != "tender_id" && $key != "created_date" && $key != "won_date" && $key != "deleted_date" && $key != "deleted_user_id" && $key != "deleted_reason" && $key != "vendor_id") {
					$rec[$key] = $value;
					if($key == "request_status") {
						$rec[request_status] = "pending-approval";
					}
					if($key == "approved_by") {
						$rec[$key] = 0;
					}
					if($key == "approved_date") {
						$rec[$key] = 0;
					}
					if($key == "lelang_ulang") {
						$rec[$key] = 1;
					}
					if($key == "req_purpose") {
						$rec[$key] = $_POST[req_purpose];
					}
				}
			}
			$table = "ep_tender_requests";
			$conn->insert($table, $rec);
			
			// Get New Tender ID
			$q = "SELECT tender_id FROM ep_tender_requests WHERE req_purpose = '$rec[req_purpose]' AND lelang_ulang = 1 LIMIT 1";
			$past = $conn->fetchArray($conn->query($q));
			
			// Tender Items Clone
			$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id] ORDER BY item_id";
			$res = $conn->query($q);
			unset($rec);
			while($ii = $conn->fetchArray($res)) {
				$rec[tender_id] = $past[tender_id];
				$rec[req_desc] = $ii[req_desc];
				$rec[req_qty] = $ii[req_qty];
				$rec[req_uom] = $ii[req_uom];
				$rec[req_date] = $ii[req_date];
				$rec[req_material_group] = $ii[req_material_group];
				$rec[req_currency] = $ii[req_currency];
				$rec[req_est_price] = $ii[req_est_price];
				$rec[req_mat_no] = $ii[req_mat_no];
				$rec[req_mgsg] = $ii[req_mgsg];
				$conn->insert($table, $rec);
			}
			
			header("Location: index.php?mod=eproc&act=retender-list&success=1");
		}
		else if(isset($_POST[submitBatal]) && $_POST[choice] < 1) {
			header("Location: index.php?mod=eproc&act=retender-list");
		}
		
		$q = "SELECT req_purpose FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
		$tender = $conn->fetchArray($conn->query($q));
		$_template->assign("tender", $tender);
		
		$_template->assign("_GET", $_GET);
		$_template->display("eproc-retender.tpl");
	}
	else if($_GET[act] == "tender-list") {
		// Pending Approval Tenders
		$q = "SELECT tender_id, user_id, request_status, created_date, req_type, req_purpose " .
			 "FROM ep_tender_requests WHERE request_status = 'pending-approval' " .
			 "ORDER BY user_id DESC, tender_id DESC";
		$res = $conn->query($q); $i = 0;
		if($conn->counter($res) > 0) {
			while($req = $conn->fetchObject($res)) {
				$tenders[$i][tender_id] = $req->tender_id;
				$tenders[$i][user_id] = $req->user_id;
				$tenders[$i][request_status] = $req->request_status;
				$tenders[$i][created_date] = $req->created_date;
				$tenders[$i][req_type] = $req->req_type;
				$tenders[$i][req_purpose] = $req->req_purpose;
				$i++;
			}
			$q = "SELECT type_id, type_desc FROM ep_tender_type WHERE type_parent != 0";
			$r2 = $conn->query($q); $i = 0;
			while($types = $conn->fetchObject($r2)) {
				$tt[$i][type_id] = $types->type_id;
				$tt[$i][type_desc] = $types->type_desc;
				$i++;
			}
			
			$_template->assign("types", $tt);
			$_template->assign("tenders", $tenders);
		}
		
		// Approved Tenders
		$q = "SELECT tender_id, tender_type, user_id, request_status, created_date, req_type, req_purpose " .
			 "FROM ep_tender_requests WHERE request_status = 'approved' " .
			 "ORDER BY user_id DESC, tender_id DESC";
		$res = $conn->query($q); $i = 0;
		if($conn->counter($res) > 0) {
			while($req = $conn->fetchObject($res)) {
				$appr[$i][tender_id] = $req->tender_id;
				$appr[$i][user_id] = $req->user_id;
				$appr[$i][number_of_bids] = getNumberOfBidByTender($req->tender_id);
				$appr[$i][created_date] = $req->created_date;
				$appr[$i][req_type] = $req->req_type;
				$appr[$i][req_purpose] = $req->req_purpose;
				$appr[$i][tender_type] = $req->tender_type;
				$appr[$i][type_desc] = getTenderTypeById($req->tender_type);
				$appr[$i][status] = getTenderStatus($req->tender_id);
				$i++;
			}
			$_template->assign("no-appr", 0);
			$_template->assign("appr", $appr);
		} else {
			$_template->assign("no-appr", 1);
		}
		
		// Appointed Tenders
		$q = "SELECT tender_id, tender_type, req_purpose, won_date, vendor_id FROM ep_tender_requests WHERE " .
			 "request_status = 'winner' AND vendor_id > 0 ORDER BY tender_id DESC";
		$res = $conn->query($q); $i = 0;
		while($pn = $conn->fetchArray($res)) {
			foreach($pn as $key => $value) {
				$pntp[$i][$key] = $value;
				if($key == "tender_type") {
					$pntp[$i][type_id] = $value;
					$pntp[$i][$key] = getTenderTypeById($value);
				}
			}
			$pntp[$i][status] = getTenderStatus($pn[tender_id]);
			$pntp[$i][vendor_name] = getVendorNameById($pntp[$i][vendor_id]);
			$pntp[$i][win_vendor] = getTenderWinnerByTenderId($pntp[$i][tender_id]);
			$i++;
		}

		$_template->assign("pntp", $pntp);
		$_template->assign("_appTender", $_GET[app]);
		$_template->assign("_delTender", $_GET[del]);
		$_template->assign("ditetapkan", $_GET[ditetapkan]);
		$_template->display("eproc-tender-list.tpl");
	}
	else if($_GET[act] == 'tender-approval') {
		if($_SESSION[user][level] == 1 && $_GET[tender_id] > 0) {
			if($_GET[mode] == 'app' && $_GET[tender_type] > 0) {				
				// Tender Approval - Step 2 - Appointing Vendor
				if($_GET[step] == 2 && checkTenderBidsByTender($_GET[tender_id])) {
					if(isset($_POST[vendorBtn]) && count($_POST[vendor_list]) > 0) {
						$table = "ep_tender_bids";
						for($i=0; $i < count($_POST[vendor_list]); $i++) {
							unset($rec);
							$rec[vendor_id] = $_POST[vendor_list][$i];
							$rec[tender_id] = $_POST[tender_id];
							$rec[bid_date] = mktime();
							$rec[bid_currency] = '';
							$rec[bid_sum] = 0;
							$rec[bid_status] = "pending-bid-value";
							$conn->insert($table, $rec);
						}
						
						unset($rec);
						$table = "ep_tender_requests";
						$rec[tender_type] = $_GET[tender_type];
						$rec[request_status] = "approved";
						$rec[approved_by] = $_SESSION[user][id];
						$rec[approved_date] = mktime();
						$where = "WHERE tender_id = $_GET[tender_id] LIMIT 1";
						$conn->update($table, $rec, $where);
						
						$url = "index.php?mod=eproc&act=tender-approval&mode=app&go=rfq&step=3&tender_id=" . 
							   $_GET[tender_id] . "&tender_type=" . $_GET[tender_type];
						header('Location: ' . $url);
					} else if(isset($_POST[vendorBtn]) && count($_POST[vendor_list]) == 0){
						$_template->assign("_eNoneSelected", 1);
					}
					
					$q = "SELECT user_id, vendor_name, vendor_state FROM " .
						 "users_info_vendor ORDER BY vendor_name ASC";
					$res = $conn->query($q); $i = 0;
					while($vendor = $conn->fetchObject($res)) {
						$vendors[$i][user_id] = $vendor->user_id;
						$vendors[$i][vendor_name] = $vendor->vendor_name;
						$vendors[$i][vendor_state] = $vendor->vendor_state;
						$i++;
					}
					
					$_template->assign("tender_id", $_GET[tender_id]);
					$_template->assign("PHP_SELF", $_SERVER['REQUEST_URI']);
					$_template->assign("vendors", $vendors);
					$_template->display("eproc-tender-app-step2.tpl");
				}
				
				// Step 3 - RFQ
				else if($_GET[step] == 3) {
					// Process RFQ Form
					if(isset($_POST[submitRfq])) {
						$table = "ep_tender_rfq";
						unset($rec);
						$rec[tender_id] = $_GET[tender_id];
						$rec[rfq_number] = $_POST[rfq_number];
						$rec[rfq_collective_number] = $_POST[rfq_collective_number];
						$rec[rfq_your_vendor_number] = $_POST[rfq_your_vendor_number];
						$rec[rfq_quotation_deadline] = $_POST[rfq_quotation_deadline];
						$rec[rfq_delivery_time] = $_POST[rfq_delivery_time];
						$rec[rfq_terms_of_delivery] = $_POST[rfq_terms_of_delivery];
						$rec[rfq_price_validity] = $_POST[rfq_price_validity];
						$rec[rfq_notes] = $_POST[rfq_notes];
						$rec[rfq_approval_person] = $_POST[rfq_approval_person];
						$rec[vendor_id] = $_GET[vendor_id];
						$rec[rfq_created_date] = mktime();
						$conn->insert($table, $rec);
						
						$table = "ep_tender_items";
						foreach($_POST[req_mat_no] as $key => $value) {
							unset($rec);
							$rec[req_mat_no] = $value;
							$rec[req_mgsg] = $_POST[req_mgsg][$key];
							$itemID = $_POST[item_id][$key];
							$where = "WHERE item_id = $itemID LIMIT 1";
							$conn->update($table, $rec, $where);
						}
						
						if($_GET[tender_type] != 6) {
							$url = "index.php?mod=eproc&go=rfq&act=tender-approval&mode=app&step=3&tender_id=" .
								   $_GET[tender_id] . "&tender_type=" . $_GET[tender_type] . "&maderfq=1";
							header('Location: ' . $url);
						}
						else if($_GET[tender_type] == 6) {
							$url = "mod=eproc&act=tender-approval&mode=app&step=3&tender_id=" . $_GET[tender_id] .
								   "&tender_type=6&vendor_id=" . $_GET[vendor_id] . "&go=rfq";
							header('Location: ' . $url);
						}
					}
					
					if($_GET[go] == "rfq") {
						$_template->assign("_madeRFQ", $_GET[maderfq]);
					}
					
					// Tender Details - General
					$q = "SELECT req_purpose FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
					$tender = $conn->fetchArray($conn->query($q));
					$_template->assign("tender", $tender);
					
					// Tender Details - Items
					$q = "SELECT item_id, req_desc, req_qty, req_uom, req_mat_no, req_mgsg FROM ep_tender_items " .
						 "WHERE tender_id = $_GET[tender_id]";
					$res = $conn->query($q); $i = 0;
					while($it = $conn->fetchObject($res)) {
						$items[$i][req_desc] = $it->req_desc;
						$items[$i][req_qty] = $it->req_qty;
						$items[$i][req_uom] = $it->req_uom;
						$items[$i][item_id] = $it->item_id;
						$items[$i][req_mgsg] = $it->req_mgsg;
						$items[$i][req_mat_no] = $it->req_mat_no;
						$i++;
					}
					$_template->assign("items", $items);
					
					// Check if the RFQ already existed
					if(isset($_GET[vendor_id]) && $_GET[go] == "rfq") {
						$q = "SELECT rfq_id FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id] AND " .
							 "vendor_id = $_GET[vendor_id] LIMIT 1";
						$res = $conn->query($q);
						if($conn->counter($res) == 1) {
							$_template->assign("disabled", " disabled");
						}
					}
					
					$_template->assign("next", "index.php?mod=eproc&act=quo-list");
					
					// Vendor Details
					if(isset($_GET[vendor_id])) {
						$q = "SELECT user_name, vendor_name, vendor_addr, vendor_city, vendor_state, vendor_zip, resp_name FROM " .
							 "users_info_vendor WHERE user_id = $_GET[vendor_id] LIMIT 1";
						$vendor = $conn->fetchArray($conn->query($q));
						$_template->assign("vendor", $vendor);
						$_template->assign("showRfq", 1);
					}
					
					// Vendor List
					$q = "SELECT vendor_id FROM ep_tender_bids WHERE tender_id = $_GET[tender_id] AND " .
						 "bid_sum = 0";
					$res = $conn->query($q); $i = 0;
					while($v = $conn->fetchObject($res)) {
						$vlist[$i][vendor_id] = $v->vendor_id;
						$vlist[$i][vendor_name] = strtoupper(getVendorNameById($v->vendor_id));
						$i++;
					}
					$_template->assign("vlist", $vlist);
					
					// 1 Sampul
					if(getTenderTypeParent($_GET[tender_type]) == 1 && is_rfqed($_GET[tender_id]) && $_GET[go] == "1sampul") {
						if(isset($_POST[submit1s])) {
							$table = "ep_sampul_1s";
							unset($rec);
							$rec[sampul_hrtgl] = $_POST[sampul_hrtgl];
							$rec[sampul_waktu] = $_POST[sampul_waktu];
							$rec[sampul_collective_no] = $_POST[sampul_collective_no];
							$rec[sampul_panitia_ketua_nama] = $_POST[sampul_panitia_ketua_nama];
							$rec[sampul_panitia_ketua_fungsi] = $_POST[sampul_panitia_ketua_fungsi];
							$rec[sampul_panitia_sekretaris_nama] = $_POST[sampul_panitia_sekretaris_nama];
							$rec[sampul_panitia_sekretaris_fungsi] = $_POST[sampul_panitia_sekretaris_fungsi];
							$rec[sampul_panitia_user_fungsi] = $_POST[sampul_panitia_user_fungsi];
							$rec[sampul_panitia_user_nama] = $_POST[sampul_panitia_user_nama];
							$rec[sampul_keterangan] = $_POST[sampul_keterangan];
							$rec[tender_id] = $_GET[tender_id];
							
							for($i=0; $i<count($_POST[vendor_id]); $i++) {
								$rec[vendor_id] = $_POST[vendor_id][$i];
								$rec[sampul_harga_penawaran] = $_POST[sampul_harga_penawaran][$i];
								$rec[sampul_materai] = $_POST[sampul_materai][$i];
								$rec[sampul_rekapitulasi] = $_POST[sampul_rekapitulasi][$i];
								$rec[sampul_nilai_penawaran] = $_POST[sampul_nilai_penawaran][$i];
								$rec[sampul_penerbit] = $_POST[sampul_penerbit][$i];
								$rec[sampul_ulasan_teknis] = $_POST[sampul_ulasan_teknis][$i];
								$rec[sampul_neraca] = $_POST[sampul_neraca][$i];
								$rec[sampul_ref_bank] = $_POST[sampul_ref_bank][$i];
								$rec[sampul_sst] = $_POST[sampul_sst][$i];
								$rec[sampul_tenaker] = $_POST[sampul_tenaker][$i];
								$rec[sampul_akte_pendirian] = $_POST[sampul_akte_pendirian][$i];
								$rec[sampul_copy_kontrak] = $_POST[sampul_copy_kontrak][$i];
								$rec[sampul_lengkap] = $_POST[sampul_lengkap][$i];
								
								$conn->insert($table, $rec);
							}
						}
						
						// Check Database
						if(is_1sampul($_GET[tender_id])) {
							$q = "SELECT * FROM ep_sampul_1s WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id";
							$res = $conn->query($q); $i = 0;
							while($sm = $conn->fetchArray($res)) {
								foreach($sm as $key => $value) {
									if($key != "sampul_id") {
										$smp[$i][$key] = $value;
										if($key == "sampul_harga_penawaran") {
											$smp[$i][$key] = numberFormat($value);
										}
										if($key == "sampul_nilai_penawaran") {
											$smp[$i][$key] = numberFormat($value);
										}
									}
								}
								$i++;
							}
							
							$_template->assign("smp", $smp);
							$_template->assign("disabled", " disabled");
						}
						
						$q = "SELECT vendor_id, rfq_collective_number FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id]";
						$res = $conn->query($q); $i = 0;
						while($ve = $conn->fetchArray($res)) {
							$rq[$i][vendor_id] = $ve[vendor_id];
							$rq[$i][vendor_name] = getVendorNameById($ve[vendor_id]);
							$rq[$i][rfq_collective_number] = $ve[rfq_collective_number];
							$i++;
						}
						$_template->assign("rq", $rq);
						
						// Quotations
						for($k=0; $k<count($rq); $k++) {
							$vendid = $rq[$k][vendor_id];
							$q = "SELECT quo_total_price, quo_currency FROM op_quotations WHERE tender_id = $_GET[tender_id] " .
								 "AND vendor_id = $vendid ORDER BY vendor_id";
							$rt = $conn->query($q); $i = 0;
							while($qq = $conn->fetchArray($rt)) {
								$total += $qq[quo_total_price];
								$quo[0][quo_currency] = $qq[quo_currency];
							}
							$quo[$k][quo_total_price] = $total;
							$total = 0;
						}
						$_template->assign("quo", $quo);
					}
					
					// 2 Sampul - Step 1
					if($_GET[go] == "2sampul") {
						if(isset($_POST[submit2S1])) {
							$table = "ep_sampul_2s1";
							unset($rec);
							$rec[sampul_hrtgl] = $_POST[sampul_hrtgl];
							$rec[sampul_waktu] = $_POST[sampul_waktu];
							$rec[sampul_tempat] = $_POST[sampul_tempat];
							$rec[sampul_collective_no] = $_POST[sampul_collective_no];
							$rec[tender_id] = $_GET[tender_id];
							$rec[sampul_tglcetak] = $_POST[sampul_tglcetak];
							$rec[sampul_panitia_ketua] = $_POST[sampul_panitia_ketua];
							$rec[sampul_panitia_sekretaris] = $_POST[sampul_panitia_sekretaris];
							$rec[sampul_panitia_keuangan] = $_POST[sampul_panitia_keuangan];
							$rec[sampul_panitia_hukum] = $_POST[sampul_panitia_hukum];
							$rec[sampul_panitia_user] = $_POST[sampul_panitia_user];
							$rec[sampul_panitia_proc] = $_POST[sampul_panitia_proc];
							$rec[sampul_panitia_ahli] = $_POST[sampul_panitia_ahli];
							$rec[sampul_incoming_bids] = $_POST[sampul_incoming_bids];
							$rec[sampul_full_bids] = $_POST[sampul_full_bids];
							
							$max = count($_POST[sampul_lak5]);
							for($i=0; $i<$max; $i++) {
								$rec[vendor_id] = $_POST[vendor_id][$i];
								$rec[sampul_lak5] = $_POST[sampul_lak5][$i];
								$rec[sampul_berlaku_penawaran] = $_POST[sampul_berlaku_penawaran][$i];
								$rec[sampul_penawaran_tdtgn] = $_POST[sampul_penawaran_tdtgn][$i];
								$rec[sampul_materai] = $_POST[sampul_materai][$i];
								$rec[sampul_cap] = $_POST[sampul_cap][$i];
								$rec[sampul_jangka_waktu] = $_POST[sampul_jangka_waktu][$i];
								$rec[sampul_tgl_nmr_surat] = $_POST[sampul_tgl_nmr_surat][$i];
								$rec[sampul_akte] = $_POST[sampul_akte][$i];
								$rec[sampul_konsorsium] = $_POST[sampul_konsorsium][$i];
								$rec[sampul_rek_koran] = $_POST[sampul_rek_koran][$i];
								$rec[sampul_ref_bank] = $_POST[sampul_ref_bank][$i];
								$rec[sampul_sp] = $_POST[sampul_sp][$i];
								$rec[sampul_dukungan] = $_POST[sampul_dukungan][$i];
								$rec[sampul_spek] = $_POST[sampul_spek][$i];
								$rec[sampul_material] = $_POST[sampul_material][$i];
								$rec[sampul_cv] = $_POST[sampul_cv][$i];
								$rec[sampul_keterangan] = $_POST[sampul_keterangan][$i];
								
								$conn->insert($table, $rec);
							}
							
							// Go to Step 2
							$url = "?mod=eproc&act=tender-approval&mode=app&step=3&tender_id=" . $_GET[tender_id] .
								   "&tender_type=4&go=2sampul2";
							header("Location: " . $url);
						}
						
						if(is_2sampul_1($_GET[tender_id])) {
							$url = "?mod=eproc&act=tender-approval&mode=app&step=3&tender_id=" . $_GET[tender_id] .
								   "&tender_type=4&go=2sampul2";
							header("Location: " . $url);
						}
						
						// Invited Vendors
						$q = "SELECT vendor_id FROM ep_tender_bids WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id";
						$res = $conn->query($q); $i = 0;
						while($mb = $conn->fetchArray($res)) {
							$vendors[$i][vendor_id] = $mb[vendor_id];
							$vendors[$i][vendor_name] = getVendorNameById($mb[vendor_id]);
							$vendors[$i][got_vendor] = 1;
							$i++;
						}
						$vendors[counter] = $i;
						
						$_template->assign("vendors", $vendors);
					}
					
					// 2 Sampul - Step 2
					if($_GET[go] == "2sampul2") {
						if(isset($_POST[submit2S2])) {
							$table = "ep_sampul_2s2";
							unset($rec);
							$rec[sampul_lulus] = $_POST[sampul_lulus];
							$rec[sampul_incoming_bids] = $_POST[sampul_incoming_bids];
							$rec[sampul_full_bids] = $_POST[sampul_full_bids];
							$rec[tender_id] = $_GET[tender_id];
							
							for($i=0; $i<count($_POST[sampul_penawaran_tertutup]); $i++) {
								$rec[sampul_penawaran_tertutup] = $_POST[sampul_penawaran_tertutup][$i];
								$rec[sampul_berlaku_penawaran] = $_POST[sampul_berlaku_penawaran][$i];
								$rec[sampul_penawaran_tdtgn] = $_POST[sampul_penawaran_tdtgn][$i];
								$rec[sampul_materai] = $_POST[sampul_materai][$i];
								$rec[sampul_cap] = $_POST[sampul_cap][$i];
								$rec[sampul_tgl_nmr_surat] = $_POST[sampul_tgl_nmr_surat][$i];
								$rec[sampul_total_harga] = $_POST[sampul_total_harga][$i];
								$rec[sampul_perincian] = $_POST[sampul_perincian][$i];
								$rec[sampul_penerbit] = $_POST[sampul_penerbit][$i];
								$rec[sampul_nilai] = $_POST[sampul_nilai][$i];
								$rec[sampul_keterangan] = $_POST[sampul_keterangan][$i];
								$rec[sampul_peringkat] = $_POST[sampul_peringkat][$i];
								$rec[vendor_id] = $_POST[vendor_id][$i];
								$conn->insert($table, $rec);
							}
							
							$url = "?mod=eproc&act=tender-approval&mode=app&step=3&tender_id=" . $_GET[tender_id] .
								   "&tender_type=4&go=2sampul-complete";
							//header("Location: ", $url);
							$_template->assign("next", 1);
							$_template->assign("url", $url);
						}
						
						if(is_2sampul_2($_GET[tender_id])) {
							$_template->assign("next", 1);
							$_template->assign("url", $url);
						}
						
						// Invited Vendors
						$q = "SELECT vendor_id FROM ep_tender_bids WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id";
						$res = $conn->query($q); $i = 0;
						while($mb = $conn->fetchArray($res)) {
							$vendors[$i][vendor_id] = $mb[vendor_id];
							$vendors[$i][vendor_name] = getVendorNameById($mb[vendor_id]);
							$vendors[$i][got_vendor] = 1;
							$i++;
						}
						$vendors[counter] = $i;
					
						$_template->assign("vendors", $vendors);
						
						// Info from Step 1
						$q = "SELECT sampul_hrtgl, sampul_waktu, sampul_tempat, sampul_tglcetak, sampul_collective_no, " .
							 "sampul_panitia_ketua, sampul_panitia_sekretaris, sampul_panitia_keuangan, sampul_panitia_hukum, " .
							 "sampul_panitia_user, sampul_panitia_proc FROM ep_sampul_2s1 WHERE tender_id = $_GET[tender_id] " .
							 "LIMIT 1";
						$resq = $conn->query($q);
						$smp = $conn->fetchArray($resq);
						
						// 2 Sampul 2 - Quotations
						for($k=0; $k<$vendors[counter]; $k++) {
							$vendid = $vendors[$k][vendor_id];
							$q = "SELECT quo_total_price, quo_currency FROM op_quotations WHERE tender_id = $_GET[tender_id] " .
								 "AND vendor_id = $vendid ORDER BY vendor_id";
							$rt = $conn->query($q); $i = 0;
							while($qq = $conn->fetchArray($rt)) {
								$total += $qq[quo_total_price];
								$quo[0][quo_currency] = $qq[quo_currency];
							}
							$quo[$k][quo_total_price] = $total;
							$total = 0;
						}
						$_template->assign("quo", $quo);
						
						$_template->assign("smp", $smp);
					}
					
					if($_GET[go] == "2sampul-complete") {
						$html2ps1 = "http://" . $_SERVER[SERVER_NAME] . HTML2PS_SETTINGS . $_SERVER[SERVER_NAME] . "/pdfgen/2sampul.php?tender_id=";
						$_template->assign("html2ps1", $html2ps1);
						
						$html2ps2 = "http://" . $_SERVER[SERVER_NAME] . HTML2PS_SETTINGS . $_SERVER[SERVER_NAME] . "/pdfgen/2sampul2.php?tender_id=";
						$_template->assign("html2ps2", $html2ps2);
						
						// Invited Vendors
						$q = "SELECT vendor_id FROM ep_tender_bids WHERE tender_id = $_GET[tender_id] ORDER BY vendor_id";
						$res = $conn->query($q); $i = 0;
						while($mb = $conn->fetchArray($res)) {
							$vendors[$i][vendor_id] = $mb[vendor_id];
							$vendors[$i][vendor_name] = getVendorNameById($mb[vendor_id]);
							$vendors[$i][got_vendor] = 1;
							$i++;
						}
						$vendors[counter] = $i;
					
						$_template->assign("vendors", $vendors);
						
						// 2 Sampul 2 - Quotations
						for($k=0; $k<$vendors[counter]; $k++) {
							$vendid = $vendors[$k][vendor_id];
							$q = "SELECT quo_total_price, quo_currency FROM op_quotations WHERE tender_id = $_GET[tender_id] " .
								 "AND vendor_id = $vendid ORDER BY vendor_id";
							$rt = $conn->query($q); $i = 0;
							while($qq = $conn->fetchArray($rt)) {
								$total += $qq[quo_total_price];
								$quo[0][quo_currency] = $qq[quo_currency];
							}
							$quo[$k][quo_total_price] = $total;
							$total = 0;
						}
						$_template->assign("quo", $quo);
						
						// Info from Step 1
						$q = "SELECT sampul_hrtgl, sampul_waktu, sampul_tempat, sampul_tglcetak, sampul_collective_no, " .
							 "sampul_panitia_ketua, sampul_panitia_sekretaris, sampul_panitia_keuangan, sampul_panitia_hukum, " .
							 "sampul_incoming_bids, sampul_full_bids, sampul_panitia_ahli, " .
							 "sampul_panitia_user, sampul_panitia_proc FROM ep_sampul_2s1 WHERE tender_id = $_GET[tender_id] " .
							 "LIMIT 1";
						$resq = $conn->query($q);
						$smp = $conn->fetchArray($resq);
						
						$_template->assign("smp", $smp);
						
						// 2 Sampul 1 - Fields
						$q = "SELECT * FROM ep_sampul_2s1 WHERE tender_id = $_GET[tender_id] ORDER BY sampul_id";
						$rqq = $conn->query($q); $i = 0;
						while($tt = $conn->fetchArray($rqq)) {
							foreach($tt as $key => $value) {
								$s1fields[$i][$key] = $value;
								if($key == "vendor_id") {
									$s1fields[$i][vendor_name] = getVendorNameById($value);
								}
							}
							$i++;
						}
						
						// 2 Sampul 2 - Fields
						$q = "SELECT * FROM ep_sampul_2s2 WHERE tender_id = $_GET[tender_id] ORDER BY sampul_id";
						$rqq = $conn->query($q); $i = 0;
						while($tt = $conn->fetchArray($rqq)) {
							foreach($tt as $key => $value) {
								$s2fields[$i][$key] = $value;
								if($key == "vendor_id") {
									$s2fields[$i][vendor_name] = getVendorNameById($value);
								}
								if($key == "sampul_total_harga") {
									$s2fields[$i][sampul_total_harga] = numberFormat($value);
								}
								if($key == "sampul_nilai") {
									$s2fields[$i][sampul_nilai] = numberFormat($value);
								}
							}
							$i++;
						}
						
						$_template->assign("s1fields", $s1fields);
						$_template->assign("s2fields", $s2fields);
					}
					
					// Penetapan
					if($_GET[go] == "penetapan") {
						if(isset($_POST[yo])) {
							$table = "ep_tender_requests";
							unset($rec);
							$rec[request_status] = "winner";
							$rec[vendor_id] = $_POST[vendor_id];
							$rec[won_date] = mktime();
							$where = "WHERE tender_id = $_POST[tender_id] LIMIT 1";
							$conn->update($table, $rec, $where);
							
							header("Location: ?mod=eproc&act=tender-list&ditetapkan=1");
						}
						
						if($_GET[tender_type] == 6) {
							$q = "SELECT a.vendor_id, b.req_est_price, b.req_currency FROM ep_tender_rfq AS a, " . 
								 "ep_tender_items AS b WHERE a.tender_id = b.tender_id AND " .
								 "a.tender_id = $_GET[tender_id] LIMIT 1";
							$res = $conn->query($q); $i = 0;
							while($vle = $conn->fetchObject($res)) {
								$pvlist[$i][vendor_id] = $vle->vendor_id;
								$pvlist[$i][vendor_name] = strtoupper(getVendorNameById($vle->vendor_id));
								$pvlist[$i][req_est_price] = numberFormat($vle->req_est_price);
								$pvlist[$i][req_currency] = strtoupper($vle->req_currency);
								$i++;
							}
						} else {
							if(is_1sampul($_GET[tender_id])) {
								$q = "SELECT a.vendor_id, b.sampul_harga_penawaran FROM ep_tender_rfq AS a, " . 
								 	 "ep_sampul_1s AS b WHERE a.tender_id = b.tender_id AND " .
									 "b.tender_id = $_GET[tender_id] AND a.vendor_id = b.vendor_id " .
									 "ORDER BY b.sampul_harga_penawaran ASC";
								$res = $conn->query($q); $i = 0;
								while($vle = $conn->fetchObject($res)) {
									$pvlist[$i][vendor_id] = $vle->vendor_id;
									$pvlist[$i][sampul_peringkat] = $i+1;
									$pvlist[$i][vendor_name] = strtoupper(getVendorNameById($vle->vendor_id));
									$pvlist[$i][req_est_price] = numberFormat($vle->sampul_harga_penawaran);
									$pvlist[$i][req_currency] = getQuoteCurrency($_GET[tender_id]);
									$i++;
								}
							}
							else if(is_2sampul($_GET[tender_id])) {
								$q = "SELECT a.vendor_id, b.sampul_total_harga, b.sampul_peringkat FROM ep_tender_rfq AS a, " . 
								 	 "ep_sampul_2s2 AS b WHERE a.tender_id = b.tender_id AND " .
									 "b.tender_id = $_GET[tender_id] AND b.vendor_id = a.vendor_id";
								$res = $conn->query($q); $i = 0;
								while($vle = $conn->fetchObject($res)) {
									$pvlist[$i][vendor_id] = $vle->vendor_id;
									$pvlist[$i][vendor_name] = strtoupper(getVendorNameById($vle->vendor_id));
									$pvlist[$i][req_est_price] = numberFormat($vle->sampul_total_harga);
									$pvlist[$i][sampul_peringkat] = $vle->sampul_peringkat;
									$pvlist[$i][req_currency] = getQuoteCurrency($_GET[tender_id]);
									$i++;
								}
							}
						}
						
						$_template->assign("pvlist", $pvlist);
					}
					
					// RFQ Details
					if(isset($_GET[vendor_id])) {
						/*$q = "SELECT * FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id] AND " .
							 "vendor_id = $_GET[vendor_id] LIMIT 1";*/
						$q = "SELECT * FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id] LIMIT 1";
						$res = $conn->query($q);
						while($rf = $conn->fetchArray($res)) {
							foreach($rf as $key => $value) {
								$rfqs[$key] = $value;
							}
						}
						$html2psR = "http://" . $_SERVER[SERVER_NAME] . HTML2PS_SETTINGS . 
									$_SERVER[SERVER_NAME] . "/pdfgen/division-req.php?tender_id=";
						$_template->assign("html2psR", $html2psR);
						$_template->assign("rfqs", $rfqs);
					}
					
					$url = "index.php?mod=eproc&act=tender-approval&mode=app&step=3&tender_id=" .
						   $_GET[tender_id] . "&tender_type=3";
					if($_GET[vendor_id] > 0) {
						$url .= "&vendor_id=" . $_GET[vendor_id];
					}
					$_template->assign("PHP_SELF", $url);
					
					$_template->assign("tender_type", $_GET[tender_type]);
					$_template->assign("tender_id", $_GET[tender_id]);
					$_template->assign("go", $_GET[go]);
					
					$_template->display("eproc-tender-rfq.tpl");
				}
				else {
					header("Location: index.php?mod=eproc&act=rfq-list");
				}
			}
			else if($_GET[mode] == 'del' && $_GET[tender_id] > 0) {
				if(isset($_POST[submitDel])) {
					$table = "ep_tender_requests";
					unset($rec);
					$rec[request_status] = 'deleted';
					$rec[deleted_user_id] = $_SESSION[user][id];
					$rec[deleted_date] = mktime();
					$rec[deleted_reason] = $_POST[deleted_reason];
					$where = "WHERE tender_id = $_GET[tender_id] LIMIT 1";
					$conn->update($table, $rec, $where);
					header('Location: ?mod=eproc&act=tender-list&del=1');
				}
				
				// Tender Details
				$q = "SELECT req_purpose FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
				$res = $conn->query($q);
				$t = $conn->fetchObject($res);
				$_template->assign("req_purpose", $t->req_purpose);
				
				$_template->display("eproc-del-tender.tpl");
			}
		} else {
			header('Location: ?mod=frontpage');
		}
	}
	else {
		header('Location: ?mod=frontpage');
	}
	
	$conn->close();
?>
