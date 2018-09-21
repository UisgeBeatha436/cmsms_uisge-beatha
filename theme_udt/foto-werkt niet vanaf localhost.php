<?php
/**
 * User Defined Tag named "foto"
 * {foto file='path/to/file.jpg'}
 * {foto file='path/to/file.jpg' height='' width='' alt='' title='' side=''}
 */

// +++++ Dependencies +++++
$cgcontentutils = cms_utils::get_module('CGContentUtils');
if ( !$cgcontentutils ) {
  echo 'ERROR: CGContentUtils module not installed';
  return FALSE;
}

$cgsmartimage = cms_utils::get_module('CGSmartImage');
if ( !$cgsmartimage ) {
  echo 'ERROR: CGSmartImage module not installed';
  return FALSE;
}

// +++++ Parameters +++++
$src = isset($params['file']) ? $params['file'] : '';
if ( empty($src) ) { 
  echo 'ERROR: Missing "file" parameter';
  return FALSE;
}

//if ( @!is_array( getimagesize($src) ) ) {
//  echo 'ERROR: Source file is not an image';  // 01may18: source is not recognized as a photo. Reason unknown
//  return FALSE;
// }

$path = 'uploads/images';
$src = $path . '/' . $src;
$src_no_spaces = str_replace(' ','%20',$src); // replace spaces in order to validate W3C href;
$fotofile = $params['file'];
$path_parts = pathinfo($fotofile);
$fotofile = str_replace(' ','_',$path_parts['filename']); // name of the photo from the file-parameter
$cgblog_id = isset($params['cgblog_id']) ? $params['cgblog_id'] : '436'; //random number, although can't get cgblogid in UDT

$side = isset($params['side']) ? $params['side'] : 'left';

$alt = isset($params['alt']) ? $params['alt'].', '."Uisge Beatha, Zeilen, Watersport" : "Uisge Beatha, Zeilen, Watersport";
$title = isset($params['title']) ? $params['title'] : $fotofile;

$thumb_heigth = isset($params['heigth']) ? $params['heigth'] : '190';
$thumb_width = isset($params['width']) ? $params['width'] : '140';
$photo_height = '480'; // '640';
$photo_width = '640'; //'960';

$noembed = '0';
$noremote = '0';
$noresponsive = '1';

// +++++ Create Thumbnail +++++
$params = array();
$params['alt'] = $alt;
$params['height'] = $thumb_heigth;
$params['noembed'] = $noembed;
$params['noremote'] = $noremote;
$params['noresponsive'] = $noresponsive;
$params['notag'] = '0';
$params['src'] = $src;
$params['title'] = $title;
$params['width'] = $thumb_width;

$cgsi_utils = cgsi_utils::process_image($params);
$thumb = $cgsi_utils['output'];

// +++++ Create Photo +++++
$params = array();
$params['alt'] = $alt;
$params['height'] = $photo_heigth;
$params['noembed'] = $noembed;
$params['noremote'] = $noremote;
$params['noresponsive'] = $noresponsive;
$params['notag'] = '1';
$params['src'] = $src;  // in case the file has no spaces, no $photo is created (seems empty)
$params['title'] = $title;
$params['width'] = $photo_width;

$cgsi_utils = cgsi_utils::process_image($params);
$photo = $cgsi_utils['output'];

// +++++ HTML Output +++++
// echo '<a href="' . $photo . '" class="fancybox">' . $thumb . '</a>';
$photo=str_replace(' ','%20',$photo); // data-fb-option ---> header:#socialmediashare1 
echo("<div id=\"$fotofile\" class=\"floatbox_$side floatbox\" data-fb-options=\"group:cgblog-$cgblog_id caption:$title type:image\">");
     echo("<a id=\"a_$fotofile\" data-rel=\"foto_blog\" class=\"floatbox\" href=\"$photo\"> $thumb</a>");
     if ($title) {
          echo("<span class=\"cgblog_image_title\">$title</span>");
     }
     echo("<span class=\"cgblog_image_c2e\">(klik voor grote foto)</span>");
echo("</div><p>");
?>