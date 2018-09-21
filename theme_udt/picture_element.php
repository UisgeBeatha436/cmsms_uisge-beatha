<?php

/**
 * Name: picture_element
 *
 * Purpose:
 * The picture element is a markup pattern that allows developers to
 * declare multiple sources for an image. By using media queries, it gives
 * developers control as to when and if those images are presented to the user.
 *
 * This UDT generates the markup and does the scaling with CGSmartImage
 *
 * Preparation:
 * - Be sure to have CGSmartImage installed
 * - Prepare a generic template that outputs the picture html code
 *   .... see templates/generic_picture_element.tpl as example
 * - In $breakpoints_cfg specify the breakpoints you want to target
 * - Find out the width of your image based on screensize
 * ... (for every breakpoint in the cfg) list one image width
 * - Call the UDT
 * - Probally you have to adjust your CSS a bit: picture, img { width: 100%; max-width: 100%; }
 * - If you want to target older browsers be sure to have loaded picture.js
 *   in the head of your page: https://github.com/scottjehl/picturefill
 *
 * Parameters
 * @param string $src required [/uploads/images/example.jpg]- image source relative to the root_url
 * @param string $breakpoints optional [at-xxl, at-max] - comma sperated list of breakpoints as specified in $breakpoints_cfg
 * @param string $scales required [1137, 1425] - comma seperated list with widths
 * @param string $alt optional [my alt text] - alt text if none is given the filename of the original image is used
 * @param string $tpl optional [cms_template:generic_picture_element] - name of the the template resource
 *
 * ! If you do not enter a breakpoint parameter all breakpoints in $breakpoints_cfg are used
 * ! The number of items in the breakpoints param should match the number of items in the scales param
 * ! If you not pass a $tpl parameter the data is given back in a variable: {$picture_element|@print_r}
 *
 * Example:
 *
 *  {picture_element
 *    quality=50
 *    loop=1
 *    src=$in
 *    breakpoints='at-xxl,at-max'
 *    scales='1137, 1425'
 *    alt='This is my image'
 *  }
 *
 *  {picture_element
 *    src=$in
 *    scales='304, 305, 465, 705, 945, 1137, 1425'
 *  }
 *
 * Development:
 *
 * With this UDT you can not apply CGSmartImage filters yet.
 * The $breakpoints_cfg and template name are hardcoded
 * this might change overtime.
 * Source sets for retina images (x2) are not implemented yet
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = false;
$filter = false;

$dir =  $config['uploads_path'];
$pathinfo = pathinfo($dir);
$dir = str_replace($pathinfo['basename'], '', $dir);
$absolute_url = str_replace($pathinfo['basename'], '', $config['uploads_url']);

$smartimage = cms_utils::get_module('CGSmartImage');

if (! $smartimage) {
    return;
}

###############################################################################
# configuration
###############################################################################

$breakpoints_cfg = array(
  'at-xs'   => '(max-width: 19.9em)',
  'at-s'    => '(min-width: 20em and (max-width: 29.9em)',
  'at-m'    => '(min-width: 30em) and (max-wdith: 44.9em)',
  'at-l'    => '(min-width: 45em) and (max-width: 59.9em)',
  'at-xl'   => '(min-width: 60em) and (max-width: 71.9em)',
  'at-xxl'  => '(min-width: 72em)',
  'at-max'  => '',
);

$filters_cfg = array(
  'at-xs'   => '255,0,0',
  'at-s'    => '0,255,0',
  'at-m'    => '0,0,255',
  'at-l'    => '0,255,255',
  'at-xl'   => '255,0,255',
  'at-xxl'  => '255,255,0',
  'at-max'  => '33,33,33',
);

###############################################################################
# params
###############################################################################

if ( isset($params['quality']) ) {
  if (in_array($params['quality'], range(0, 100), true)) {
    $quality = $params['quality'];
  } else {
    $quality = 75;
  }
} else {
  $quality = 75;
}

if (isset($params['loop']) && is_numeric($params['loop']) ) {
	$loop = $params['loop'];
} else {
	$loop = false;
}

$src = isset($params['src']) ? ltrim($params['src'], '/') : '';

if ( !empty($params['breakpoints']) ) {
  $breakpoints = preg_replace("/[^a-z,-]/", "", $params['breakpoints']);
  $breakpoints = trim(preg_replace('/[\s+]/', "", $breakpoints));
  $breakpoints = preg_split("/,/", $breakpoints);
} else {
  $breakpoints = array_keys($breakpoints_cfg);
}

if ( !empty($params['scales']) ) {
  $scales = preg_replace("/[^0-9,]/", "", $params['scales']);
  $scales = trim(preg_replace('/[\s+]/', "", $scales));
  $scales = preg_split("/,/", $scales);
} else {
  $scales = array();
}

if ( count($scales) != count($breakpoints) ) {
  if ($debug) {
    print "number of breakpoints and scales do not match up\n";
  }
}

$alt = isset($params['alt']) ? $params['alt'] : '';

if ($debug) {
  print "<pre>\n";
  print_r($breakpoints);
  print_r($scales);
  print_r($alt);
  print "</pre>\n";
}

###############################################################################
# program
###############################################################################

$params_in = array();
$params_in['quality'] = $quality;
$params_in['loop'] = $loop;
$params_in['src'] = $src;
$params_in['noembed'] = '1';
$params_in['notag'] = '1';
$params_in['norotate'] = '1';
$params_in['force_ext'] = '1';
$params_in['noresponsive'] = '1';

if ($alt != '') {
  $params_in['alt'] = $alt;
} else {
  $pathinfo = pathinfo($src);
  $params_in['alt'] = $pathinfo['filename'];
}

$output = array();

if ( count($scales) == count($breakpoints) ) {
  foreach($scales as $k => $width) {
    $params_in['width'] = $width;

    if ($filter) {
      $params_in['filter_colorize'] = $filters_cfg[$breakpoints[$k]];
    }

    $img = cgsi_utils::process_image($params_in);
    $img['breakpoint'] = $breakpoints[$k];
    $img['media'] = $breakpoints_cfg[$img['breakpoint']];
    $img['params'] = $params_in;
    $img['src'] = $src;
    $output[] = $img;
  }
} else {
  $output[] = $params_in;
}

if ($debug) {
  print "<pre>\n";
  print_r($params_in);
  print_r($output);
  print "</pre>\n";
}

###############################################################################
# display
###############################################################################


if ( isset($params['tpl']) ) {
  $resource = trim($params['tpl']);

  if ($debug) {
    print "<pre>\n";
    print "recoure:$resource\n";
    print "</pre>\n";
  }

  $tpl_ob = $smarty->CreateTemplate($resource,null,null);
  $tpl_ob->assign('picture_element', $output);
  $tpl_ob->display();
} else {
  $smarty->assign('picture_element', $output);
  return;
}

return;

#
# EOF
#
?>