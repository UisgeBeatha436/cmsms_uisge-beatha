<?php

/**
 * Name: youtube
 *
 * Purpose:
 * UDT to include youtube video and responsive markup.
 * 
 * Howto: 
 * {youtube id='8Q5BqakTy9U'}
 * 
 * 14aug18: The origin from Uisge Beatha uses 
 *    {youtube_movie id="jpHAqPgByks" title="Zeilend van Breskens naar Oostende"}
 * meaning the title-parameter is needed too
 * 
 * 
 * The provided youtube id may only contain numbers and alphabetical characters
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# params
###############################################################################

if(preg_match("/^[a-zA-Z0-9]+$/", $params['id']) == 1) {
  $id = $params['id'];
} else {
  return false;
}

if($params[title] == "") {
  $title = "Youtube video from Uisge Beatha";
} else {
  $title = $params['title'];
}

/* 14aug18: Origin youtube_movie from Uisge Beatha:
* echo '<![if !IE]>a href=\"$url\" class="floatbox" data-fb-options="width:445 height:364 addVideoThumb:small">YouTube Player</a><![endif]>';
* echo '<!--[if IE]><object class="youtube" width="445" height="364" data="'.$url.'"><![endif]-->';
* echo '<param name="movie" value="'.$url.'"  />';
* echo '<param name="wmode" value="transparent" />';
* echo '<param name="allowFullScreen" value="true" />';
* echo '<param name="allowscriptaccess" value="always" />';
* echo '<!--[if IE]>
*      <embed src="'.$url.'"  type="application/x-shockwave-flash" wmode="transparent" allowfullscreen="true" allowscriptaccess="always" width="445" height="364"></embed>
*      / * <a href=\"$url\" class="floatbox" data-fb-options="width:445 height:364 addVideoThumb:192">YouTube Player</a> * /
*      <![endif]-->';
* echo '</object>';
*
*
*/
###############################################################################
# program
###############################################################################

$html = <<<HTML
<div class="container-video">
  <iframe src="http://www.youtube-nocookie.com/embed/$id?rel=0&hd=1" frameborder="0" allowfullscreen></iframe>
</div>
HTML;


print $html;

return;

#
# EOF
#
?>