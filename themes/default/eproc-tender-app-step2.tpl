{include file="header.tpl"}
{include file="eproc-conditional.tpl"}
{if $_userLevel == 1}
<div id="wide" style="float: left; margin-left: 20px; width: 950px; font-size: 10pt;">
	{if $_eNoneSelected == 1}
    <p align="center" style="font-size: 11pt; color: #df0000; margin-top: 17px;">
    	<span style="border: 1px red solid; padding: 10px;"><strong>MOHON PILIH VENDOR YANG DIKEHENDAKI</strong></span>
    </p>
    {/if}
	<p style="font-size: 11pt; color: #df0000; margin-top: 17px;">
        <img src="{$templateDir}/images/blt1.jpg" align="top" alt="" />
        <strong>Tender Approval - Appointing Vendor</strong>
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	Mohon pilih vendor-vendor mana yang dapat mengikuti TENDER ini. Gunakan list dibawah ini untuk memilih vendor dan tekan tombol PILIH untuk memilih. Nama-nama vendor diurutkan berdasarkan abjad.
    </p>
    <p style="margin-top: 10px; font-size: 11pt">
    	<form name="vendorFrm" action="{$PHP_SELF}" method="post">
        <input type="hidden" name="tender_id" value="{$tender_id}" />
    	<select name="vendor_list[]" size="10" multiple class="textBox" style="width: 250px; font-size: 10pt;">
            {section name=vendor loop=$vendors}
            <option value="{$vendors[vendor].user_id}">
                {$vendors[vendor].vendor_name} - {$vendors[vendor].vendor_state}
      </option>
            {/section}
        </select> <br /><input type="submit" name="vendorBtn" value=" PILIH " />
        </form>
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p>
</div>
{/if}
{include file="footer.tpl"}