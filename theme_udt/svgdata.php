<?php

/**
 * Name: svgdata
 *
 * Purpose:
 * Read out data from a svg image sprite (shape.svg) to
 * generate a new svg sprite with styles
 * There are 2 modes of operation outputting the svg data to a file or print inline
 *
 * Parameters:
 * @param string $tpl optional [cms_template:txt_svg]
 * - name of the the template resource
 * @param boolean $assetsbase optional - [0|1] default: 0
 * - use 'assets' directory instead of 'uploads' directory
 * @param boolean $inline optional [0|1] default: 0
 * - output print svg data for inline use
 * @param string $file required - [dst/svg/shape.svg] relative to
 * 'assets/dst' or 'uploads' directory
 * @param string $assign optional - default: svgdata
 * - name of the Smarty variable to assign the variable to
 * (only lower case [a..z] names are allowed in this param)
 *
 * ! If you not pass a $tpl parameter the data is given back in a variable:
 *   {$svgdata|@print_r}
 * ! Or the variable name specified in the assign parameter eg
 *   {$my_svgdata|@print_r}
 *
 * Howto:
 *
 * - Study the cmsms_builder README on svg sprites/shapes
 * - Know the differences and limitation between svg from an external file or
 *   used inline into a html document
 *
 * - Create a dst/svg/shapes.svg file (~ gulp svg)
 * - Create a blank cmsms page (template p_x_blank)
 *
 * == Either:
 * - Add the {svgdata} tag to the content field of the blank page just created
 * - Under the Content -> Pages [Navigation] tab add "svg.svg" under Page URL
 * - Under the Content -> Pages [Logic] tab, Smarty data add:
 *   {strip}{content_type type='image/svg+xml'}{/strip}
 * - Hit the "Submit" button
 * - Test: http://site.com/svg.svg (view source)
 *
 * == Or:
 * - Add the {svgdata inline=1} tag to the header of your template
 * - Test: http://site.com/ (view source)
 *
 * - Happy templating and styling....
 *
 * Example:
 *
 *  {svgdata assetsbase=1 file='svg/shape.svg' tpl='cms_template:txt_svg'}
 *  {svgdata assetsbase=1 file='svg/shape.svg' tpl='cms_template:txt_svg' inline='1'}
 *  {svgdata assetsbase=1 file='svg/shape.svg'}
 *  {$svgdata|@print_r}
 *  {svgdata assetsbase=1 file='svg/shape.svg' assign='my_svgdata'}
 *  {$mysvgdata|@print_r}
 *
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = 0;

###############################################################################
# params
###############################################################################

$file = preg_replace("/[^a-z0-9.\/]+/i", "", $params['file']);
$fileinfo = pathinfo($file);

if ($fileinfo['extension'] != 'svg') {
  return;
}

$assetsbase = isset($params['assetsbase']) ? $params['assetsbase'] : '0';
$dir =  $config['uploads_path'] . '/';
$absolute_url = $config['uploads_url'] . '/';
$relative_url = '/uploads/';

$inline = isset($params['inline']) ? $params['inline'] : '0';

// sanitize

if (filter_var($assetsbase, FILTER_VALIDATE_BOOLEAN) === true) {

	// resource config
	$assets_path = cmsms()->config['assets_path'];
	$config_file = $assets_path. '/configs'. '/theme.ini';

	if (!file_exists($config_file)) {
		return;
	}

	$smarty->configLoad($config_file);
	$activeTheme = $smarty->getConfigVars('activeTheme');
	$smarty->configLoad($config_file, $activeTheme);
  $assets_dst_path = 'assets'. $smarty->getConfigVars('theme_dst_path');

	$assetsbase = '1';
	$dir = str_replace('uploads', $assets_dst_path, $dir);
	$absolute_url = str_replace('uploads', $assets_dst_path, $absolute_url);
  $relative_url = '/'. $assets_dst_path;

} else {
	$assetsbase = '0';
}

$file_in = $dir . $file;

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z_])/', '', $params['assign']);
} else {
  $assign = 'svgdata';
}

if ($debug) {
  print "<pre>\n";
  print_r($fileinfo);
  print "assetsbase:$assetsbase\n";
  print "inline:$inline\n";
  print "assign:|$assign|\n";
  print "dir:$dir \n";
  print "absolute_url:$absolute_url\n";
  print "relative_url:$relative_url\n";
  print "file: ". $file . "\n";
  print "file_in:$file_in\n";
}

###############################################################################
# program
###############################################################################

$dom = new DOMDocument;
$dom->load($file_in);

if ($debug) {
  print $dom->saveXML();
}

$xpath = new DOMXPath($dom);
$ids = $xpath->query('//*/@id');

if ($debug) {
  print "\n";
}

if ($debug) {
  print "** ids **:\n";
  foreach ($ids as $k => $v) {
    print "$v->nodeName : $v->nodeValue \n";
  }
}

$out = array();

foreach ($dom->getElementsByTagName('symbol') as $node) {
  if ($debug) {
    var_dump(htmlspecialchars($dom->saveHTML($node)));
  }

  $subdom = new DomDocument;
  $subdom->loadXML($dom->saveHTML($node));
  $subxpath = new DOMXPath($subdom);
  $lists = $subxpath->query('//@*');

  $svgdata = new stdClass();

  foreach ($lists as $list) {
    $k = $list->nodeName;
    $v = $list->nodeValue;
    $svgdata->$k = $v;
  }

  $viewBoxList = explode(' ', $svgdata->viewBox);
  $svgdata->x = isset($viewBoxList[0]) ? $viewBoxList[0] : '';
  $svgdata->y = isset($viewBoxList[1]) ? $viewBoxList[1] : '';
  $svgdata->w = isset($viewBoxList[2]) ? $viewBoxList[2] : '';
  $svgdata->h = isset($viewBoxList[3]) ? $viewBoxList[3] : '';

  if ($debug) {
    print "svgdata->id:\n";
    print $svgdata->id. "\n";
    print_r($svgdata);
  }

  $out[$svgdata->id] = $svgdata;
}

if ($debug) {
  print "out:\n";
  print_r($out);
  print "</pre>\n";
}

if ( isset($params['tpl']) ) {
  $resource = trim($params['tpl']);

  if ($debug) {
    print "<pre>\n";
    print "recoure:$resource\n";
    print "</pre>\n";
  }

  $tpl_ob = $smarty->CreateTemplate($resource,null,null);
  $tpl_ob->assign('inline', $inline);
  $tpl_ob->assign($assign, $out);
  $tpl_ob->display();
} else {
  $smarty->assign($assign, $out);
}

return;


/*
// do not specify functions inside an UDT
function getSvgData($node, $dom) {

  $subdom = new DomDocument;
  $subdom->loadXML($dom->saveHTML($node));
  $subxpath = new DOMXPath($subdom);
  $lists = $subxpath->query('//@*');

  $svgdata = new stdClass();

  foreach ($lists as $list) {
    $k = $list->nodeName;
    $v = $list->nodeValue;
    $svgdata->$k = $v;
  }

  return $svgdata;

}

function getMarkupFromNode($node) {
  $domsub = new DOMDocument();
  $domsub->appendChild($domsub->importNode($node, true));
  return $markup = $domsub->saveHTML();
}

function getTags($tag, $dom) {
  $tags = array();
  $nodes = $dom->getElementsByTagName($tag);

  for ($c = 0; $c < $nodes->length; $c++) {
    $tags[$i] = $nodes->item($c);
    var_dump(htmlspecialchars($dom->saveHTML($nodes->item($c))));
  }

  return $tags;
}
*/


#
# EOF
#
?>