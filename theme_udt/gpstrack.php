<?php
// {gpstrack name="Logboek_22okt2010"}
// <a href="/content/instructions.html" class="floatbox" data-fb-options="width:650 showNewWindow:true showPrint:true enableDragResize:true">Floatbox Instructions</a> 

// echo("<div class=\"floatbox_$side floatbox\" data-fb-options=\"group:cgblog-1\">\n");
//
// example:
// <a id="pid-{$image->fileid}" class="albumnav" href="{$imagefileurl}" title="{$imagetitlename}" rel="gallery-{$galleryid}" data-fb-options="caption:#TweetGallery-{$image->fileid}" ><img src="{$imagethumburl}" alt="{$imagetitlename}" /></a>
//
// data-fb-options=\"group:cgblog-1\"
//
// echo("<a href=\"$image\" title=\"$title\">\n");
// echo("<img src=\"$small_image\" alt=\"$title\" title=\"$title\"></img><br />\n");
// echo("</a>\n");
// echo("<span class=\"cgblog_image_c2e\">(klik voor grote foto)</span>\n");
// echo("</div>\n");

// $small_size = 150;
// echo '<iframe src="uploads/Documenten/GPS-Tracks/'.$params[name].'.html" width="600" height="400" marginwidth="0" marginheight="0" scrolling="yes" frameborder="0">';
// echo'  <a href="uploads/Documenten/GPS-Tracks/'.$params[name].'.html">Klik hier voor de grote kaart</a>';
// echo '</iframe>';

$html = <<<HTML
<div class="floatbox" data-fb-options="width:650 height:400 showNewWindow:true showPrint:true enableDragResize:true">
<a href="./uploads/Documenten/GPS-Tracks/$params[name].html">Klik hier voor de gevaren track</a>
</div>
HTML;

print $html;

return;
#
# EOF
#
?>