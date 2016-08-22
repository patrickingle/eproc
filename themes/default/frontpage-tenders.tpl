						<!--<div class="dc l" style="width:240px">
							<div style="margin:8px 15px 0px 0px;">
							<img src="{$templateDir}/images/spacer.gif" width="1" height="14" alt="" /><br />
							<p><span style="font-size: 11pt; font-weight: bold;">Current Tenders</span></p>
							<img src="{$templateDir}/images/spacer.gif" width="1" height="13" alt="" /><br />
							<img src="{$templateDir}/images/blt1.jpg" align="top" alt="" /><span style="font:normal 10px Tahoma, Arial; color:#5486a9">February 12, 2007</span><br />
							<img src="{$templateDir}/images/spacer.gif" width="1" height="4" alt="" /><br />
							<b><a href="#">Pengadaan Pipa Kalimantan</a></b><br />
Phasellus porta. Fuscius mi magnparturient. montes, nascur ridic mus. Nulla dui. Fusce feugiat mesuada oi nunc odio, gravida.<br />
							<img src="{$templateDir}/images/spacer.gif" width="1" height="12" alt="" /><br />
							<div align="right">		
								<a href="#" class="rdmr">All tenders</a>
							</div>
							</div>
						</div>-->
						<div class="dc" style="width: 90%">
							<div style="margin:8px 0px 0px 16px;">
								<img src="{$templateDir}/images/spacer.gif" width="1" height="13" alt="" /><br />
                                <p><span style="font-size: 11pt; font-weight: bold;">Tender Winners</span></p>
								<ul>
									{if $tenders[0].pdf_filename != ''}
									{section name=te loop=$tenders}
									<li><a href="uploads/frontpage/{$tenders[te].pdf_filename}">Pengadaan Pipa Sulawesi</a><br />{$tenders[te].pdf_desc}</li>
									{/section}
									{else}
									<li>Belum Ada</li>
									{/if}
								</ul>
								<img src="{$templateDir}/images/spacer.gif" width="1" height="17" alt="" /><br />
								<!--<div align="right">		
									<a href="" class="rdmr">All tender winners</a>
								</div>-->
							</div>
						</div>