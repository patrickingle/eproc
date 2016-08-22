<?php /* Smarty version 2.6.18, created on 2008-05-30 15:32:38
         compiled from eproc-js.tpl */ ?>
<?php echo '
<script type="text/JavaScript">

  window.onload = function()
  {
    settings = {
      tl: { radius: 10 },
      tr: { radius: 10 },
      bl: { radius: 10 },
      br: { radius: 10 },
      antiAlias: true,
      autoPad: false
    }

    var divObj = document.getElementById("leftSidebar");

    var cornersObj = new curvyCorners(settings, divObj);
    cornersObj.applyCornersToAll();
  }

</script>
'; ?>