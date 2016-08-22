{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
{literal}
<script language="javascript">
	function editUser(id) {
		top.location.href='index.php?mod=eproc&act=eproc-user&user_id=' + id;
	}
	function delUser(id) {
		if(confirm('Apakah anda yakin ingin menghapus?')) {
			top.location.href='index.php?mod=eproc&act=del-user&user_id=' + id;
		}
	}
	function editvUser(id) {
		top.location.href='index.php?mod=eproc&act=vendor-edit&user_id=' + id;
	}
	function editdUser(id) {
		top.location.href='index.php?mod=eproc&act=div-edit&user_id=' + id;
	}
</script>
{/literal}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Users List - eProcurement Users</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Berikut dibawah ini adalah Daftar User eProcurement.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Username</td>
				<td valign="top" align="center">Last Login</td>
				<td valign="top" align="center">Admin</td>
                <td valign="top" align="center"></td>
				<td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$eusers}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$eusers[ua].user_name}</td>
				<td valign="top" align="center">{$eusers[ua].lastlogin|date_format:"%d %b %y"}</td>
				<td valign="top" align="center">{if $eusers[ua].admin == 1}YA{/if}</td>
                <td valign="top" align="center">
					<input type="button" value=" EDIT " onclick="editUser({$eusers[ua].user_id})" name="editBtn" />
				</td>
				<td valign="top" align="center">
					<input type="button" value=" DELETE " onclick="delUser({$eusers[ua].user_id})" name="editBtn" />
				</td>
            </tr>
            {/section}
        </table>
    </p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Users List - Division Users</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Berikut dibawah ini adalah Daftar User Division.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Username</td>
				<td valign="top" align="center">Last Login</td>
                <td valign="top" align="center"></td>
				<td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$dusers}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$dusers[ua].user_name}</td>
				<td valign="top" align="center">{$dusers[ua].lastlogin|date_format:"%d %b %y"}</td>
                <td valign="top" align="center">
					<input type="button" value=" EDIT " onclick="editdUser({$dusers[ua].user_id})" name="editBtn" />
				</td>
				<td valign="top" align="center">
					<input type="button" value=" DELETE " onclick="delUser({$dusers[ua].user_id})" name="editBtn" />
				</td>
            </tr>
            {/section}
        </table>
    </p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Vendor List</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
		Berikut dibawah ini adalah Daftar Vendor.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<table border="0" cellpadding="0" cellspacing="0" width="50%" class="rfqTable">
        	<tr bgcolor="#777">
            	<td valign="top" align="center">No.</td>
                <td valign="top" align="center">Vendor</td>
                <td valign="top" align="center"></td>
				<td valign="top" align="center"></td>
            </tr>
            {section name=ua loop=$vusers}
            <tr bgcolor="#ddd">
            	<td valign="top" align="center">{$smarty.section.ua.index+1}</td>
                <td valign="top" align="center">{$vusers[ua].vendor_name}</td>
                <td valign="top" align="center">
					<input type="button" value=" EDIT " onclick="editvUser({$vusers[ua].user_id})" name="editBtn" />
				</td>
				<td valign="top" align="center">
					<input type="button" value=" DELETE " onclick="delUser({$vusers[ua].user_id})" name="editBtn" />
				</td>
            </tr>
            {/section}
        </table>
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}