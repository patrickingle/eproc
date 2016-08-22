{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
<div class="cont" style="float: left;">
	<div class="fleft" style="width: 1px; height: 50px;">&nbsp;</div>
    <div class="left25 clear" style="margin-bottom: 10px; width: 700px;">
        <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
            <strong>Form Pendaftaran eProcurement User</strong>
        </p>
        <p style="font-size: 11pt; color:black; margin-top: 7px;">
        	<br />&nbsp;<br />
            <form name="eprocReg" action="?mod=eproc&act=reg&step=1" method="post">
            <table width="90%" border="0" cellpadding="1" cellspacing="5">
            	<tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Username</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="user_name" value="{$pUser_name}" />
                        {if $eUser_name == 1}
                        &nbsp; <span class="formError">* Sudah digunakan, mohon masukkan USERNAME lain!</span>
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Password</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="password" class="textField" name="user_password1" value="" />
                        {if $eUser_name == 1}
                        &nbsp; <span class="formError">* Password tidak sama, mohon masukkan kembali!</span>
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Konfirmasi Password</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="password" class="textField" name="user_password2" value="" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Nama Depan</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="fName" value="{$pFName}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Nama Belakang</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="lName" value="{$pLName}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Jabatan</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="curr_position" value="{$pCurr_position}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">NIK</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="nik" value="{$pNik}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Tempat Lahir</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="birth_place" value="{$pBirth_place}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Tgl. Lahir</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" id="birth_date" name="birth_date" value="{$pBirth_date}" />
                        &nbsp;<img id="cal_birth_date" alt="" src="{$templateDir}/images/cal.png" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">No. Telepon</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_tlp" value="{$pDiv_tlp}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">No. Fax</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_fax" value="{$pDiv_fax}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">No. Handphone</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_hp" value="{$pDiv_hp}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Email</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_email" value="{$pDiv_email}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Alamat</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<textarea class="textField" cols="30" rows="5" name="address">{$pAddress}</textarea>
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="city" value="{$pCity}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="state" value="{$pState}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Kode Pos</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="zip" value="{$pZip}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                {if $_userLevel == 1}
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Admin</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="checkbox" name="is_admin" /> Ya
                    </td>
                </tr>
                {/if}
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">
                    	<input type="submit" name="submitEprocReg" value=" DAFTARKAN " class="textField" />
                    </td>
                </tr>
            </table>
            </form>
            {dhtml_calendar inputField="birth_date" ifFormat="%d %B %Y" button="cal_birth_date" singleClick=false}
        </p>
    </div>
</div>
{include file="footer.tpl"}