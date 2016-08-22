<?php
	
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	$conn = new DbConnector();
	
	$q = "SELECT * FROM ep_tender_requests WHERE tender_id = $_GET[tender_id] LIMIT 1";
	$r = $conn->fetchArray($conn->query($q));
	foreach($r as $key => $value) {
		if($key == 'req_type') { $value = strtoupper($value); }
		if($key == 'user_id') { $value = getFullNameByIdDiv($value); }
		$tender[$key] = $value;
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
	
	$conn->close();
?><img src="/themes/default/images/pertagas-logo.jpg" alt="Pertagas" width="174" height="50" /><table border="1" cellspacing="1" cellpadding="1"><tr><th width="50%" valign="top"></th><th width="50%" valign="top"></th></tr><tr><td colspan="2" valign="top"><table border="1" cellspacing="1" cellpadding="1"><tr><td colspan="4" valign="top"><?= strtoupper($tender[req_type]); ?> REQUISITION</td><td width="9%" valign="top">Purposes:</td><td width="47%" valign="top"><?= $tender[req_purpose] ?></td></tr><tr><td width="4%" valign="top">From</td><td width="19%" valign="top"><?= $tender[req_from] ?></td><td width="3%" valign="top">To</td><td width="18%" valign="top"><?= $tender[req_to] ?></td><td colspan="2" valign="top"><table border="1" cellspacing="1" cellpadding="1"><tr><td width="19%">Kode Pembebanan</td><td width="23%">G/L No.</td><td width="21%">Cost Center</td><td width="20%">Project</td><td width="17%">Internal Order</td></tr><tr><td><?= $tender[req_kode_pembebanan] ?></td><td><?= $tender[req_gl_no] ?></td><td rowspan="3" valign="top"><?= $tender[req_cost_center] ?></td><td rowspan="3" valign="top"><?= $tender[req_project] ?></td><td rowspan="3" valign="top"><?= $tender[req_internal_order] ?></td></tr><tr><td>P Group</td><td>Bayer</td></tr><tr><td><?= $tender[req_pgroup] ?></td><td><?= $tender[req_bayer] ?></td></tr></table></td></tr><tr><td colspan="6" valign="top"><table border="1" cellspacing="1" cellpadding="1"><table id="reqFldTbl" border="1" cellpadding="0" cellspacing="0"><tr><td width="3%"><div align="center">No</div></td><td width="26%"><div align="center">Description</div></td><td width="9%"><div align="center">Quantity</div></td><td width="6%"><div align="center">UoM</div></td><td width="11%"><div align="center">Required Date</div></td><td width="13%"><div align="center">Material Group</div></td><td width="23%"><div align="center">Estimated Price/Unit</div></td><td width="4%"><div align="center">Currency</div></td><td width="5%"></td></tr><?php $counter = count($holder[req_desc]);for($i = 0; $i < $counter; $i++) { ?><tr><td valign="top"><?= $i+1 ?></td><td valign="top" align="center"><?= $holder[req_desc][$i] ?></td><td valign="top" align="center"><?= $holder[req_qty][$i] ?></td><td valign="top" align="center"><?= $holder[req_uom][$i] ?></td><td valign="top" align="center"><?= $holder[req_date][$i] ?></td><td valign="top" align="center"><?= $holder[req_material_group][$i] ?></td><td valign="top" align="center"><?= $holder[req_est_price][$i] ?></td><td valign="top"><?= $holder[req_currency][$i] ?></td><td valign="top">&nbsp;</td></tr><?php } ?></table></table></td></tr><tr><td colspan="4" valign="top"><table border="1" cellspacing="1" cellpadding="1"><tr><td width="6%" valign="top">&nbsp;</td><td width="94%" valign="top">&nbsp;</td></tr><tr><td width="6%" valign="top">Remarks</td><td width="94%" valign="top"><?= $tender[req_remarks] ?></td></tr></table></td></tr><tr><td colspan="4" valign="top">&nbsp;</td><td valign="top">&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan="4" valign="top">&nbsp;</td><td valign="top">&nbsp;</td><td>&nbsp;</td></tr></table></td></tr></table><table border="1" cellspacing="1" cellpadding="1"><tr><td valign="top" width="50%"><center>Requested By</center></td><td valign="top" width="50%"><center>Approved By</center></td></tr><tr><td valign="top" width="50%">&nbsp;</td><td valign="top" width="50%">&nbsp;</td></tr><tr><td valign="top" width="50%">&nbsp;</td><td valign="top" width="50%">&nbsp;</td></tr><tr><td valign="top" width="50%">&nbsp;</td><td valign="top" width="50%">&nbsp;</td></tr><tr><td valign="top" width="50%">&nbsp;</td><td valign="top" width="50%">&nbsp;</td></tr><tr><td valign="top" width="50%"><center><?= $tender[user_id] ?></center></td><td valign="top" width="50%"><center><?= $tender[req_approval_by] ?></center></td></tr></table>