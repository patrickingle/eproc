<?php
	if($_SESSION[logged]) {
		header("Location: ?mod=landingpage");
	}
	else {
		$conn = new DbConnector();
		
		$q = "SELECT a.tender_id, a.req_purpose, b.pdf_desc, b.pdf_filename FROM ep_tender_requests AS a, ep_fp_items AS b " .
			 "WHERE a.tender_id = b.tender_id ORDER BY a.tender_id DESC LIMIT 10";
		$res = $conn->query($q); $i = 0;
		while($ff = $conn->fetchArray($res)) {
			foreach($ff as $key => $value) {
				$tenders[$i][$key] = $value;
			}
			$i++;
		}
		$_template->assign("tenders", $tenders);
		
		$conn->close();
	}
?>