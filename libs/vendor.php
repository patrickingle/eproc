<?php
	$_template->assign("_userLevel", $_SESSION[user][level]);
	
	$conn = new DbConnector();
	
	unset($rec);
	if(!isset($_GET[act])) {
		$_GET[act] = "reg";
	}
	if($_GET[act] == "reg") {
		if(!isset($_GET[step]) || $_GET[step] == 1) {
			// Validate & Assign POST values if there are errors encountered
			if(isset($_POST[submitVendorStep1])) {
				/*$q = "SELECT user_name, vendor_name FROM users_info_vendor WHERE " .
					 "user_name = '$_POST[user_name]' OR vendor_name = '$_POST[vendor_name]' LIMIT 1";
				$res = $conn->query($q);
				
				// Error flag
				$_vendorStep1Error = false;
				
				// Actions if the query returned an already used username or vendor
				if($conn->counter($res) > 0) {
					$row = $conn->fetchObject($res);
					if($row->user_name == '') {
						$_template->assign("eVendor_name", 1);
					} else if($row->vendor_name == '') {
						$_template->assign("eUser_name", 1);
					} else {
						$_template->assign("eVendor_name", 1);
						$_template->assign("eUser_name", 1);
					}
					$_vendorStep1Error = true;
				}
				
				// Check if both the Password fields are identical
				if($_POST[user_password1] != $_POST[user_password2]) {
					$_template->assign("eUser_password", 1);
					$_vendorStep1Error = true;
				}*/
				
				// Check if nearest_branch value is not 0
				if($_POST[nearest_branch] == 0) {
					$_template->assign("eNearest_branch", 1);
					$_vendorStep1Error = true;
				}
				
				// Assign POST values to form fields
				$_template->assign("pUser_name", $_POST[user_name]);
				$_template->assign("pVendor_name", $_POST[vendor_name]);
				$_template->assign("pVendor_npwp", $_POST[vendor_npwp]);
				$_template->assign("pVendor_addr", $_POST[vendor_addr]);
				$_template->assign("pVendor_city", $_POST[vendor_city]);
				$_template->assign("pVendor_state", $_POST[vendor_state]);
				$_template->assign("pVendor_zip", $_POST[vendor_zip]);
				$_template->assign("pVendor_tlp", $_POST[vendor_tlp]);
				$_template->assign("pVendor_fax", $_POST[vendor_fax]);
				$_template->assign("pVendor_email", $_POST[vendor_email]);
				$_template->assign("pVendor_web", $_POST[vendor_web]);
				$_template->assign("pVendor_akte_pendirian", $_POST[vendor_akte_pendirian]);
				$_template->assign("pVendor_tgl_pendirian", $_POST[vendor_tgl_pendirian]);
				$_template->assign("pVendor_akte_perubahan", $_POST[vendor_akte_perubahan]);
				$_template->assign("pVendor_tgl_perubahan", $_POST[vendor_tgl_perubahan]);
				$_template->assign("pVendor_siup", $_POST[vendor_siup]);
				$_template->assign("pNearest_branch", $_POST[nearest_branch]);
				$_template->assign("pVendor_qualification", $_POST[vendor_qualification]);
				$_template->assign("pVendor_sub_bidang", $_POST[vendor_sub_bidang]);
				
				// Actions if there are no errors found
				if(!$_vendorStep1Error) {
					$table = "ep_users";
					$vnum = getLatestVendorNumber();
					$rec[user_name] = 4 . $vnum;
					$rec[user_password] = md5('vendor');
					$rec[user_level] = 4;
					$rec[lastlogin] = mktime();
					$conn->insert($table, $rec);
					
					unset($rec);
					
					$q = "SELECT user_id FROM ep_users WHERE user_name = '$rec[user_name]' LIMIT 1";
					$user = $conn->fetchObject($conn->query($q));
				
					$table = "ep_users_vendor";
					$rec[user_id] = $user->user_id;
					$rec[vendor_name] = $_POST[vendor_name];
					$rec[vendor_npwp] = $_POST[vendor_npwp];
					$rec[vendor_addr] = $_POST[vendor_addr];
					$rec[vendor_city] = $_POST[vendor_city];
					$rec[vendor_state] = $_POST[vendor_state];
					$rec[vendor_zip] = $_POST[vendor_zip];
					$rec[vendor_tlp] = $_POST[vendor_tlp];
					$rec[vendor_fax] = $_POST[vendor_fax];
					$rec[vendor_email] = $_POST[vendor_email];
					$rec[vendor_web] = $_POST[vendor_web];
					$rec[vendor_akte_pendirian] = $_POST[vendor_akte_pendirian];
					$rec[vendor_tgl_pendirian] = strtotime($_POST[vendor_tgl_pendirian]);
					$rec[vendor_akte_perubahan] = $_POST[vendor_akte_perubahan];
					$rec[vendor_tgl_perubahan] = strtotime($_POST[vendor_tgl_perubahan]);
					$rec[vendor_siup] = $_POST[vendor_siup];
					$rec[nearest_branch] = $_POST[nearest_branch];
					$rec[vendor_qualification] = $_POST[vendor_qualification];
					$rec[vendor_sub_bidang] = $_POST[vendor_sub_bidang];
					$rec[vendor_reg_date] = mktime();
					$rec[vendor_proc_number] = $vnum;
					
					$conn->insert($table, $rec);
					
					$url = "?mod=vendor&step=2&user_id=" . $user->user_id . "&session=" . session_id();
					header("Location: $url");
				}
			}
			
			// Display Nearest Branches
			$q = "SELECT * FROM ep_branches ORDER BY city";
			$res = $conn->query($q);
			$branch = "";
			while($row = $conn->fetchObject($res)) {
				$branch[$row->branch_id] = $row->ep_code . " - " . $row->description . " - " . $row->city;
			}
			$_template->assign("branch", $branch);
			
			// Show Template
			$_template->display("vendor-reg-step1.tpl");
		} 
		else if($_GET[step] == 2) {
			$_template->assign("user_id", $_GET[user_id]);
			$_template->assign("session_id", session_id());
			
			if(@is_vendor_id($_GET[user_id]) && $_GET[session] == session_id()) {
			//if(1) {
				if(isset($_POST[submitVendorStep2])) {
					// Vendor Supplemental - Rep Office
					$table = "ep_users_vendor";
					$where = "WHERE user_id = $_GET[user_id] LIMIT 1";
					$rec[vendor_rep_addr] = $_POST[vendor_rep_addr];
					$rec[vendor_rep_city] = $_POST[vendor_rep_city];
					$rec[vendor_rep_state] = $_POST[vendor_rep_city];
					$rec[vendor_rep_zip] = $_POST[vendor_rep_city];
					$conn->update($table, $rec, $where);
					
					unset($rec);
					
					// Vendor Responsible Person
					$table = "ep_users_vendor_resp_person";
					$rec[resp_name] = $_POST[resp_name];
					$rec[resp_position] = $_POST[resp_position];
					$rec[resp_ktp] = $_POST[resp_ktp];
					$rec[resp_addr] = $_POST[resp_addr];
					$rec[resp_city] = $_POST[resp_city];
					$rec[resp_state] = $_POST[resp_state];
					$rec[resp_zip] = $_POST[resp_zip];
					$rec[resp_tlp] = $_POST[resp_tlp];
					$rec[resp_hp] = $_POST[resp_hp];
					$rec[resp_email] = $_POST[resp_email];
					$rec[resp_birth_place] = $_POST[resp_birth_place];
					$rec[resp_birth_date] = strtotime($_POST[resp_birth_date]);
					$rec[user_id] = $_GET[user_id];
					$conn->insert($table, $rec);
					
					// Go to step 3
					$url = "?mod=vendor&step=3&user_id=" . $_GET[user_id] . "&session=" . session_id();
					header("Location: $url");
				}
				
				// Show template
				$_template->display("vendor-reg-step2.tpl");
			} else {
				header("Location: ?mod=vendor&step=1");
			}
		}
		else if($_GET[step] == 3) {
			$_template->assign("user_id", $_GET[user_id]);
			$_template->assign("session_id", session_id());
			
			if(@is_vendor_id($_GET[user_id]) && $_GET[session] == session_id()) {
			//if(1) {
				// Delete File
				if($_POST[act] == 'del' && $_POST[file_id] > 0) {
					echo $q = "DELETE FROM ep_users_vendor_req WHERE file_id = $_POST[file_id] LIMIT 1";
					$conn->query($q);
					//header();
				}
				
				// Process uploaded file
				if(isset($_POST[submitVendorStep3])) {
					if($_FILES[req_file][name] != '') {
						$ext = getFileExt($_FILES[req_file][name]);
						$seed_fn = rand(3342, 23423098) . rand(12, 123123) . "." . $ext;
						$target_fn = VENDOR_REQ_DIR . $seed_fn;
						if(@move_uploaded_file($_FILES[req_file][tmp_name], $target_fn)) {
							@chmod($target_fn, 0777);
							
							unset($rec);
							
							$table = "ep_users_vendor_req";
							$rec[description] = $_POST[description];
							$rec[file_name] = $seed_fn;
							$rec[user_id] = $_GET[user_id];
							$rec[file_upload_date] = mktime();
							$conn->insert($table, $rec);
						}
					}
				}
				
				// Show uploaded files
				$q = "SELECT file_id, description, file_name, file_upload_date FROM " .
					 "ep_users_vendor_req WHERE user_id = $_GET[user_id] ORDER BY file_upload_date";
				$res = $conn->query($q);
				if($conn->counter($res) > 0) {
					$_template->assign("uploadedFiles", 1); $files = ""; $i = 0;
					while($row = $conn->fetchObject($res)) {
						$files[$i][file_id] = $row->file_id;
						$files[$i][file_name] = $row->file_name;
						$files[$i][description] = $row->description;
						$files[$i][file_upload_date] = date("d M Y - H:i", $row->file_upload_date);
						$i++;
					}
					$_template->assign("files", $files);
				}
				
				$_template->display("vendor-reg-step3.tpl");
			}
			else {
				header("Location: ?mod=vendor&step=1");
			}
		}
		else if($_GET[step] == 4) {
			if(@is_vendor_id($_GET[user_id]) && $_GET[session] == session_id()) {
				$_template->assign("user_id", $_GET[user_id]);
				$_template->assign("session_id", session_id());
				
				$url = "?user_id=" . $_GET[user_id];
				$f = fopen('http://' . $_SERVER[HTTP_HOST] . '/pdfgen/vendor.php' . $url, 'r');
				$info = stream_get_contents($f);
				fclose($f);
				
				$_template->assign("info", $info);
				$_template->display("vendor-reg-step4.tpl");
			}
		}
	}
	else if($_GET[act] == "tender-list") {
		// Invited Tenders
		$vid = $_GET[vendor_id];
		
		if($_SESSION[user][level] == 1 || $_SESSION[user][leve] == 2 || $_SESSION[user][level] == 4) {
			$q = "SELECT a.tender_id FROM ep_tender_rfq AS a, ep_tender_requests AS b " .
				 "WHERE a.vendor_id = $vid AND b.request_status != 'deleted' " .
				 "AND a.tender_id = b.tender_id GROUP BY a.tender_id";
			$rq = $conn->query($q); $i = 0; $j = 0;
			while($the = $conn->fetchObject($rq)) {
				$q = "SELECT tender_id, created_date, req_type, req_purpose " .
					 "FROM ep_tender_requests WHERE tender_id = " . $the->tender_id .
					 " AND request_status != 'deleted' ORDER BY created_date DESC";
				$res = $conn->query($q);
				if($conn->counter($res) > 0) {
					while($tender = $conn->fetchArray($res)) {
						if(!is_quoted($tender[tender_id], $_GET[vendor_id])) {
							foreach($tender as $key => $value) {
								$holder[$i][$key] = $value;
							}
							$i++;
						}
						else if(is_quoted($tender[tender_id], $_GET[vendor_id])) {
							foreach($tender as $key => $value) {
								$quoted[$j][$key] = $value;
							}
							$j++;
						}
					}
				}
			}
			$_template->assign("vendor_name", strtoupper(getVendorNameById($_GET[vendor_id])));
			$_template->assign("tenders", $holder);
			$_template->assign("quoted", $quoted);
			$_template->assign("vid", $vid);
		}
		
		$_template->display("vendor-tender-list.tpl");
	}
	else if($_GET[act] == "win-list") {
		$vid = $_GET[vendor_id];
		$_template->assign("vid", $vid);
		
		// Won Tenders
		$q = "SELECT * FROM ep_tender_requests WHERE vendor_id = $vid ORDER BY created_date";
		$res = $conn->query($q); $i = 0;
		while($cc = $conn->fetchArray($res)) {
			foreach($cc as $key => $value) {
				$won[$i][$key] = $value;
			}
		}
		$_template->assign("won", $won);
		
		// Lost Tenders
		
		$_template->display("vendor-win-list.tpl");
	}
	else if($_GET[act] == "bid") {
		if(is_active_tender($_GET[tender_id])) {			
			$vid = $_GET[vendor_id];
			
			$html2ps = "http://" . $_SERVER['HTTP_HOST'] . "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=900&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&landscape=1&leftmargin=15&rightmargin=15&topmargin=15&bottommargin=15&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=eproc%2Fpdfgen%2Fvendor-quote.php%3Ftender_id%3D" . $_GET[tender_id] . "%26vendor_id%3D" . $_GET[vendor_id];
			$_template->assign("html2ps", $html2ps);
			
			if(isset($_POST[submitBid])) {
				unset($rec);
				$table = "ep_quotations";
				$rec[tender_id] = $_GET[tender_id];
				$rec[vendor_id] = $vid;
				$rec[quo_notes] = $_POST[quo_notes];
				$rec[quo_division] = $_POST[quo_division];
				$rec[quo_approval_person] = $_POST[quo_approval_person];
				$rec[quo_currency] = $_POST[quo_currency];
				$rec[quo_date] = mktime();
				
				for($i=0; $i<count($_POST[quo_unit_price]); $i++) {
					$rec[quo_unit_price] = $_POST[quo_unit_price][$i];
					$rec[quo_total_price] = $_POST[quo_total_price][$i];
					$conn->insert($table, $rec);
				}
				
				header('Location: ?mod=vendor&act=bid&tender_id=' . $_GET[tender_id] . '&vendor_id=' . $vid . '&successBid=1');
			}
			
			$_template->assign("_GET", $_GET);
			
			$jsValidate = '<script language="Javascript">';
			$jsValidate .= 'var frmvalidator  = new Validator("bidForm");
			frmvalidator.clearAllValidations();';
			
			// Check Database
			$q = "SELECT * FROM ep_quotations WHERE tender_id = $_GET[tender_id] AND vendor_id = $vid ORDER BY quo_id";
			$res = $conn->query($q); $i = 0;
			if($conn->counter($res) > 0) {
				$_template->assign("disabled", " disabled");
			}
			while($qu = $conn->fetchArray($res)) {
				foreach($qu as $key => $value) {
					$quo[$i][$key] = $value;
					if($key == 'quo_total_price') {
						$itemTotal += $value;
					}
					if($key == "quo_unit_price") {
						$jsValidate .= 'frmvalidator.addValidation("quo_unit_price[' . $i .
									   ']","req", "Mohon Masukkan Unit Price!");';
						$jsValidate .= 'frmvalidator.addValidation("quo_unit_price[' . $i .
									   ']","numeric", "Mohon Masukkan hanya Nilai Numerik!");';
					}
					else if($key == "quo_total_price") {
						$jsValidate .= 'frmvalidator.addValidation("quo_total_price[' . $i .
									   ']","req", "Mohon Masukkan Total Price!");';
						$jsValidate .= 'frmvalidator.addValidation("quo_total_price[' . $i .
									   ']","numeric", "Mohon Masukkan hanya Nilai Numerik!");';
					}
				}
				$i++;
			}
			$jsValidate .= '';
			$_template->assign("itemTotal", numberFormat($itemTotal));
			$_template->assign("itemPpn", numberFormat($itemTotal * 0.1));
			$_template->assign("itemGrand", numberFormat($itemTotal + $itemTotal * 0.1));
			$_template->assign("quo", $quo);
			
			$jsValidate .= 'frmvalidator.addValidation("quo_approval_person","req","Mohon Masukkan Approval Person!");';
			$jsValidate .= 'frmvalidator.setAddnlValidationFunction("validateSubmit");';
			
			// Vendor Details
			$q = "SELECT * FROM users_info_vendor WHERE user_id = " . $_GET[vendor_id] . " LIMIT 1";
			$vv = $conn->fetchArray($conn->query($q));
			foreach($vv as $key => $value) {
				$vendor[$key] = $value;
			}
			$_template->assign("vendor", $vendor);
			
			// RFQ Details
			$q = "SELECT * FROM ep_tender_rfq WHERE vendor_id = $vid AND tender_id = $_GET[tender_id] LIMIT 1";
			$rf = $conn->fetchArray($conn->query($q));
			foreach($rf as $key => $value) {
				$rfqs[$key] = $value;
			}
			$_template->assign("rfqs", $rfqs);
			
			// Tender Items
			$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id] ORDER BY item_id";
			$res = $conn->query($q); $i = 0;
			while($it = $conn->fetchArray($res)) {
				foreach($it as $key => $value) {
					$items[$i][$key] = $value;
				}
				$i++;
			}
			$_template->assign("items", $items);
			
			// Next Button
			$ttype = getTenderTypeByTenderId($_GET[tender_id]);
			switch($ttype) {
				case 3: $_template->assign("next", "index.php?mod=eproc&act=1sampul-list"); break;
				case 5: $_template->assign("next", "index.php?mod=eproc&act=1sampul-list"); break;
				case 8: $_template->assign("next", "index.php?mod=eproc&act=1sampul-list"); break;
				case 4: $_template->assign("next", "index.php?mod=eproc&act=2sampul-list"); break;
				default: $_template->assign("next", "index.php?mod=eproc&act=rfq-list"); break;
			}
			
			$_template->assign("jsValidate", $jsValidate);
			$_template->assign("vendor_name", strtoupper(getVendorNameById($_GET[vendor_id])));
			$_template->assign("tender_name", strtoupper(getTenderNameById($_GET[tender_id])));
			$_template->assign("successBid", $_GET[successBid]);
			$_template->display("vendor-bid.tpl");
		}
		else {
			header('Location: ?mod=frontpage');
		}
	}
	
	$conn->close();
?>