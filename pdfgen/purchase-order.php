<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Purchase Order 1</title>
<link href="/themes/default/style.css" rel="stylesheet" type="text/css">
<link href="/themes/default/pdf.css" rel="stylesheet" type="text/css">
</head>
<?php
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	$conn = new DbConnector();
	
	$q = "SELECT * FROM op_purchase_order WHERE tender_id = $_GET[tender_id] LIMIT 1";
	$po = $conn->fetchArray($conn->query($q));
	
	$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id]";
	$res = $conn->query($q); $i = 0;
	while($the = $conn->fetchArray($res)) {
		foreach($the as $key => $value) {
			$items[$i][$key] = $value;
		}
		$i++;
	}
	
	$q = "SELECT * FROM ep_tender_po WHERE tender_id = $_GET[tender_id] AND vendor_id = $_GET[vendor_id] LIMIT 1";
	$apo = $conn->fetchArray($conn->query($q));
	$q = "SELECT * FROM ep_tender_po_items WHERE tender_id = $_GET[tender_id] " .
		 "AND vendor_id = $_GET[vendor_id] ORDER BY vendor_id";
	$res = $conn->query($q); $i = 0;
	while($a = $conn->fetchArray($res)) {
		foreach($a as $key => $value) {
			$api[$i][$key] = $value;
		}
		$i++;
	}
	
	$conn->close();
?>
<body style="background: none;">
  <table border="0" cellpadding="0" cellspacing="0" width="100%" class="rfqTable fBorder" style="font-size: 9px;">
	  <tr>
		  <td class="bottomBorder" colspan="2" valign="top"><img src="/themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" /></td>
		<td width="232" class="bottomBorder" valign="top"><strong>PT. PERTAMINA (PERSERO)<br />
		</strong>PERTAGAS, GD Oil Center Lt. 2 &amp; 3 Jl MH Thamrin No. 55<br />
		  Jakarta - 10350</td>
		<td width="261" class="bottomBorder" valign="bottom">Purch Organization: PT. PERTAMINA GAS</td>
		<td width="154" class="bottomBorder rightBorder" valign="bottom">Delivery Time: <?= $po[rfq_terms_of_delivery] ?></td>
	  </tr>
	  <tr>
		  <td width="198" rowspan="2" valign="top" class="bottomBorder rightBorder"><strong>Purchase Order<br />
		  PO <?= strtoupper($apo[po_type]) ?></strong>
	      <br />
	      To:<br />
	      <br />
	      <?= strtoupper($po[vendor_name]) ?><br />
	      <?= $po[vendor_addr] ?>, <?= $po[vendor_city] ?>, <?= $po[vendor_state] ?>, <?= $po[vendor_zip] ?></td>
	      <td width="155" rowspan="2" valign="top" class="bottomBorder">PO NUMBER/DATE<br />
		  <?= $apo[po_number] ?>
		  <br />
		  YOUR REFERENCE/DATE<br />
		  <?= $apo[po_your_ref] ?>
		  <br />
		  VENDOR NPWP:<br />
		  <?= $po[vendor_npwp] ?>		  </td>
	      <td rowspan="2" valign="top" class="bottomBorder rightBorder">SHIP TO:<br />
		  <?= $apo[po_ship_to] ?></textarea>		  </td>
	      <td valign="top" class="bottomBorder">
		  PAYMENT TO:<br />
		  <?= $apo[po_payment_to] ?><br />
		  Account No:<br />
		  <?= $apo[po_acc_no] ?>		  </td>
	      <td valign="top" class="bottomBorder rightBorder">
		  DELIVERY DATE:<br />
		  <?= date("d M Y", $apo[po_delivery_date]) ?>		  </td>
	  </tr>
	  <tr>
		  <td colspan="2" class="bottomBorder rightBorder" valign="top">IMPORTANT:<br />
		  <?= $apo[po_important] ?>		  </td>
      </tr>
	  <tr>
		  <td colspan="2" class="bottomBorder" valign="top">Terms of Delivery:<br />
		  <?= $apo[po_terms_of_delivery] ?>		  </td>
	      <td valign="top" class="bottomBorder">CURRENCY: <?= getQuoteCurrency($_GET[tender_id]) ?></td>
	      <td valign="top" class="bottomBorder">Payment Method:<br />
		  	<?= $apo[po_payment_method] ?>		  </td>
	      <td valign="top" class="bottomBorder rightBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="5" valign="top" style="padding: 0">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="4%" valign="top" class="bottomBorder rightBorder"><strong>Item</strong></td>
					<td width="10%" valign="top" class="bottomBorder rightBorder"><strong>Material No</strong></td>
					<td width="11%" valign="top" class="bottomBorder rightBorder"><strong>MG/SG</strong></td>
					<td width="9%" valign="top" class="bottomBorder rightBorder"><strong>Quantity</strong></td>
					<td width="9%" valign="top" class="bottomBorder rightBorder"><strong>Unit</strong></td>
					<td width="23%" valign="top" class="bottomBorder rightBorder"><strong>Description</strong></td>
					<td width="12%" valign="top" class="bottomBorder rightBorder"><strong>Price per Unit </strong></td>
					<td width="11%" valign="top" class="bottomBorder rightBorder"><strong>Value</strong></td>
					<td width="11%" valign="top" class="bottomBorder rightBorder"><strong>Delivery Date </strong></td>
				</tr>
				<?php for($i=0; $i<count($items); $i++) { ?>
				<tr>
					<td width="4%" valign="top" class="rightBorder bottomBorder"><?= $i+1 ?></td>
					<td width="10%" valign="top" class="rightBorder bottomBorder"><?= $items[$i][req_mat_no] ?></td>
					<td width="11%" valign="top" class="rightBorder bottomBorder"><?= $items[$i][req_material_group] ?></td>
					<td width="9%" valign="top" class="rightBorder bottomBorder"><?= $items[$i][req_qty] ?></td>
					<td width="9%" valign="top" class="rightBorder bottomBorder"><?= $items[$i][req_uom] ?></td>
					<td width="23%" valign="top" class="rightBorder bottomBorder"><?= $items[$i][req_desc] ?></td>
					<td width="12%" valign="top" class="rightBorder bottomBorder">
						<?= numberFormat($api[$i][item_price_per_unit]) ?>					</td>
					<td width="11%" valign="top" class="rightBorder bottomBorder">
						<?= numberFormat($api[$i][item_total_price]) ?>					</td>
					<td width="11%" valign="top" class="bottomBorder rightBorder">
						<?= $po[rfq_terms_of_delivery] ?>					</td>
				</tr>
				<?php } ?>
			</table>		</td>
    </tr>
	  <tr>
		  <td colspan="4" valign="top">Remarks:<br />
		  	<div style="min-height: 150px; *height: 150px;"><?= $apo[po_remarks] ?></div>		  </td>
	      <td valign="top" class="rightBorder">&nbsp;</td>
	  </tr>
  </table>
</body>
</html>