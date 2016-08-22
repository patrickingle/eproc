{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
<div class="cont" style="float:left;">
	<div class="fleft" style="width: 1px; height: 50px;">&nbsp;</div>
    <div class="left25 clear" style="margin-bottom: 10px; width: 700px;">
        <p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
            <strong>Form Pendaftaran Vendor - Langkah 3</strong>
        </p>
        <p style="font-size: 11pt; color:black; margin-top: 7px;">
        	Mohon masukkan dokumen-dokumen yang diperlukan. Proses entry dilakukan satu per satu untuk tiap dokumen. <br />&nbsp;<br />Untuk memasukkan dokumen, masukkan deskripsi dokumen tersebut, pilih file yang hendak dimasukkan dan tekan tombol "MASUKKAN FILE". <br />&nbsp;<br />Jika anda sudah selesai melakukan proses entry, tekan tombol "SELESAI".
      <form name="vendorReg3" action="?mod=vendor&step=3&user_id={$user_id}&session={$session_id}" method="post" enctype="multipart/form-data">
            	<br />&nbsp;<br />
				Deskripsi File:<br />
                <textarea name="description" class="textField" cols="30" rows="5"></textarea><br />&nbsp;<br />
        <input type="file" class="textField" name="req_file" /><br />&nbsp;<br />
                <input type="submit" class="textField" name="submitVendorStep3" value=" MASUKKAN FILE " /> 
                <input type="button" class="textField" name="step4" value=" SELESAI " onclick="top.location.href='?mod=vendor&step=4&user_id={$user_id}&session={$session_id}'" /> 
      </form>
        </p>
        <p>&nbsp;</p>
        <p style="font-size: 11pt; color:black; margin-top: 7px;">
        	Berikut adalah daftar dokumen yang telah dimasukkan.<br />&nbsp;<br />
      <table width="61%" border="0" cellpadding="0" cellspacing="0">
        <tr>
           	  <td width="37%" valign="top" style="font-size: 10pt; padding: 5px;"><div align="center"><strong>Deskripsi</strong></div></td>
              <td width="49%" valign="top" style="font-size: 10pt; padding: 5px;"><div align="center"><strong>Tanggal/Waktu</strong></div></td>
              <td width="14%" valign="top" style="font-size: 10pt; padding: 5px;">&nbsp;</td>
          </tr>
        {section name=uploaded_files loop=$files}
         {strip}
          <tr style="background-color: {cycle values="#eeeeee,#dddddd"};">
           	  <td width="37%" valign="top" style="font-size: 10pt; padding: 5px;">{$files[uploaded_files].description}</td>
              <td width="49%" valign="top" style="font-size: 10pt; padding: 5px;"><div align="center">{$files[uploaded_files].file_upload_date}</div></td>
              <td width="14%" valign="top" style="font-size: 10pt; padding: 5px;">
              	<form name="delForm" action="index.php?mod=vendor&step=3&user_id={$user_id}&session={$session_id}" method="post">
					<input type="hidden" name="file_id" value="{$files[uploaded_files].file_id}" />
					<input type="hidden" name="act" value="del" />
					<input type="submit" value="HAPUS?" class="textField" />
				</form>
              </td>
          </tr>
          {/strip}
      {/section}
      </table>
        </p>
  </div>
</div>
{include file="footer.tpl"}