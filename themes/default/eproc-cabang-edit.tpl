{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
{literal}
<script language="javascript">
	function hapus() {
		if(confirm('Apakah anda yakin ingin menghapus cabang ini?')) {
			id = document.getElementById('nearest_branch').value;
			top.location.href = 'index.php?mod=eproc&act=cabang&del_id=' + id;
		}
	}
</script>
{/literal}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_GET.addSuccess == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	SUKSES DITAMBAHKAN
        </span>
    </p>
    {/if}
	{if $_GET.delSuccess == 1}
    <p style="font-size: 11pt; color: #df0000; margin-top: 17px;" align="center">
    	<span style="padding: 5px; border: 1px red solid; width: 100px; font-weight: bold;">
        	SUKSES DIHAPUS
        </span>
    </p>
    {/if}
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Cabang Pertagas</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
		Gunakan Editor dibawah ini untuk melakukan perubahan Cabang.
	</p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Tambah Cabang</strong>
	</p>
	<p style="margin-top: 10px; font-size: 11pt">
  		<form name="addCabang" method="post" action="index.php?mod=eproc&act=cabang">
			<p>Nama Cabang:</p>
			<p><input type="text" name="description" value="" class="btn" /></p>
			<p>&nbsp;</p>
			<p>Kode Cabang:</p>
			<p><input type="text" name="ep_code" value="" class="btn" /></p>
			<p>&nbsp;</p>
			<p>Kota:</p>
			<p><input type="text" name="city" value="" class="btn" /></p>
			<p>&nbsp;</p>
			<p><input type="submit" name="submitAddCabang" value=" TAMBAHKAN " /></p>
		</form>
    </p>
	<p style="margin-top: 17px; font-size: 11pt; color: #df0000;">
    	<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Hapus Cabang</strong>
	</p>
    <p style="margin-top: 10px; font-size: 11pt">
  		<select name="nearest_branch" id="nearest_branch" class="btn">
			<option value="0">Silahkan Pilih..</option>
			{foreach from=$branch key=branch_id item=branch_desc}
			<option value="{$branch_id}"{if $branch_id == $user.nearest_branch} selected{/if}>{$branch_desc}</option>
			{/foreach}
		</select> <input type="button" value=" HAPUS " onclick="hapus();" />
    </p>
	<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}