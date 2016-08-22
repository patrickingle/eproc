{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1 || $_userLevel == 2}
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
        <strong>User Edit - {$user.user_name}</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="eprocReg" action="?mod=eproc&act=eproc-user&user_id=1" method="post">
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
						{$user.user_name}
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
                    	<input type="text" class="textField" name="fName" value="{$user.fName}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Nama Belakang</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="lName" value="{$user.lName}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Jabatan</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="curr_position" value="{$user.curr_position}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">NIK</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="nik" value="{$user.nik}" />
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
                    	<input type="text" class="textField" name="birth_place" value="{$user.birth_place}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Tgl. Lahir</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	{$user.birth_date|date_format:"%d %b %y"}
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
                    	<input type="text" class="textField" name="div_tlp" value="{$user.div_tlp}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">No. Fax</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_fax" value="{$user.div_fax}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">No. Handphone</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_hp" value="{$user.div_hp}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Email</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="div_email" value="{$user.div_email}" />
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
                    	<textarea class="textField" cols="30" rows="5" name="address">{$user.address}</textarea>
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Kota</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="city" value="{$user.city}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Propinsi</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="state" value="{$user.state}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">Kode Pos</td>
                    <td width="5%" valign="top"><div align="center">:</div></td>
                    <td width="74%" valign="top">
                    	<input type="text" class="textField" name="zip" value="{$user.zip}" />
                    </td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">&nbsp;</td>
                </tr>
                <tr>
                    <td width="21%" valign="top" style="font-size: 10pt;">&nbsp;</td>
                    <td width="5%" valign="top">&nbsp;</td>
                    <td width="74%" valign="top">
                    	<input type="submit" name="submitEprocReg" value=" EDIT " class="btn" />
                    </td>
                </tr>
            </table>
            </form>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}