<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>QUOTATION FORM</title>
<link href="/themes/default/style.css" rel="stylesheet" type="text/css">
<link href="/themes/default/pdf.css" rel="stylesheet" type="text/css">
</head>
<?php
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	$conn = new DbConnector();
	
	// Quotation
	$q = "SELECT * FROM op_quotations WHERE vendor_id = $_GET[vendor_id] AND tender_id = $_GET[tender_id] ORDER BY quo_id ASC";
	$res = $conn->query($q); $i = 0;
	while($qu = $conn->fetchArray($res)) {
		foreach($qu as $key => $value) {
			$quo[$i][$key] = $value;
			if($key == 'quo_total_price') {
				$itemTotal += $value;
			}
		}
		$i++;
	}
	$itemPpn = $itemTotal * 0.1;
	$itemGrand = $itemTotal + $itemPpn;
	
	// Tender Items
	$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id] ORDER BY item_id";
	$res = $conn->query($q); $i = 0;
	while($it = $conn->fetchArray($res)) {
		foreach($it as $key => $value) {
			$items[$i][$key] = $value;
		}
		$i++;
	}
?>
<body style="background: none;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="rfqTable">
      <tr>
        <td valign="top">
        	<img src="/themes/default/images/pertagas-logo.jpg" alt="Pertagas" border="0" />        </td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td class="topBorder" valign="top">QUOTATION</td>
        <td class="topBorder" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" width="50%">
        	TO:<br />
       	  PT. PERTAGAS<br />
JL. MH THAMRIN NO. 55<br />
JAKARTA 10350</td>
        <td valign="top" width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td width="50%">RFQ NUMBER/DATE</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%"><?= $quo[0][rfq_number] ?></td>
          </tr>
          <tr>
            <td>COLLECTIVE NUMBER</td>
            <td><div align="center">:</div></td>
            <td><?= $quo[0][rfq_collective_number] ?></td>
          </tr>
          <tr>
            <td>YOUR VENDOR NUMBER WITH US</td>
            <td><div align="center">:</div></td>
            <td><?= $quo[0][rfq_your_vendor_number] ?></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div align="center"></div></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>CONTACT PERSON/TELEPHONE</td>
            <td><div align="center">:</div></td>
            <td><?= $quo[0][resp_name] ?></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" style="font-size: 8pt;">Enclose RFQ Number, Collective Number and Vendor Number when submitting quotation.</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="topBorder" valign="top">FROM:<br />
          <?= $quo[0][vendor_name] ?><br />
<?= $quo[0][vendor_addr] ?><br />
<?= $quo[0][vendor_city] ?> <?= $quo[0][vendor_zip] ?></td>
        <td class="topBorder" valign="top">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td width="50%">QUOTATION DEADLINE</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%"><?= $quo[0][rfq_quotation_deadline] ?></td>
          </tr>
          <tr>
            <td>DEADLINE (DAYS)</td>
            <td><div align="center">:</div></td>
            <td><?= $quo[0][rfq_delivery_time] ?></td>
          </tr>
          <tr>
            <td>TERMS OF DELIVERY</td>
            <td><div align="center">:</div></td>
            <td><?= $quo[0][rfq_terms_of_delivery] ?></td>
          </tr>
          <tr>
            <td>PRICE VALIDITY</td>
            <td><div align="center">:</div></td>
            <td><?= $quo[0][rfq_price_validity] ?></td>
          </tr>
          <tr>
            <td colspan="3" class="smallText">&nbsp;</td>
            </tr>
        </table>        </td>
      </tr>
      <tr id="zeropad1">
        <td colspan="2" valign="top" class="topBorder leftBorder rightBorder">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="bottomBorder rightBorder"><div align="center">Item</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Quantity</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Unit</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Description</div></td>
            <td class="bottomBorder rightBorder"><div align="center">Mat No/Serv No</div></td>
            <td class="bottomBorder rightBorder"><div align="center">MG/SG</div></td>
			<td class="bottomBorder rightBorder"><div align="center">Price/Unit</div></td>
			<td class="bottomBorder"><div align="center">Total Price</div></td>
          </tr>
          <?php for($i=0; $i<count($items); $i++) { ?>
          <tr>
            <td class="rightBorder"><div align="center"><?= $i+1 ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_qty] ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_uom] ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_desc] ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_mat_no] ?></div></td>
            <td class="rightBorder" valign="middle"><div align="center">
              <?= $items[$i][req_mgsg] ?></div></td>
			<td class="rightBorder" align="center">
				<?= strtoupper($quo[0][quo_currency]) ?> <?= numberFormat($quo[$i][quo_unit_price]) ?>
			</td>
			<td align="center">
				<?= strtoupper($quo[0][quo_currency]) ?> <?= numberFormat($quo[$i][quo_total_price]) ?>
			</td>
          </tr>
          <?php } ?>
        </table></td>
        </tr>
		<tr id="zeropad1">
        <td colspan="2" valign="top" class="topBorder">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="3%"><div align="center">&nbsp;</div></td>
				<td width="50%"><div align="center">&nbsp;</div></td>
				<td width="18%"><div align="center">Total</div></td>
				<td width="17%"><div align="left"><?= $itemTotal ?></div></td>
			  </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td><div align="center">PPN (10%) </div></td>
			    <td><?= $itemPpn ?></td>
		      </tr>
			  <tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			    <td><div align="center">Grand Total </div></td>
			    <td><?= $itemGrand ?></td>
		      </tr>
			 </table>
		</td>
      </tr>
      <tr>
        <td class="topBorder" valign="top"><br />
          &nbsp;Notes:<br />
          <?= $quo[0][quo_notes] ?>
        </td>
        <td class="topBorder" valign="top">
        	&nbsp;<br />
        	<?= $quo[0][vendor_name] ?><br />
			<?= $quo[0][quo_division] ?>,<br />
        	&nbsp;
            <br />&nbsp;
            <br />&nbsp;
            <br />
            <?= $quo[0][quo_approval_person] ?>
        </td>
      </tr>
    </table>
</body>
</html>
<?php $conn->close(); ?>