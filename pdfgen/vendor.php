<?php
	include "DbConnector.class.php";
	
	$conn = new DbConnector();
	
	$q = "SELECT * FROM users_info_vendor WHERE user_id = $_GET[user_id] LIMIT 1";
	$row = @$conn->fetchObject($conn->query($q));
	
	$q = "SELECT ep_code, description, city FROM ep_branches WHERE branch_id = " . $row->nearest_branch . " LIMIT 1";
	$branch = @$conn->fetchObject($conn->query($q));
	$dbranch = $branch->ep_code . " - " . $branch->description . " - " . $branch->city;
	
	?>
    <br />&nbsp;<br />
<table width="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
        	<td colspan="3" valign="top" style="font-size: 13pt; padding: 5px;">
       	  <strong><?= $row->vendor_name ?></strong></td>
		</tr>
		<tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Username            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->user_name ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Nomor NPWP            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_npwp ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Alamat            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_addr ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kota            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_city ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Propinsi            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_state ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kode Pos            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_zip ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	No. Telepon            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_tlp ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	No. Fax            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_fax ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Email            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_email ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Situs Web            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_web ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Akte Pendirian            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_akte_pendirian ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Tgl Pendirian            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= date("d M y",$row->vendor_tgl_pendirian) ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Akte Perubahan            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_akte_perubahan ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Tgl Perubahan            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= date("d M y",$row->vendor_tgl_perubahan) ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Pertagas Terdekat            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $dbranch ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kualifikasi            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_qualification ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Sub Bidang            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_sub_bidang ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Nomor SIUP            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_siup ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">&nbsp;            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">&nbsp;</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;">&nbsp;</td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 12pt; padding: 5px;">
            	Kantor Cabang            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">&nbsp;</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;">&nbsp;</td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Alamat            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_rep_addr ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kota            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_rep_city ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Propinsi            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_rep_state ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kode Pos            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->vendor_rep_zip ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 12pt; padding: 5px;">&nbsp;            	           </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">&nbsp;</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;">&nbsp;</td>
  		</tr>
        <tr>
        	<td colspan="3" valign="top" style="font-size: 12pt; padding: 5px;">
           	  Penanggung Jawab</td>
		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 12pt; padding: 5px;">
            	Nama           </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_name ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Jabatan            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_position ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Alamat            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_addr ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kota            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_city ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Propinsi            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_state ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Kode Pos            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_zip ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	No. Telepon            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_tlp ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	No. Handphone            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_hp ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Email            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_email ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	No. KTP            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_ktp ?></td>
  		</tr>
        <tr>
        	<td width="20%" valign="top" style="font-size: 10pt; padding: 5px;">
            	Tempat/Tgl. Lahir            </td>
 			<td width="6%" valign="top" style="font-size: 10pt; padding: 5px;">
      			<div align="center">:</div>        	</td>
    		<td width="74%" valign="top" style="font-size: 10pt; padding: 5px;"><?= $row->resp_birth_place ?>, <?= date("d M y",$row->resp_birth_date) ?></td>
  		</tr>
</table>
	<?php
	
	$conn->close();
?>