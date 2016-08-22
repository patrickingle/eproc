{literal}
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
{/literal}