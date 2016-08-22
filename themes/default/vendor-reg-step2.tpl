{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
<div class="cont" style="float:left;">
	<div class="fleft" style="width: 1px; height: 50px;">&nbsp;</div>
    <div class="left25 clear" style="margin-bottom: 10px; width: 700px;">
        <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
            <strong>Form Pendaftaran Vendor - Langkah 2</strong>
        </p>
        <p style="font-size: 11pt; color:black; margin-top: 7px;">
        	Mohon isikan informasi mengenai Kantor Perwakilan Perusahaan yang akan didaftarkan. Biarkan kosong jika tidak ada.<br />
            <form name="vendorReg2" action="?mod=vendor&step=2&user_id={$user_id}&session={$session_id}" method="post">
        	<table width="90%" border="0" cellpadding="1" cellspacing="5">
            	<tr>
            	  <td valign="top" style="font-size: 10pt;">&nbsp;</td>
            	  <td valign="top">&nbsp;</td>
            	  <td valign="top">&nbsp;</td>
          	  </tr>
            	<tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
               	  <td width="5%" valign="top"><div align="center">:</div></td>
           		  <td width="74%" valign="top">
               	  		<textarea class="textField" cols="30" rows="5" name="vendor_rep_addr">{$pVendor_rep_addr}</textarea>                   </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
                        <input type="password" class="textField" name="vendor_rep_state" value="{$pVendor_rep_state}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="password" class="textField" name="vendor_rep_state" value="{$pVendor_rep_state}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kode Pos</td>
                  	<td width="5%" valign="top"><div align="center">:&nbsp;</div></td>
               		<td width="74%" valign="top">
                    	<input type="text" class="textField" name="vendor_rep_zip" value="{$pVendor_rep_zip}" />                    </td>
              	</tr>
            </table>
            <p>&nbsp;</p>
            <p style="font-size: 11pt; color:black; margin-top: 7px;">
            	Mohon isikan informasi mengenai <strong>orang yang bertanggung jawab</strong> dalam perusahaan yang akan didaftarkan.
            Semua field <strong>WAJIB</strong> diisi.</p>
            <table width="90%" border="0" cellpadding="1" cellspacing="5">
            	<tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
            	  <td width="5%" valign="top"><div align="center"></div></td>
            	  <td width="74%" valign="top">&nbsp;</td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Nama</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_name" value="{$pResp_name}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Jabatan</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_position" value="{$pResp_position}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">No. KTP</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_ktp" value="{$pResp_ktp}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<textarea class="textField" cols="30" rows="5" name="resp_addr">{$pResp_addr}</textarea>                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_city" value="{$pResp_city}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_state" value="{$pResp_state}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Kode pos</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_zip" value="{$pResp_zip}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">No. Telepon</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_tlp" value="{$pResp_tlp}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">No. Handphone</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_hp" value="{$pResp_hp}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Email</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_email" value="{$pResp_email}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Tempat lahir</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="textField" name="resp_birth_place" value="{$pResp_birth_place}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Tanggal lahir</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" id="resp_birth_date" class="textField" name="resp_birth_date" value="{$pResp_birth_date}" />
                    &nbsp;<img id="cal_resp_birth_date" alt="" src="{$templateDir}/images/cal.png" />
                </td>
				</tr>
                <tr>
                  <td valign="top" style="font-size: 10pt;">&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td valign="top" style="font-size: 10pt;">&nbsp;</td>
                  <td valign="top">&nbsp;</td>
                  <td valign="top"><input type="submit" name="submitVendorStep2" class="textField" value=" LANJUTKAN " /></td>
                </tr>
            </table>
      </form>
      {dhtml_calendar inputField="resp_birth_date" ifFormat="%d %B %Y" button="cal_resp_birth_date" singleClick=false}
            <script language="javascript">
				var frmvalidator  = new Validator("vendorReg2");
				frmvalidator.clearAllValidations();
				
				frmvalidator.addValidation("resp_name","req","Mohon Masukkan nama orang yang bertanggung jawab!");
				frmvalidator.addValidation("resp_position","req","Mohon Masukkan jabatan!");
				frmvalidator.addValidation("resp_addr","req","Mohon Masukkan Alamat!");
				frmvalidator.addValidation("resp_city","req","Mohon Masukkan kota!");
				frmvalidator.addValidation("resp_state","req","Mohon Masukkan propinsi!");
				frmvalidator.addValidation("resp_zip","req","Mohon Masukkan kode pos!");
				frmvalidator.addValidation("resp_tlp","req","Mohon Masukkan nomor telpon!");
				frmvalidator.addValidation("resp_hp","req","Mohon Masukkan nomor HP!");
				frmvalidator.addValidation("resp_email","req","Mohon Masukkan email!");
				frmvalidator.addValidation("resp_ktp","req","Mohon Masukkan nomor KTP!");
				frmvalidator.addValidation("resp_birth_place","req","Mohon Masukkan tempat lahir!");
				frmvalidator.addValidation("resp_birth_date","req","Mohon Masukkan tanggal lahir!");
			</script>
        </p>
    </div>
</div>
{include file="footer.tpl"}