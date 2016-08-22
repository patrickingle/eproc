<?php
	$conn = new DbConnector();
	
	$_template->assign("_uLevel", $_SESSION[user][level]);
	$html2ps = "http://" . $_SERVER[SERVER_NAME] . HTML2PS_SETTINGS . $_SERVER[SERVER_NAME] . "/pdfgen/division-req.php?tender_id=";
	$_template->assign("html2ps", $html2ps);
	
	// User Registration
	if($_GET[act] == "reg") {
		if($_GET[step] == 1) {
			// Error Flag
			$_divStep1Error = false;
			
			// Check if $_POST is not empty
			if(isset($_POST[submitDivReg])) {
				// Check username availability
				if(isset($_POST[user_name]) && is_username($_POST[user_name])) {
					$_divStep1Error = true;
					$_template->assign("eUser_name", 1);
				}
				
				// Check if both the Password fields are identical
				if(isset($_POST[user_password1]) && $_POST[user_password1] != $_POST[user_password2]) {
					$_template->assign("eUser_password", 1);
					$_divStep1Error = true;
				}
				
				// Assign POST values to Template
				$_template->assign("pUser_name", $_POST[user_name]);
				$_template->assign("pFName", $_POST[fName]);
				$_template->assign("pLName", $_POST[lName]);
				$_template->assign("pCabang", $_POST[cabang]);
				$_template->assign("pDivisi", $_POST[divisi]);
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
			
			// Actions if there are no errors found
			if(isset($_POST[submitDivReg]) && $_divStep1Error == false) {
				unset($rec);
				$table = "ep_users";
				$rec[user_name] = $_POST[user_name];
				$rec[user_password] = md5($_POST[user_password1]);
				$rec[user_level] = 3;
				$rec[lastlogin] = mktime();
				$conn->insert($table, $rec);
				
				$q = "SELECT user_id FROM ep_users WHERE user_name = '$_POST[user_name]' " .
					 "AND user_level = 3 LIMIT 1";
				$u = $conn->fetchObject($conn->query($q));
				$uid = $u->user_id;
				
				unset($rec);
				$table = "ep_users_division";
				$rec[user_id] = $uid;
				$rec[fName] = $_POST[fName];
				$rec[lName] = $_POST[lName];
				$rec[address] = $_POST[address];
				$rec[city] = $_POST[city];
				$rec[state] = $_POST[state];
				$rec[zip] = $_POST[zip];
				$rec[nik] = $_POST[nik];
				$rec[curr_position] = $_POST[curr_position];
				$rec[cabang] = $_POST[cabang];
				$rec[divisi] = $_POST[divisi];
				$rec[birth_place] = $_POST[birth_place];
				$rec[birth_date] = strtotime($_POST[birth_date]);
				$rec[div_tlp] = $_POST[div_tlp];
				$rec[div_fax] = $_POST[div_fax];
				$rec[div_email] = $_POST[div_email];
				$rec[div_hp] = $_POST[div_hp];
				$conn->insert($table, $rec);
				
				header("Location: ?mod=divuser&act=reg&step=2&uid=" . $uid);
			}
			
			$_template->display("division-reg.tpl");
		}
		else if($_GET[step] == 2) {
			$_template->display("division-reg-end.tpl");
		}
	}
	else if($_GET[act] == "newrequest") {
		if(isset($_POST[submitReqNew])) {
			$pdf_file = $_POST[req_type] . "-" . mktime() . $_POST[req_project] . ".pdf";
			$table = "ep_tender_requests";
			unset($rec);
			$rec[user_id] = $_SESSION[user][id];
			$rec[request_status] = "pending-approval";
			$rec[created_date] = mktime();
			$rec[deleted_date] = 0;
			$rec[deleted_user_id] = 0;
			$rec[req_type] = $_POST[req_type];
			if($_POST[req_type] == 'material') {
				$rec[req_mrsr_number] = "1" . getLatestMrNumber();
			}
			else if($_POST[req_type] == 'service') {
				$rec[req_mrsr_number] = "2" . getLatestSrNumber();
			}
			$rec[req_purpose] = $_POST[req_purpose];
			$rec[req_from] = $_POST[req_from];
			$rec[req_to] = $_POST[req_to];
			$rec[req_kode_pembebanan] = $_POST[req_kode_pembebanan];
			$rec[req_gl_no] = $_POST[req_gl_no];
			$rec[req_cost_center] = $_POST[req_cost_center];
			$rec[req_project] = $_POST[req_project];
			$rec[req_internal_order] = $_POST[req_internal_order];
			$rec[req_pgroup] = $_POST[req_pgroup];
			$rec[req_bayer] = $_POST[req_bayer];
			$rec[req_approval_by] = $_POST[req_approval_by];
			$rec[req_remarks] = $_POST[req_remarks];
			$rec[req_pdf_file] = $pdf_file;
			$conn->insert($table, $rec);
			
			$q = "SELECT tender_id FROM ep_tender_requests WHERE user_id = $rec[user_id] AND " .
				 "created_date = $rec[created_date] AND req_type = '$rec[req_type]' AND " .
				 "req_purpose = '$rec[req_purpose]' LIMIT 1";
			$r = @$conn->fetchObject($conn->query($q));
			
			unset($rec);
			$table = "ep_tender_items";
			$counter = count($_POST[req_desc]);
			$rec[tender_id] = $r->tender_id;
			for($i = 1; $i < $counter+1; $i++) {
				$rec[req_desc] = $_POST[req_desc][$i];
				$rec[req_qty] = $_POST[req_qty][$i];
				$rec[req_uom] = $_POST[req_uom][$i];
				$idx = $i;
				$dateIdx = "req_date" . $idx;
				$rec[req_date] = strtotime($_POST[$dateIdx]);
				$rec[req_material_group] = $_POST[req_material_group][$i];
				$rec[req_est_price] = $_POST[req_est_price][$i];
				$rec[req_currency] = $_POST[req_currency][$i];
				$conn->insert($table, $rec);
			}
			
			$url = "?tender_id=" . $r->tender_id;
			//printPre($_POST);
			header('Location: ?mod=divuser&act=view&tender_id=' . $r->tender_id);
		}
		
		$_template->display("divuser-newrequest.tpl");
	}
	else if($_GET[act] == 'view' && $_GET[tender_id] > 0) {
		$q = "SELECT * FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
		$r = $conn->fetchArray($conn->query($q));
		foreach($r as $key => $value) {
			if($key == 'req_type') { $value = strtoupper($value); }
			if($key == 'user_id') { $value = getFullNameByIdDiv($value); }
			$_template->assign("$key", $value);
		}
		
		$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id] ORDER BY item_id";
		$t = $conn->query($q); $i = 0;
		while($s = $conn->fetchArray($t)) {
			foreach($s as $key => $value) {
				if($key == 'req_date') { $holder[$key][$i] = date("d M y", $value); }
				else if($key == 'req_currency') { $holder[$key][$i] = strtoupper($value); }
				else if($key == 'req_est_price') {
					$holder[$key][$i] = numberFormat($value);
				}
				else { $holder[$key][$i] = $value; }
			}
			$i++;
		}
		//printPre($holder);
		$_template->assign("tenderItem", $holder);
		$_template->assign("tender_id", $_GET[tender_id]);
		
		$_template->display("divuser-secondreq.tpl");
	}
	else if($_GET[act] == 'allrequest') {
		$q = "SELECT tender_id, user_id, request_status, created_date, req_type, req_purpose, vendor_id " .
			 "FROM ep_tender_requests WHERE user_id = " . $_SESSION[user][id] . " " .
			 "AND request_status != 'deleted' ORDER BY tender_id DESC";
		$res = $conn->query($q); $i = 0;
		if($conn->counter($res) > 0) {
			while($req = $conn->fetchObject($res)) {
				$tenders[$i][tender_id] = $req->tender_id;
				$tenders[$i][user_id] = $req->user_id;
				$tenders[$i][request_status] = $req->request_status;
				$tenders[$i][created_date] = $req->created_date;
				$tenders[$i][req_type] = $req->req_type;
				$tenders[$i][req_purpose] = $req->req_purpose;
				$tenders[$i][vendor_name] = getVendorNameById($req->vendor_id);
				$i++;
			}
			$_template->assign("no-records", 0);
			$_template->assign("tenders", $tenders);
		} else {
			$_template->assign("no-records", 1);
		}
		
		// Rejected
		$q = "SELECT tender_id, user_id, request_status, created_date, req_type, req_purpose, deleted_reason " .
			 "FROM ep_tender_requests WHERE user_id = " . $_SESSION[user][id] . " " .
			 "AND request_status = 'deleted' ORDER BY tender_id DESC";
		$res = $conn->query($q); $i = 0;
		if($conn->counter($res) > 0) {
			while($req = $conn->fetchObject($res)) {
				$rej[$i][tender_id] = $req->tender_id;
				$rej[$i][user_id] = $req->user_id;
				$rej[$i][request_status] = $req->request_status;
				$rej[$i][created_date] = $req->created_date;
				$rej[$i][req_type] = $req->req_type;
				$rej[$i][req_purpose] = $req->req_purpose;
				$rej[$i][deleted_reason] = $req->deleted_reason;
				$i++;
			}
			$_template->assign("no-records2", 0);
			$_template->assign("rej", $rej);
		} else {
			$_template->assign("no-records2", 1);
		}
		
		$_template->display("divuser-allreq.tpl");
	}
	
	$conn->close();
?>