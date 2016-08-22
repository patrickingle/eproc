<?php /* Smarty version 2.6.18, created on 2008-05-30 15:32:34
         compiled from frontpage-tenders.tpl */ ?>
						<!--<div class="dc l" style="width:240px">
							<div style="margin:8px 15px 0px 0px;">
							<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="14" alt="" /><br />
							<p><span style="font-size: 11pt; font-weight: bold;">Current Tenders</span></p>
							<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="13" alt="" /><br />
							<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/blt1.jpg" align="top" alt="" /><span style="font:normal 10px Tahoma, Arial; color:#5486a9">February 12, 2007</span><br />
							<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="4" alt="" /><br />
							<b><a href="#">Pengadaan Pipa Kalimantan</a></b><br />
Phasellus porta. Fuscius mi magnparturient. montes, nascur ridic mus. Nulla dui. Fusce feugiat mesuada oi nunc odio, gravida.<br />
							<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="12" alt="" /><br />
							<div align="right">		
								<a href="#" class="rdmr">All tenders</a>
							</div>
							</div>
						</div>-->
						<div class="dc" style="width: 90%">
							<div style="margin:8px 0px 0px 16px;">
								<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="13" alt="" /><br />
                                <p><span style="font-size: 11pt; font-weight: bold;">Tender Winners</span></p>
								<ul>
									<?php if ($this->_tpl_vars['tenders'][0]['pdf_filename'] != ''): ?>
									<?php unset($this->_sections['te']);
$this->_sections['te']['name'] = 'te';
$this->_sections['te']['loop'] = is_array($_loop=$this->_tpl_vars['tenders']) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['te']['show'] = true;
$this->_sections['te']['max'] = $this->_sections['te']['loop'];
$this->_sections['te']['step'] = 1;
$this->_sections['te']['start'] = $this->_sections['te']['step'] > 0 ? 0 : $this->_sections['te']['loop']-1;
if ($this->_sections['te']['show']) {
    $this->_sections['te']['total'] = $this->_sections['te']['loop'];
    if ($this->_sections['te']['total'] == 0)
        $this->_sections['te']['show'] = false;
} else
    $this->_sections['te']['total'] = 0;
if ($this->_sections['te']['show']):

            for ($this->_sections['te']['index'] = $this->_sections['te']['start'], $this->_sections['te']['iteration'] = 1;
                 $this->_sections['te']['iteration'] <= $this->_sections['te']['total'];
                 $this->_sections['te']['index'] += $this->_sections['te']['step'], $this->_sections['te']['iteration']++):
$this->_sections['te']['rownum'] = $this->_sections['te']['iteration'];
$this->_sections['te']['index_prev'] = $this->_sections['te']['index'] - $this->_sections['te']['step'];
$this->_sections['te']['index_next'] = $this->_sections['te']['index'] + $this->_sections['te']['step'];
$this->_sections['te']['first']      = ($this->_sections['te']['iteration'] == 1);
$this->_sections['te']['last']       = ($this->_sections['te']['iteration'] == $this->_sections['te']['total']);
?>
									<li><a href="uploads/frontpage/<?php echo $this->_tpl_vars['tenders'][$this->_sections['te']['index']]['pdf_filename']; ?>
">Pengadaan Pipa Sulawesi</a><br /><?php echo $this->_tpl_vars['tenders'][$this->_sections['te']['index']]['pdf_desc']; ?>
</li>
									<?php endfor; endif; ?>
									<?php else: ?>
									<li>Belum Ada</li>
									<?php endif; ?>
								</ul>
								<img src="<?php echo $this->_tpl_vars['templateDir']; ?>
/images/spacer.gif" width="1" height="17" alt="" /><br />
								<!--<div align="right">		
									<a href="" class="rdmr">All tender winners</a>
								</div>-->
							</div>
						</div>