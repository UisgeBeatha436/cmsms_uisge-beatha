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
 * Parameters:
 * @param string $src required [/uploads/images/example.jpg]- image source relative to the root_url
 * @param string $breakpoints optional [at-xxl, at-max] - comma sperated list of breakpoints as specified in $breakpoints_cfg
 * @param string $scales required [1137, 1425] - comma seperated list with widths
 * @param string $title optional [my title] : ('') - title text: <img title="my title"> || <caption>my title</caption>
 * @param string $style optional [float:left;] : ('') - inline style: <img style="float:left;">
 * @param string $class optional [my_class] : ('') - css class: <img class="my_class">
 * @param string $alt optional [my alt] - alt text: <img alt="my alt"> - if none is given the filename of the original image is used
 * @param string $custom_01 optional [custom_01] : ('') - custom parameter to be used inside template
 * @param string $custom_02 optional [custom_02] : ('') - custom parameter to be used inside template
 * @param string $custom_03 optional [custom_03] : ('') - custom parameter to be used inside template
 * @param string $tpl optional [cms_template:generic_picture_element] - name of the the template resource
 * @param string $assign optional - default: picture_element - name of the Smarty variable to assign the variable to (only lower case [a..z_] names are allowed in this param)
 *
 * ! If you do not enter a breakpoint parameter all breakpoints in $breakpoints_cfg are used
 * ! The number of items in the breakpoints param should match the number of items in the scales param
 * ! If you not pass a $tpl parameter the data is given back in a variable:
 *   {$picture_element|@print_r} || {$my_picture_element|@print_r}
 * ! Parameters passed to this UDT are available inside the template as: {$params_in|@print_r} / {$params_in.style}
 * ! If you pass a $tpl parameter and a $assign parameter the assign values are only available in the template you are calling.
 *
 * Example:
 *
 *  {picture_element
 *    quality=50
 *    loop=1
 *    src=$in
 *    breakpoints='at-xxl,at-max'
 *    scales='1137, 1425'
 *    title='A wonderful title'
 *    style='float: left;'
 *    class='my_class'
 *    custom_01='x'
 *    custom_02='y'
 *    custom_03='z'
 *    alt='This is my image'
 *    tpl='cms_template:generic_picture_element'
 *  }
 *
 *  {picture_element
 *    src=$in
 *    scales='304, 305, 465, 705, 945, 1137, 1425'
 *  }
 *
 *  {picture_element
 *    src=$in
 *    scales='304, 305, 465, 705, 945, 1137, 1425'
 *    assign='my_picture_element'
 *  }
 *
 *
 * Development:
 *
 * With this UDT you can not apply CGSmartImage filters yet.
 * The $breakpoints_cfg are hardcoded this might change overtime.
 * Source sets for retina images (x2) are not implemented yet
 *
 *
 * Current foto-udt:
 * {foto file="Gallery/Winter1819/Klapschroef/Klapschroef-01.jpg" title="Old one" side="right" width="150"}
 * default folder to start from is ./uploads/images
 */
// if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = false;
$filter = false;

$dir =  $config['uploads_path'];
if ($debug) {
  echo 'Dir = ' . $dir . "\n";
}
$pathinfo = pathinfo($dir);
$dir = str_replace($pathinfo['basename'], '', $dir); // basename is the filename of the image
$absolute_url = str_replace($pathinfo['basename'], '', $config['uploads_url']);
$smartimage = cms_utils::get_module('CGSmartImage');

if (! $smartimage) {
    return;
}

# Globals custom
#
// $images_folder = 'images';
// $src = isset($params['file']) ? $params['file'] : isset($params['src']) ? $params['src'] : '';

###############################################################################
# configuration
###############################################################################

$breakpoints_cfg = array(
  'xs'   => '(max-width: 575px)',
  'sm'   => '(min-width: 576px) and (max-width: 767px)',
  'md'   => '(min-width: 768px) and (max-width: 991px)',
  'lg'   => '(min-width: 992px) and (max-width: 1199px)',
  'xl'   => 'min-width: 1200px'
);

$scales='200, 195, 190, 188, 220';
// $scales_cfg = array(
//   '150'   =>  '150',
//   '222'   =>  '222',
//   '116'   =>  '116',
//   '124'   =>  '124',
//   '200'  =>  '200',
// );

$filters_cfg = array(
  'xs'  => '255,0,0',
  'sm'   => '0,255,0',
  'md'   => '0,0,255',
  'lg'   => '255,255,0',
  'xl'   => '255,0,255',
);

$resource = 'cms_template:generic_picture_element_foto';

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

# check if Gallery is the start of the file path
// if ( isset($params['file']) ) {
// 	if ( substr($params['file'],7) == 'Gallery') { // find if 'Gallery' is a start for the folder
// 		$src = $images_folder . '/' . $src;
//   }
// }

$src = isset($params['file']) ? $config['uploads_url'] . '/images/' . $params['file'] : '';
// $src = isset($params['src']) ? ltrim($params['src'], '/') : '';
if ($debug) {
	print "SRC folder: " . $src . "\n";
}


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
} else if ( isset($scales)) {
  // $scales = array_keys($scales_cfg);
  $scales = preg_replace("/[^0-9,]/", "", $scales);
  $scales = trim(preg_replace('/[\s+]/', "", $scales));
  $scales = preg_split("/,/", $scales);
}
  else {
  $scales = array();
}

if ( count($scales) != count($breakpoints) ) {
  if ($debug) {
    print "number of breakpoints and scales do not match up\n";
  }
}

$title = isset($params['title']) ? $params['title'] : '';
$style = isset($params['style']) ? $params['style'] : '';
$class = isset($params['class']) ? $params['class'] : 'lozad img-fluid';
if ( isset($params['side'])) {
  if ($debug) {
    echo 'Side: ' . $params['side'] . "\n";
  }
  if ($params['side'] == 'right') {
    $class = $class . ' ' . 'float-right ml-2';
  } else {
    $class = $class . ' ' .'float-left mr-2';
  }
}
$custom_01 = isset($params['custom_01']) ? $params['custom_01'] : 'off';
$custom_02 = isset($params['custom_02']) ? $params['custom_02'] : '';
$custom_03 = isset($params['custom_03']) ? $params['custom_03'] : '';
// $alt = isset($params['alt']) ? $params['alt'] : '';
// condition to add to $alt = isset($params['alt']) ? $params['alt'].', '."Uisge Beatha, Zeilen, Watersport" : "Uisge Beatha, Zeilen, Watersport";
$alt = isset($params['title']) ? $params['title'].', '."Uisge Beatha, Zeilen, Watersport" : "Uisge Beatha, Zeilen, Watersport";


if ( !empty($params['assign']) ) {
  $assign = preg_replace("/[^a-z_]/", "", $params['assign']);
} else {
  $assign = 'picture_element';
}

if ($debug) {
  print "<pre>\n";
  print "dir:\n";
  print_r($dir);
  print "\n";
  print "absolute_url:\n";
  print_r($absolute_url);
  print "\n";
  print "breakpoints:\n";
  print_r($breakpoints);
  print "scales:\n";
  print_r($scales);
  print "alt:\n";
  print_r($alt);
  print "\n";
  print "assign:";
  print_r($assign);
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

$params_in['side'] = $side;
$params_in['title'] = $title;
$params_in['style'] = $style;
$params_in['class'] = $class;
$params_in['custom_01'] = $custom_01;
$params_in['custom_02'] = $custom_02;
$params_in['custom_03'] = $custom_03;

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
  print "params_in:\n";
  print_r($params_in);
  print "output[0] \n";
  print_r($output[0]);
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
  $tpl_ob->assign('params_in', $params_in);
  $tpl_ob->assign($assign, $output);
  $tpl_ob->display();

} else if ( isset($resource)) {
  if ($debug) {
    print "<pre>\n";
    print "recoure: $resource\n";
    print "</pre>\n";
  }

  $tpl_ob = $smarty->CreateTemplate($resource,null,null);
  $tpl_ob->assign('params_in', $params_in);
  $tpl_ob->assign($assign, $output);
  $tpl_ob->display();

} else {
  $smarty->assign('params_in', $params_in);
  $smarty->assign($assign, $output);
}

return;

#
# EOF
#
?>