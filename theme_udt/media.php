<?php

/**
 * Name: media
 *
 * Purpose:
 * UDT to include media inside responsive iframe.
 *
 * Params:
 * @param string $id - id of the media / link
 * @param string $container optional - default: container-media
 *
 * - For both parameter:
 * (only [a..zA..Z0..9-_] characters are allowed)
 *
 * Howto:
 * {media id='8Q5BqakTy9U'}
 * {media id='8Q5BqakTy9U' container='my-media-container'}
 *
 * @todo currently this udt only supports youtube in the future
 * a type parameter may be added, so it is possible to switch between
 * different media channels
 *
 * Reference:
 * https://developers.google.com/youtube/player_parameters
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# params
###############################################################################

if (preg_match("/^[a-zA-Z0-9_-]+$/", $params['id']) == 1) {
  $id = $params['id'];
} else {
  return false;
}

if ( isset($params['container']) ) {
	$container = preg_replace('/([^a-zA-Z0-9_-])/', '', $params['assign']);
} else {
  $container = 'container-media';
}

###############################################################################
# program
###############################################################################

$html = <<<HTML
<div class="$container">
  <iframe src="//www.youtube-nocookie.com/embed/$id?rel=0" frameborder="0" allowfullscreen></iframe>
</div>
HTML;

print $html;

return;

#
# EOF
#
?>
