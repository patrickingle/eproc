<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>RFQ Form</title>
<link href="/themes/default/style.css" rel="stylesheet" type="text/css">
<link href="/themes/default/pdf.css" rel="stylesheet" type="text/css">
</head>
<?php
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	$conn = new DbConnector();
	
	$q = "SELECT * FROM users_info_vendor WHERE user_id = $_GET[vendor_id] LIMIT 1";
	$vendor = $conn->fetchArray($conn->query($q));
	
	$q = "SELECT * FROM ep_tender_rfq WHERE tender_id = $_GET[tender_id] AND vendor_id = $_GET[vendor_id] LIMIT 1";
	$rfqs = $conn->fetchArray($conn->query($q));
	
	$q = "SELECT * FROM ep_tender_items WHERE tender_id = $_GET[tender_id]";
	$res = $conn->query($q); $i = 0;
	while($the = $conn->fetchArray($res)) {
		foreach($the as $key => $value) {
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
        <td class="topBorder" valign="top">REQUEST FOR QUOTATION</td>
        <td class="topBorder" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top" width="50%">
        	TO:<br />
			<?= strtoupper($vendor[vendor_name]) ?><br />
			<?= $vendor[vendor_addr] ?><br />
            <?= $vendor[vendor_city] ?> <?= $vendor[vendor_zip] ?>        </td>
        <td valign="top" width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td>RFQ DATE</td>
            <td><div align="center">:</div></td>
            <td><?= date("d M y", $rfqs[rfq_created_date]) ?></td>
          </tr>
          <tr>
            <td width="50%">RFQ NUMBER</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%">
            	<?= $rfqs[rfq_number] ?>            </td>
          </tr>
          <tr>
            <td>COLLECTIVE NUMBER</td>
            <td><div align="center">:</div></td>
            <td><?= $rfqs[rfq_collective_number] ?></td>
          </tr>
          <tr>
            <td>YOUR VENDOR NUMBER WITH US</td>
            <td><div align="center">:</div></td>
            <td><?= $vendor[user_name] ?></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div align="center"></div></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>CONTACT PERSON/TELEPHONE</td>
            <td><div align="center">:</div></td>
            <td><?= $vendor[resp_name] ?></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" class="smallText">Enclose RFQ Number, Collective Number and Vendor Number when submitting quotation.</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="topBorder" valign="top">PLEASE DELIVER TO:<br />
          PT. PERTAGAS<br />
		  JL. MH THAMRIN NO. 55<br />
		  JAKARTA 10350</td>
        <td class="topBorder" valign="top">
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="zeropad1">
          <tr>
            <td width="50%">QUOTATION DEADLINE</td>
            <td width="3%"><div align="center">:</div></td>
            <td width="47%"><?= $rfqs[rfq_quotation_deadline] ?> Hari</td>
          </tr>
          <tr>
            <td>DEADLINE (DAYS)</td>
            <td><div align="center">:</div></td>
            <td><?= $rfqs[rfq_delivery_time] ?> Hari</td>
          </tr>
          <tr>
            <td>TERMS OF DELIVERY</td>
            <td><div align="center">:</div></td>
            <td><?= $rfqs[rfq_terms_of_delivery] ?> Hari</td>
          </tr>
          <tr>
            <td>PRICE VALIDITY</td>
            <td><div align="center">:</div></td>
            <td><?= $rfqs[rfq_price_validity] ?> Hari</td>
          </tr>
          <tr>
            <td colspan="3" class="smallText">&nbsp;</td>
            </tr>
        </table>        </td>
      </tr>
      <tr id="zeropad1">
        <td colspan="2" valign="top" class="topBorder">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="7%" class="leftBorder bottomBorder rightBorder"><div align="center">Item</div></td>
            <td width="12%" class="bottomBorder rightBorder"><div align="center">Quantity</div></td>
            <td width="8%" class="bottomBorder rightBorder"><div align="center">Unit</div></td>
            <td width="44%" class="bottomBorder rightBorder"><div align="center">Description</div></td>
            <td width="15%" class="bottomBorder rightBorder"><div align="center">Mat No/Serv No</div></td>
            <td width="14%" class="bottomBorder rightBorder"><div align="center">MG/SG</div></td>
          </tr>
          <?php for($i=0; $i<count($items); $i++) { ?>
          <tr>
            <td class="leftBorder rightBorder"><div align="center"><?= $i+1 ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_qty] ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_uom] ?></div></td>
            <td class="rightBorder"><div align="center"><?= $items[$i][req_desc] ?></div></td>
            <td class="rightBorder"><div align="center">
            	<?= $items[$i][req_mat_no] ?>
            </div></td>
            <td valign="middle" class="rightBorder"><div align="center">
            	<?= $items[$i][req_mgsg] ?>
            </div></td>
          </tr>
          <?php } ?>
        </table></td>
        </tr>
      <tr>
        <td class="topBorder" valign="top"><br />
          &nbsp;Notes:<br />
          <label>
          <?= $rfqs[rfq_notes] ?>
          </label></td>
        <td class="topBorder" valign="top">
        	&nbsp;<br />
        	PT. PERTAGAS<br />
            PROCUREMENT,<br />&nbsp;
            <br />&nbsp;
            <br />&nbsp;
            <br />
            <?= $rfqs[rfq_approval_person] ?>
        </td>
      </tr>
    </table>
</body>
</html>
<?php $conn->close(); ?>