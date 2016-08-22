<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>YEARLY REPORT - <?= $_GET[year] ?></title>
<link href="/themes/default/style.css" rel="stylesheet" type="text/css">
<link href="/themes/default/pdf.css" rel="stylesheet" type="text/css">
</head>
<?php
	include "DbConnector.class.php";
	include "../inc/functions.inc.php";
	include "../inc/globals.inc.php";
	$conn = new DbConnector();
	
	$start = strtotime("01 January " . $_GET[year]);
	$end = strtotime("31 December " . $_GET[year]);
	$q = "SELECT * FROM ep_tender_requests WHERE created_date >= $start AND created_date <= $end ORDER BY tender_id";
	$res = $conn->query($q); $i = 0;
	while($ten = $conn->fetchArray($res)) {
		foreach($ten as $key => $value) {
			$tender[$i][$key] = $value;
			if($key == "vendor_id") {
				$tender[$i][vendor_name] = strtoupper(getVendorNameById($value));
			}
		}
		$i++;
	}
	
	// PR Value
	for($i=0; $i<count($tender); $i++) {
		$q = "SELECT * FROM ep_tender_items WHERE tender_id = " . $tender[$i][tender_id] . " ORDER BY item_id";
		$rq = $conn->query($q);
		while($co = $conn->fetchObject($rq)) {
			if(strtoupper(getQuoteCurrency($tender[$i][tender_id])) == "USD") {
				$tender[$i][pr_value_usd] += $co->req_est_price * $co->req_qty;
				$total[pr][usd] += $co->req_est_price * $co->req_qty;
			}
			else if(strtoupper(getQuoteCurrency($tender[$i][tender_id])) == "IDR") {
				$tender[$i][pr_value_idr] += $co->req_est_price * $co->req_qty;
				$total[pr][idr] += $co->req_est_price * $co->req_qty;
			}
		}
	}
	
	// PO Value
	for($i=0; $i<count($tender); $i++) {
		$q = "SELECT * FROM ep_tender_po_items WHERE tender_id = " . $tender[$i][tender_id] . " ORDER BY item_id";
		$rq = $conn->query($q);
		while($co = $conn->fetchObject($rq)) {
			if(strtoupper(getQuoteCurrency($tender[$i][tender_id])) == "USD") {
				$tender[$i][po_value_usd] += $co->item_total_price;
				$total[po][usd] += $co->item_total_price;
			}
			else if(strtoupper(getQuoteCurrency($tender[$i][tender_id])) == "IDR") {
				$tender[$i][po_value_idr] += $co->item_total_price;
				$total[po][idr] += $co->item_total_price;
			}
		}
	}
	
	// From RFQ
	for($i=0; $i<count($tender); $i++) {
		$q = "SELECT rfq_terms_of_delivery FROM ep_tender_rfq WHERE tender_id = " . 
			 $tender[$i][tender_id] . " LIMIT 1";
		$rq = $conn->fetchArray($conn->query($q));
		$tender[$i][rfq_delivery] = $rq[rfq_terms_of_delivery];
	}
	
	// From Ringkasan
	for($i=0; $i<count($tender); $i++) {
		$q = "SELECT doc_delivery_time_menjadi FROM ep_ringkasan1 WHERE tender_id = " .
	 		 $tender[$i][tender_id] . " AND vendor_id = " . $tender[$i][vendor_id] . " LIMIT 1";
		$rr = $conn->fetchArray($conn->query($q));
		if($rr[doc_delivery_time_menjadi] > 0) {
			$tender[$i][delivery_time] = $rr[doc_delivery_time_menjadi];
			$total[delivery_time] =+ $rr[doc_delivery_time_menjadi];
			$total[dsum]++;
		}
	}
	
	// Kurs Dollar
	$q = "SELECT settings_value FROM ep_app_settings WHERE settings_name = 'kurs_dollar' LIMIT 1";
	$rq = $conn->fetchArray($conn->query($q));
	$kurs = $rq->settings_value;
	
	// PDF Printing
	if($_GET[pdf] == 1) {
		$url = urlencode($_SERVER[SERVER_NAME] . "/pdfgen/report-yearly.php?" . $_SERVER['QUERY_STRING']);
		$html2ps = "http://" . $_SERVER[SERVER_NAME] . HTML2PSREP_SETTINGS . $url;
	}
?>
<body style="background: none;">
	<script language="javascript">
		function print_to_pdf() {
			document.getElementById('pdf').value = 1;
			document.repForm.submit();
		}
	</script>
	<form name="repForm" method="get" action="report-yearly.php?year=<?= $_GET[year] ?>">
	<input type="hidden" name="year" value="<?= $_GET[year] ?>" />
	<input type="hidden" name="pdf" id="pdf" value="0" />
	<?php if($_GET[pdf] == 1) { ?>
	<script language="javascript">
		url = '<?= $html2ps ?>';
		top.location.href = url;
	</script>
	<?php } ?>
	<table border="0" cellpadding="0" cellspacing="0" class="rfqTable fBorder" width="100%">
		<tr>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>NO</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>JUDUL PEKERJAAN</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>NO PR</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>NILAI PR USD</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>NILAI PR IDR</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>NILAI PO USD</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>NILAI PO IDR</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>VENDOR</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>JANGKA WAKTU / DT</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>TGL MULAI</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>TGL SELESAI</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>KETERANGAN</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>USER</strong></td>
			<td valign="top" class="disabledRow rightBorder bottomBorder"><strong>PROSES PENGADAAN</strong></td>
		</tr>
		<?php for($i=0; $i<count($tender); $i++) { ?>
		<tr>
			<td valign="top" class="rightBorder bottomBorder"><?= $i+1 ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= $tender[$i][req_purpose] ?></td>
			<td valign="top" class="rightBorder bottomBorder">
				<?php if($_GET[pdf] == 0) { ?>
				<input type="text" class="btn" name="no_pr[<?= $i ?>]" value="<?= $_GET[no_pr][$i] ?>" />
				<?php } else { ?>
				<?= $_GET[no_pr][$i] ?>
				<?php } ?>
			</td>
			<td valign="top" class="rightBorder bottomBorder"><?= numberFormat($tender[$i][pr_value_usd]) ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= numberFormat($tender[$i][pr_value_idr]) ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= numberFormat($tender[$i][po_value_usd]) ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= numberFormat($tender[$i][po_value_idr]) ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= $tender[$i][vendor_name] ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= $tender[$i][delivery_time] ?></td>
			<td valign="top" class="rightBorder bottomBorder"><?= date("d M Y", $tender[$i][created_date]) ?></td>
			<td valign="top" class="rightBorder bottomBorder">
				<?php if($_GET[pdf] == 0) { ?>
				<input type="text" class="btn" name="tgl_selesai[<?= $i ?>]" value="<?= $_GET[tgl_selesai][$i] ?>" />
				<?php } else { ?>
				<?= $_GET[tgl_selesai][$i] ?>
				<?php } ?>
			</td>
			<td valign="top" class="rightBorder bottomBorder">
				<?php if($_GET[pdf] == 0) { ?>
				<input type="text" class="btn" name="keterangan[<?= $i ?>]" value="<?= $_GET[keterangan][$i] ?>" />
				<?php } else { ?>
				<?= $_GET[keterangan][$i] ?>
				<?php } ?>
			</td>
			<td valign="top" class="rightBorder bottomBorder"><?= getUserNameById($tender[$i][user_id]); ?></td>
			<td valign="top" class="bottomBorder rightBorder">
				<?php if($_GET[pdf] == 0) { ?>
				<input type="text" class="btn" name="proses[<?= $i ?>]" value="<?= $_GET[proses][$i] ?>" />
				<?php } else { ?>
				<?= $_GET[proses][$i] ?>
				<?php } ?>
			</td>
		</tr>
		<?php } ?>
		<tr>
			<td colspan="14" class="rightBorder">&nbsp;</td>
		</tr>
		<tr>
			<td valign="top">&nbsp;</td>
			<td valign="top">&nbsp;</td>
			<td valign="top">JUMLAH</td>
			<td valign="top"><?= numberFormat($total[pr][usd]) ?></td>
			<td valign="top"><?= numberFormat($total[pr][idr]) ?></td>
			<td valign="top"><?= numberFormat($total[po][usd]) ?></td>
			<td valign="top"><?= numberFormat($total[po][idr]) ?></td>
			<td valign="top"></td>
			<td valign="top"><?= $total[delivery_time] ?></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top" class="rightBorder"></td>
		</tr>
		<tr>
			<td valign="top">&nbsp;</td>
			<td valign="top">&nbsp;</td>
			<td valign="top">EQ (<?= getKursDollar() ?>)</td>
			<td valign="top"></td>
			<td valign="top"><?= numberFormat($total[pr][usd] * getKursDollar()) ?></td>
			<td valign="top"></td>
			<td valign="top"><?= numberFormat($total[po][usd] * getKursDollar()) ?></td>
			<td valign="top">AVERAGE</td>
			<td valign="top"><?= $total[delivery_time] / $total[dsum] ?></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top" class="rightBorder"></td>
		</tr>
		<tr>
			<td valign="top">&nbsp;</td>
			<td valign="top">&nbsp;</td>
			<td valign="top">TOTAL</td>
			<td valign="top"></td>
			<td valign="top"><?= numberFormat($total[pr][usd] * getKursDollar() + $total[pr][idr]) ?></td>
			<td valign="top"></td>
			<td valign="top"><?= numberFormat($total[po][usd] * getKursDollar() + $total[po][idr]) ?></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top" class="rightBorder"></td>
		</tr>
		<tr>
			<td valign="top">&nbsp;</td>
			<td valign="top">&nbsp;</td>
			<td valign="top">COST REDUCTION</td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"><?= numberFormat( ($total[pr][usd] * getKursDollar() + $total[pr][idr]) - ($total[po][usd] * getKursDollar() + $total[po][idr]) ) ?></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td valign="top" class="rightBorder"></td>
		</tr>
		<?php if($_GET[pdf] == 0) { ?>
		<tr>
			<td colspan="14">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="14" align="center">
				<input type="submit" value=" RUBAH! " name="submitRep" /> <input type="button" value="Print to PDF" onclick="print_to_pdf()" />
			</td>
		</tr>
		<?php } ?>
	</table>
	</form>
</body>
</html>
<?php $conn->close(); ?>