{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
<div class="cont" style="float:left;">
	<div class="fleft" style="width: 1px; height: 50px;">&nbsp;</div>
    <div class="left25 clear" style="margin-bottom: 10px; width: 700px;">
        <p style="font-size: 11pt; color: #df0000;">
        	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
            <strong>Apakah anda sudah terdaftar?</strong>
        </p>
        <p style="font-size: 10pt; color:black; margin-top: 7px;">
        	Jika anda telah melakukan pendaftaran vendor melalui aplikasi ini, mohon gunakan FORM LOGIN diatas untuk masuk ke area VENDOR. Mohon untuk tidak melakukan pendaftaran berulang-ulang.
        </p>
        <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
            <strong>Form Pendaftaran Vendor - Langkah 1</strong>
        </p>
        <p style="font-size: 11pt; color:black; margin-top: 7px;">
        	Semua Field <strong>WAJIB</strong> diisikan.<br />
            <form name="vendorReg1" action="?mod=vendor&step=1" method="post">
        	<table width="90%" border="0" cellpadding="1" cellspacing="5">
            	<tr>
            	  <td valign="top" style="font-size: 10pt;">&nbsp;</td>
            	  <td valign="top">&nbsp;</td>
            	  <td valign="top">&nbsp;</td>
          	  </tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top">&nbsp;                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Nama Perusahaan</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_name" value="{$pVendor_name}" />
                        {if $eVendor_name == 1}
                        &nbsp; <span class="formError">* Mohon masukkan NAMA PERUSAHAAN yang berbeda!</span>
                        {/if}                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">No. NPWP</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_npwp" value="{$pVendor_npwp}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<textarea name="vendor_addr" cols="30" rows="5" class="textField">{$pVendor_addr}</textarea>                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_city" value="{$pVendor_city}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_state" value="{$pVendor_state}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kode Pos</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_zip" value="{$pVendor_zip}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Telepon</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_tlp" value="{$pVendor_tlp}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Fax</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_fax" value="{$pVendor_fax}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Email</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_email" value="{$pVendor_email}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Website</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		http:// <input type="text" class="textField" name="vendor_web" value="{$pVendor_web}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top">&nbsp;</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Akte Pendirian</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_akte_pendirian" value="{$pVendor_akte_pendirian}" />                   	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Tanggal Pendirian</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" id="vendor_tgl_pendirian" class="textField" name="vendor_tgl_pendirian" value="{$pVendor_tgl_pendirian}" />
                        &nbsp;<img id="cal_vendor_tgl_pendirian" alt="" src="{$templateDir}/images/cal.png" />
                    </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Akte Perubahan</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_akte_perubahan" value="{$pVendor_akte_perubahan}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Tgl Perubahan</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" id="vendor_tgl_perubahan" class="textField" name="vendor_tgl_perubahan" value="{$pVendor_tgl_perubahan}" />
                        &nbsp;<img id="cal_vendor_tgl_perubahan" alt="" src="{$templateDir}/images/cal.png" />
                    </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">No. SIUP</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
                    	<input type="text" class="textField" name="vendor_siup" value="{$pVendor_siup}" />                    </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top">&nbsp;</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Pertagas Terdekat</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<select name="nearest_branch" class="textField">
                        	<option value="0">Silahkan Pilih..</option>
                        	{foreach from=$branch key=branch_id item=branch_desc}
                        	<option value="{$branch_id}">{$branch_desc}</option>
                            {/foreach}
                        </select>
                        {if $eNearest_branch == 1}
                        &nbsp; <span class="formError">* Mohon pilih cabang yang terdekat!</span>
                        {/if}                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top">&nbsp;</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kualifikasi</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_qualification" value="{$pVendor_qualification}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Sub Bidang</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="textField" name="vendor_sub_bidang" value="{$pVendor_sub_bidang}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top">&nbsp;</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top"><input type="submit" class="textField" onclick="return DoubleClickTrapperAction();" name="submitVendorStep1" value=" LANJUTKAN " /></td>
              	</tr>
            </table>
      </form>
      {dhtml_calendar inputField="vendor_tgl_pendirian" ifFormat="%d %B %Y" button="cal_vendor_tgl_pendirian" singleClick=false}
      {dhtml_calendar inputField="vendor_tgl_perubahan" ifFormat="%d %B %Y" button="cal_vendor_tgl_perubahan" singleClick=false}
            <script language="javascript">
				var frmvalidator  = new Validator("vendorReg1");
				frmvalidator.clearAllValidations();
				frmvalidator.setAddnlValidationFunction("validatePassword");
				
				frmvalidator.addValidation("vendor_name","req","Mohon Masukkan nama perusahaan!");
				frmvalidator.addValidation("vendor_npwp","req","Mohon Masukkan Nomor NPWP!");
				frmvalidator.addValidation("vendor_addr","req","Mohon Masukkan Alamat Vendor!");
				frmvalidator.addValidation("vendor_city","req","Mohon Masukkan kota!");
				frmvalidator.addValidation("vendor_state","req","Mohon Masukkan propinsi!");
				frmvalidator.addValidation("vendor_zip","req","Mohon Masukkan kode pos!");
				frmvalidator.addValidation("vendor_tlp","req","Mohon Masukkan nomor telpon!");
				frmvalidator.addValidation("vendor_fax","req","Mohon Masukkan nomor fax!");
				frmvalidator.addValidation("vendor_email","req","Mohon Masukkan email!");
				frmvalidator.addValidation("vendor_web","req","Mohon Masukkan situs web!");
				
				frmvalidator.addValidation("vendor_akte_pendirian","req","Mohon Masukkan Akte Pendirian!");
				frmvalidator.addValidation("vendor_tgl_pendirian","req","Mohon Masukkan Tanggal Pendirian!");
				frmvalidator.addValidation("vendor_akte_perubahan","req","Mohon Masukkan Akte Perubahan!");
				frmvalidator.addValidation("vendor_tgl_perubahan","req","Mohon Masukkan Tanggal Perubahan!");
				frmvalidator.addValidation("vendor_siup","req","Mohon Masukkan No. SIUP!");
				
				frmvalidator.addValidation("nearest_branch","req","Mohon Masukkan Pertagas Terdekat!");
				frmvalidator.addValidation("vendor_qualification","req","Mohon Masukkan kualifikasi!");
				frmvalidator.addValidation("vendor_sub_bidang","req","Mohon Masukkan Sub Bidang!");
			</script>
        </p>
    </div>
</div>
{include file="footer.tpl"}