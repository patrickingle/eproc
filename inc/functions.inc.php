<?php
	function getAppTitle() {
		$conn = new DbConnector();
		$q = "SELECT settings_value FROM ep_app_settings WHERE settings_name = 'appTitle' LIMIT 1";
		$res = $conn->query($q);
		$title = $conn->fetchObject($res);
		$conn->close();
		return $title->settings_value;
	}
	
	function kekata($x) {
		$x = abs($x);
		$angka = array("", "satu", "dua", "tiga", "empat", "lima",
		"enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
		$temp = "";
		if ($x <12) {
			$temp = " ". $angka[$x];
		} else if ($x <20) {
			$temp = kekata($x - 10). " belas";
		} else if ($x <100) {
			$temp = kekata($x/10)." puluh". kekata($x % 10);
		} else if ($x <200) {
			$temp = " seratus" . kekata($x - 100);
		} else if ($x <1000) {
			$temp = kekata($x/100) . " ratus" . kekata($x % 100);
		} else if ($x <2000) {
			$temp = " seribu" . kekata($x - 1000);
		} else if ($x <1000000) {
			$temp = kekata($x/1000) . " ribu" . kekata($x % 1000);
		} else if ($x <1000000000) {
			$temp = kekata($x/1000000) . " juta" . kekata($x % 1000000);
		} else if ($x <1000000000000) {
			$temp = kekata($x/1000000000) . " milyar" . kekata(fmod($x,1000000000));
		} else if ($x <1000000000000000) {
			$temp = kekata($x/1000000000000) . " trilyun" . kekata(fmod($x,1000000000000));
		}      
			return $temp;
	}
	
	function terbilang($x, $style=4) {
		if($x<0) {
			$hasil = "minus ". trim(kekata($x));
		} else {
			$hasil = trim(kekata($x));
		}      
		switch ($style) {
			case 1:
				$hasil = strtoupper($hasil);
				break;
			case 2:
				$hasil = strtolower($hasil);
				break;
			case 3:
				$hasil = ucwords($hasil);
				break;
			default:
				$hasil = ucfirst($hasil);
				break;
		}      
		return $hasil;
	}
	
	function is_eproc_admin($id) {
		$conn = new DbConnector();
		$q = "SELECT user_level FROM ep_users WHERE user_id = $id LIMIT 1";
		$rr = $conn->fetchArray($conn->query($q));
		$conn->close();
		if($rr->user_level == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	function getTenderWinnerByTenderId($id) {
		$conn = new DbConnector();
		$q = "SELECT vendor_id FROM ep_tender_requests WHERE tender_id = $id LIMIT 1";
		$rr = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $rr->vendor_id;
	}
	
	function getMonthName($mth) {
		switch($mth) {
			case 1: return "January"; break;
			case 2: return "February"; break;
			case 3: return "March"; break;
			case 4: return "April"; break;
			case 5: return "May"; break;
			case 6: return "June"; break;
			case 7: return "July"; break;
			case 8: return "August"; break;
			case 9: return "September"; break;
			case 10: return "October"; break;
			case 11: return "November"; break;
			case 12: return "December"; break;
		}
	}
	
	function getTenderNameById($id) {
		$conn = new DbConnector();
		$q = "SELECT req_purpose FROM ep_tender_requests WHERE tender_id = $id LIMIT 1";
		$rq = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $rq->req_purpose;
	}
	
	function getUserLevelById($id) {
		$conn = new DbConnector();
		$q = "SELECT user_level FROM ep_users WHERE user_id = $id LIMIT 1";
		$rq = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $rq->user_level;
	}
		
	function is_po($tid, $vid) {
		$conn = new DbConnector();
		$q = "SELECT po_id FROM ep_tender_po WHERE vendor_id = $vid AND tender_id = $tid LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) == 1) {
			$conn->close(); return true;
		} else {
			$conn->close(); return false;
		}
	}
	
	function is_po2($tid) {
		$conn = new DbConnector();
		$q = "SELECT po_id FROM ep_tender_po WHERE tender_id = $tid";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$conn->close(); return true;
		} else {
			$conn->close(); return false;
		}
	}
	
	function is_doc2($tid) {
		$conn = new DbConnector();
		$q = "SELECT ri_id FROM ep_ringkasan1 WHERE tender_id = $tid LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$conn->close(); return true;
		} else {
			$conn->close(); return false;
		}
	}
	
	function is_doc($tid, $vid) {
		$conn = new DbConnector();
		$q = "SELECT ri_id FROM ep_ringkasan1 WHERE vendor_id = $vid AND tender_id = $tid LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) == 1) {
			$conn->close(); return true;
		} else {
			$conn->close(); return false;
		}
	}
	
	function getSmtpServer() {
		$conn = new DbConnector();
		$q = "SELECT settings_value FROM ep_app_settings WHERE settings_name = 'smtp_server' LIMIT 1";
		$res = $conn->query($q);
		$title = $conn->fetchObject($res);
		$conn->close();
		return $title->settings_value;
	}
	
	function getSmtpPort() {
		$conn = new DbConnector();
		$q = "SELECT settings_value FROM ep_app_settings WHERE settings_name = 'smtp_port' LIMIT 1";
		$res = $conn->query($q);
		$title = $conn->fetchObject($res);
		$conn->close();
		return $title->settings_value;
	}
	
	function getKursDollar($year='2008') {
		$conn = new DbConnector();
		$q = "SELECT settings_value FROM ep_app_settings WHERE settings_name = 'kurs_dollar' AND settings_desc = '$year' LIMIT 1";
		$res = $conn->query($q);
		$title = $conn->fetchObject($res);
		$conn->close();
		return $title->settings_value;
	}
	
	function getBidItemTotalValue($bid, $tid) {
		$conn = new DbConnector();
		$q = "SELECT req_est_price, req_currency, req_qty FROM ep_tender_items WHERE " .
			 "tender_id = $tid AND item_id = $bid LIMIT 1";
		$item = $conn->fetchObject($conn->query($q));
		$value = numberFormat($item->req_est_price * $item->req_qty);
		$value = strtoupper($item->req_currency) . " " . $value;
		$conn->close();
		return $value;
	}
	
	function getBidItemUnitValue($bid, $tid) {
		$conn = new DbConnector();
		$q = "SELECT req_est_price, req_currency FROM ep_tender_items WHERE " .
			 "tender_id = $tid AND item_id = $bid LIMIT 1";
		$item = $conn->fetchObject($conn->query($q));
		$value = numberFormat($item->req_est_price);
		$value = strtoupper($item->req_currency) . " " . $value;
		$conn->close();
		return $value;
	}
	
	function checkTenderBidsByTender($id) {
		$conn = new DbConnector();
		$q = "SELECT bid_id FROM ep_tender_bids WHERE tender_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) == 1) {
			$conn->close();
			return false;
		} else {
			$conn->close();
			return true;
		}
	}

	function getTenderStatus($id) {
		if(is_rfqed($id)) {
			if(is_quoted2($id)) {
				if(getTenderTypeByTenderId($id) != 6) {
					if(getTenderTypeByTenderId($id) == 3 || getTenderTypeByTenderId($id) == 5 || getTenderTypeByTenderId($id) == 8) {
						if(is_1sampul($id)) {
							if(is_won($id)) {
								if(is_doc2($id)) {
									if(is_po2($id)) {
										return "PO Issued";
									}
									else {
										return "PO Empty";
									}
								}
								else {
									return "Dokumentasi Empty";
								}
							}
							else {
								return "No Winner";
							}
						}
						else {
							return "1 Sampul Empty";
						}
					}
					else if(getTenderTypeByTenderId($id) == 4) {
						if(is_2sampul_1($id)) {
							if(is_2sampul_2($id)) {
								if(is_won($id)) {
									if(is_doc2($id)) {
										if(is_po2($id)) {
											return "PO Issued";
										}
										else {
											return "PO Empty";
										}
									}
									else {
										return "Dokumentasi Empty";
									}
								}
								else {
									return "No Winner";
								}
							}
							else {
								return "2 Sampul 2 Empty";
							}
						}
						else {
							return "2 Sampul 1 Empty";
						}
					}
				}
				else {
					return "SP3 Issued";
				}
			}
			else {
				return "Quotation Empty";
			}
		}
		else {
			return "RFQ Empty";
		}
	}
	
	function getTotalVendorComing($tid) {
		$conn = new DbConnector();
		$q = "SELECT bid_id FROM ep_tender_bids WHERE tender_id = $tid";
		$res = $conn->query($q);
		return $conn->counter($res);
	}
	
	function is_quoted3($tid) {
		$conn = new DbConnector();
		$q = "SELECT quo_id FROM ep_quotations WHERE tender_id = $tid GROUP BY tender_id";
		$res = $conn->query($q);
		if($conn->counter($res) == getTotalVendorComing($tid)) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function is_quoted2($tid) {
		$conn = new DbConnector();
		$q = "SELECT quo_id FROM ep_quotations WHERE tender_id = $tid GROUP BY tender_id";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function is_quoted($tid, $uid) {
		$conn = new DbConnector();
		$q = "SELECT quo_id FROM ep_quotations WHERE tender_id = $tid AND vendor_id = $uid LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) == 1) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getQuoteCurrency($tid) {
		$conn = new DbConnector();
		$q = "SELECT quo_currency FROM ep_quotations WHERE tender_id = $tid LIMIT 1";
		$rt = $conn->fetchObject($conn->query($q)); $conn->close();
		return strtoupper($rt->quo_currency);
	}
	
	function getLatestMrNumber() {
		$conn = new DbConnector();
		$q = "SELECT mr FROM ep_numberings WHERE n_id = 1 LIMIT 1";
		$rt = $conn->fetchObject($conn->query($q));
		unset($rec);
		$table = "ep_numberings";
		$rec[mr] = $rt->mr + 1;
		$where = "WHERE n_id = 1 LIMIT 1";
		$conn->update($table, $rec, $where);
		$conn->close();
		return $rt->mr;
	}
	
	function getLatestVendorNumber() {
		$conn = new DbConnector();
		$q = "SELECT mr FROM ep_numberings WHERE n_id = 1 LIMIT 1";
		$rt = $conn->fetchObject($conn->query($q));
		unset($rec);
		$table = "ep_numberings";
		$rec[mr] = $rt->mr + 1;
		$where = "WHERE n_id = 1 LIMIT 1";
		$conn->update($table, $rec, $where);
		$conn->close();
		return $rt->mr;
	}
	
	function getLatestSrNumber() {
		$conn = new DbConnector();
		$q = "SELECT sr FROM ep_numberings WHERE n_id = 1 LIMIT 1";
		$rt = $conn->fetchObject($conn->query($q));
		unset($rec);
		$table = "ep_numberings";
		$rec[sr] = $rt->sr + 1;
		$where = "WHERE n_id = 1 LIMIT 1";
		$conn->update($table, $rec, $where);
		$conn->close();
		return $rt->sr;
	}
	
	function getLatestPoNumber() {
		$conn = new DbConnector();
		$q = "SELECT po FROM ep_numberings WHERE n_id = 1 LIMIT 1";
		$rt = $conn->fetchObject($conn->query($q));
		unset($rec);
		$table = "ep_numberings";
		$rec[po] = $rt->po + 1;
		$where = "WHERE n_id = 1 LIMIT 1";
		$conn->update($table, $rec, $where);
		$conn->close();
		return $rt->po;
	}
	
	function is_won($id) {
		$conn = new DbConnector();
		$q = "SELECT request_status FROM ep_tender_requests WHERE " .
			 "request_status = 'winner' AND vendor_id > 0 AND tender_id = $id LIMIT 1";
		$cc = $conn->query($q);
		if($conn->counter($cc) == 1) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function is_username($uname) {
		$conn = new DbConnector();
		$q = "SELECT user_id FROM ep_users WHERE user_name = '$uname' LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getCurrentTheme() {
		$conn = new DbConnector();
		$q = "SELECT settings_value FROM ep_app_settings WHERE settings_name = 'currTheme' LIMIT 1";
		$res = $conn->query($q);
		$title = $conn->fetchObject($res);
		$conn->close();
		return $title->settings_value;
	}
	
	function is_logged() {
		if($_SESSION[logged] && $_SESSION[username] != NULL) {
			return true;
		} else {
			return false;
		}
	}
	
	function is_vendor_id($id) {
		$conn = new DbConnector();
		$q = "SELECT vendor_name FROM ep_users_vendor WHERE user_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getVendorNameById($id) {
		$conn = new DbConnector();
		$q = "SELECT vendor_name FROM ep_users_vendor WHERE user_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$row = $conn->fetchObject($res);
			return $row->vendor_name;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getFileExt($filename) {
		$filename = strtolower($filename) ;
		$exts = split("[/\\.]", $filename) ;
		$n = count($exts)-1;
		$exts = $exts[$n];
		return $exts;
	}
	
	function getUsernameById($id) {
		$conn = new DbConnector();
		$q = "SELECT user_name FROM ep_users WHERE user_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$row = $conn->fetchObject($res);
			return $row->user_name;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getFullNameByIdDiv($id) {
		$conn = new DbConnector();
		$q = "SELECT fName, lName FROM users_info_division WHERE user_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$row = $conn->fetchObject($res);
			return $row->fName . " " . $row->lName;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function numberFormat($num) {
		return number_format($num, 2, ",", ".");
	}
	
	function is_valid_tender($tid) {
		$conn = new DbConnector();
		$q = "SELECT tender_id FROM ep_tender_requests WHERE tender_id = $tid LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) == 1) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getTenderTypeById($id) {
		$conn = new DbConnector();
		$q = "SELECT type_desc FROM ep_tender_type WHERE type_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$row = $conn->fetchObject($res);
			return $row->type_desc;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getTenderTypeByTenderId($id) {
		$conn = new DbConnector();
		$q = "SELECT tender_type FROM ep_tender_requests WHERE tender_id = $id LIMIT 1";
		$rq = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $rq->tender_type;
	}
		
	function getNpwpById($id) {
		$conn = new DbConnector();
		$q = "SELECT vendor_npwp FROM users_info_vendor WHERE user_id = $id LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) > 0) {
			$row = $conn->fetchObject($res);
			return $row->vendor_npwp;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function is_active_tender($tid) {
		$conn = new DbConnector();
		$q = "SELECT tender_id FROM ep_tender_requests WHERE tender_id = $tid " .
			 "AND request_status != 'deleted' LIMIT 1";
		$res = $conn->query($q);
		if($conn->counter($res) == 1) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getNumberOfBidByTender($tid) {
		$conn = new DbConnector();
		$q = "SELECT vendor_id, MAX(bid_date) AS MAXDATE FROM ep_tender_bids WHERE " .
			 "tender_id = $tid GROUP BY vendor_id ORDER BY MAXDATE DESC";
		$res = $conn->query($q);
		$counter = $conn->counter($res);
		$conn->close();
		return $counter;
	}
	
	function getTenderTypeParentById($id) {
		$conn = new DbConnector();
		$q = "SELECT type_parent FROM ep_tender_type WHERE type_id = $id LIMIT 1";
		$r = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $r->type_parent;
	}
	
	function get1SampulHargaPenawaran($tid, $vid) {
		$conn = new DbConnector();
		$q = "SELECT sampul_harga_penawaran FROM ep_sampul_1s WHERE tender_id = $tid AND vendor_id = $vid LIMIT 1";
		$r = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $r->sampul_harga_penawaran;
	}
	
	function get2SampulHargaPenawaran($tid, $vid) {
		$conn = new DbConnector();
		$q = "SELECT sampul_total_harga FROM ep_sampul_2s2 WHERE tender_id = $tid AND vendor_id = $vid LIMIT 1";
		$r = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $r->sampul_harga_penawaran;
	}
	
	function is_rfqed($id) {
		$conn = new DbConnector();
		$q = "SELECT rfq_id FROM ep_tender_rfq WHERE tender_id = $id LIMIT 1";
		$r = @$conn->fetchObject($conn->query($q));
		$conn->close();
		if($r->rfq_id > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	function is_rfqed2($id) {
		$conn = new DbConnector();
		$q = "SELECT rfq_id FROM ep_tender_rfq WHERE tender_id = $id";
		$r = $conn->query($q);
		
		if($conn->counter($r) == 0) {
			$conn->close();
			return false;
		} else if($conn->counter($r) == getTotalVendorComing($id)) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function getTenderTypeParent($id) {
		$conn = new DbConnector();
		$q = "SELECT type_parent FROM ep_tender_type WHERE type_id = $id LIMIT 1";
		$co = $conn->fetchObject($conn->query($q));
		$conn->close();
		return $co->type_parent;
	}
	
	function is_1sampul($id) {
		$conn = new DbConnector();
		$q = "SELECT sampul_id FROM ep_sampul_1s WHERE tender_id = $id LIMIT 1";
		$the = $conn->fetchObject($conn->query($q));
		$conn->close();
		if($the->sampul_id > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	function printPre($p) {
		echo "<pre>";
		print_r($p);
		echo "</pre>";
	}
	
	function is_2sampul_1($id) {
		$conn = new DbConnector();
		$q = "SELECT sampul_id FROM ep_sampul_2s1 WHERE tender_id = $id LIMIT 1";
		$the = $conn->fetchObject($conn->query($q));
		$conn->close();
		if($the->sampul_id > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	function is_2sampul_2($id) {
		$conn = new DbConnector();
		$q = "SELECT sampul_id FROM ep_sampul_2s2 WHERE tender_id = $id LIMIT 1";
		$the = $conn->fetchObject($conn->query($q));
		$conn->close();
		if($the->sampul_id > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	function is_2sampul($id) {
		if(is_2sampul_1($id)) {
			if(is_2sampul_2($id)) {
				return true;
			}
		}
		return false;
	}
	
	function is_sp3($id) {
		$conn = new DbConnector();
		$q = "SELECT req_purpose FROM ep_tender_requests WHERE tender_type = 6 AND tender_id = $id LIMIT 1";
		$rs = $conn->query($q);
		if($conn->counter($rs) == 1) {
			$conn->close();
			return true;
		} else {
			$conn->close();
			return false;
		}
	}
	
	function openPage($filename) {
		$_data = @file($filename);
		$_data = implode("", $_data);
		$_data = str_replace("\n", "", $_data); 
		$arr_code = explode("x", $_data); 
		for($i = 0; $i < count($arr_code); $i++) {
			$_a = "";
			$_x = $arr_code[$i];
			for ($j = 7; $j >= 0 ; $j--) {
				$_a += ${_x}[$j] * pow(2, $j);
			}
			$_b = chr($_a);
			if ($_b == " ") {
				$_d .= chr($_c);
				$_c = "";
			} else {
				$_c .= $_a;
			}
		}
		return $_d;
	}
?>