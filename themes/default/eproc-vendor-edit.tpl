{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.success == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	SUKSES EDIT
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Vendor Edit - {$user.vendor_name}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<form name="vendorReg1" action="?mod=eproc&act=vendor-edit&user_id={$_GET.user_id}" method="post">
        	<table width="90%" border="0" cellpadding="1" cellspacing="5">
            	<tr>
            	  <td valign="top" style="font-size: 10pt;">&nbsp;</td>
            	  <td valign="top">&nbsp;</td>
            	  <td valign="top">&nbsp;</td>
          	  </tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Nama Perusahaan</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_name" value="{$user.vendor_name}" />
                    </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">No. NPWP</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_npwp" value="{$user.vendor_npwp}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<textarea name="vendor_addr" cols="30" rows="5" class="btn">{$user.vendor_addr}</textarea>                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_city" value="{$user.vendor_city}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_state" value="{$user.vendor_state}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kode Pos</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_zip" value="{$user.vendor_zip}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Telepon</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_tlp" value="{$user.vendor_tlp}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Fax</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_fax" value="{$user.vendor_fax}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Email</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_email" value="{$user.vendor_email}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Website</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		http:// <input type="text" class="btn" name="vendor_web" value="{$user.vendor_web}" />                  	</td>
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
               	  		<input type="text" class="btn" name="vendor_akte_pendirian" value="{$user.vendor_akte_pendirian}" />                   	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Tanggal Pendirian</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" id="vendor_tgl_pendirian" class="btn" name="vendor_tgl_pendirian" value="{$user.vendor_tgl_pendirian|date_format:"%d %b %y"}" />
                        &nbsp;<img id="cal_vendor_tgl_pendirian" alt="" src="{$templateDir}/images/cal.png" />
                    </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Akte Perubahan</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_akte_perubahan" value="{$user.vendor_akte_perubahan}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Tgl Perubahan</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" id="vendor_tgl_perubahan" class="btn" name="vendor_tgl_perubahan" value="{$user.vendor_tgl_perubahan|date_format:"%d %b %y"}" />
                        &nbsp;<img id="cal_vendor_tgl_perubahan" alt="" src="{$templateDir}/images/cal.png" />
                    </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">No. SIUP</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
                    	<input type="text" class="btn" name="vendor_siup" value="{$user.vendor_siup}" />                    </td>
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
               	  		<select name="nearest_branch" class="btn">
                        	<option value="0">Silahkan Pilih..</option>
                        	{foreach from=$branch key=branch_id item=branch_desc}
                        	<option value="{$branch_id}"{if $branch_id == $user.nearest_branch} selected{/if}>{$branch_desc}</option>
                            {/foreach}
                        </select></td>
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
               	  		<input type="text" class="btn" name="vendor_qualification" value="{$user.vendor_qualification}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Sub Bidang</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_sub_bidang" value="{$user.vendor_sub_bidang}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top">&nbsp;</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                  	<td width="5%" valign="top"><div align="center">&nbsp;</div></td>
               		<td width="74%" valign="top"></td>
              	</tr>
            </table>
<table width="90%" border="0" cellpadding="1" cellspacing="5">
            	<tr>
            	  <td colspan="3" valign="top" style="font-size: 10pt;"><strong>Informasi Kantor Cabang Vendor:</strong></td>
   	  </tr>
            	<tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
               	  <td width="5%" valign="top"><div align="center">:</div></td>
           		  <td width="74%" valign="top">
               	  		<textarea class="btn" cols="30" rows="5" name="vendor_rep_addr">{$user.vendor_rep_addr}</textarea>                   </td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
                        <input type="text" class="btn" name="vendor_rep_state" value="{$user.vendor_rep_state}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
                  	<td width="5%" valign="top"><div align="center">:</div></td>
               		<td width="74%" valign="top">
               	  		<input type="text" class="btn" name="vendor_rep_state" value="{$user.vendor_rep_state}" />                  	</td>
              	</tr>
                <tr>
                	<td width="21%" valign="top" style="font-size: 10pt;">Kode Pos</td>
                  	<td width="5%" valign="top"><div align="center">:&nbsp;</div></td>
               		<td width="74%" valign="top">
                    	<input type="text" class="btn" name="vendor_rep_zip" value="{$user.vendor_rep_zip}" />                    </td>
              	</tr>
            </table>
            <p>&nbsp;</p>
<p style="font-size: 11pt; color:black; margin-top: 7px;"><strong>
           	  Orang yang bertanggung jawab: </strong></p>
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
                  	<input type="text" class="btn" name="resp_name" value="{$user.resp_name}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Jabatan</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                 	<input type="text" class="btn" name="resp_position" value="{$user.resp_position}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">No. KTP</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_ktp" value="{$user.resp_ktp}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<textarea class="btn" cols="30" rows="5" name="resp_addr">{$user.resp_addr}</textarea>                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_city" value="{$user.resp_city}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_state" value="{$user.resp_state}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Kode pos</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_zip" value="{$user.resp_zip}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">No. Telepon</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_tlp" value="{$user.resp_tlp}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">No. Handphone</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_hp" value="{$user.resp_hp}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Email</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_email" value="{$user.resp_email}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Tempat lahir</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" class="btn" name="resp_birth_place" value="{$user.resp_birth_place}" />                  </td>
				</tr>
                <tr>
            	  <td width="21%" valign="top" style="font-size: 10pt;">Tanggal lahir</td>
            	  <td width="5%" valign="top"><div align="center">:</div></td>
            	  <td width="74%" valign="top">
                  	<input type="text" id="resp_birth_date" class="btn" name="resp_birth_date" value="{$user.resp_birth_date|date_format:"%d %b %y"}" />
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
                  <td valign="top"></td>
                </tr>
            </table>
			<p><input type="submit" name="submitEditVendor" value="   EDIT   " /></p>
  		</form>
		{dhtml_calendar inputField="vendor_tgl_pendirian" ifFormat="%d %B %Y" button="cal_vendor_tgl_pendirian" singleClick=false}
        {dhtml_calendar inputField="vendor_tgl_perubahan" ifFormat="%d %B %Y" button="cal_vendor_tgl_perubahan" singleClick=false}
		{dhtml_calendar inputField="resp_birth_date" ifFormat="%d %B %Y" button="cal_resp_birth_date" singleClick=false}
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}