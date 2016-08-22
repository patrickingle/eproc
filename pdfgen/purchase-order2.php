<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Purchase Order 2</title>
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
		<td width="154" class="bottomBorder rightBorder" valign="bottom">Delivery Time: <?= $po[rfq_terms_of_delivery] ?> </td>
	  </tr>
	  <tr>
	    <td width="198" rowspan="2" valign="top" class="bottomBorder rightBorder"><strong>Purchase Order<br />
		  PO <?= strtoupper($apo[po_type]) ?></strong></td>
	      <td width="155" rowspan="2" valign="top" class="bottomBorder">PO NUMBER/DATE
          <br /><?= $apo[po_number] ?></td>
	      <td rowspan="2" valign="top" class="bottomBorder">CURRENCY: <?= getQuoteCurrency($_GET[tender_id]) ?></td>
	      <td valign="top">&nbsp;</td>
	      <td valign="top" class="rightBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="2" class="bottomBorder rightBorder" valign="top">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="2" class="bottomBorder" valign="top"><p>&nbsp;</p>        </td>
	      <td valign="top" class="bottomBorder">&nbsp;</td>
	      <td valign="top" class="bottomBorder"><br /></td>
	      <td valign="top" class="bottomBorder rightBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="5" valign="top" style="padding: 0" class="rightBorder">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="16%" valign="top">Gross price in <?= getQuoteCurrency($_GET[tender_id]) ?></td>
					<td width="2%" valign="top">&nbsp;</td>
					<td width="82%" valign="top" class="smallText">
						<?= numberFormat($apo[po_gross_value]) ?>				  </td>
				</tr>
				<tr>
				  <td valign="top">PPN 10% </td>
				  <td valign="top">&nbsp;</td>
				  <td valign="top" class="smallText"><?= numberFormat($apo[po_ppn]) ?></td>
			  </tr>
				<tr>
				  <td valign="top">Total Net Value Incl. Tax <?= getQuoteCurrency($_GET[tender_id]) ?></td>
				  <td valign="top">&nbsp;</td>
				  <td valign="top" class="smallText"><?= numberFormat($apo[po_net_value]) ?></td>
			  </tr>
				<tr>
				  <td colspan="3" valign="top" class="smallText"><em><?= $apo[po_net_wordings] ?></em></td>
			  </tr>
		</table>		</td>
    </tr>
	  <tr>
	    <td colspan="5" valign="top" class="rightBorder">&nbsp;</td>
	  </tr>
	  <tr>
	    <td colspan="5" valign="top" class="rightBorder">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top" class="rightBorder">We confirm our acceptance of the fore going agreement<br />
        on the terms and conditions herein stated. <br />
        Signature:<br />
        Name:<br />
        Date:</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top" class="rightBorder">&nbsp;</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top" style="padding: 0" class="rightBorder">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top"><strong><?= strtoupper($po[vendor_name]) ?></strong></td>
					<td width="8%" valign="top"></td>
					<td width="32%" valign="top"><strong>PT. PERTAMINA GAS </strong></td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">&nbsp;</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">&nbsp;</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">&nbsp;</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top">&nbsp;</td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">
						<?= $apo[po_vendor_name] ?>
					</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top"><?= $apo[po_pertagas_name] ?></td>
				</tr>
				<tr>
					<td width="37%" valign="top">&nbsp;</td>
					<td width="23%" valign="top">
						<?= $apo[po_vendor_position] ?>
					</td>
					<td width="8%" valign="top">&nbsp;</td>
					<td width="32%" valign="top"><?= $apo[po_pertagas_position] ?></td>
				</tr>
			</table>
		</td>
      </tr>
	  <tr>
	    <td colspan="5" valign="top" class="rightBorder">&nbsp;</td>
      </tr>
  </table>
</body>
</html>