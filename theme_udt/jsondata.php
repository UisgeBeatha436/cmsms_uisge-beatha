<?php

/**
 * Name: jsondata
 *
 * Purpose:
 * Read a json file and assign data to a Smarty variable
 *
 * Parameters:
 * @param string $file required
 * - [json/filename.json] relative to
 * 'themes/THEME_NAME/json' directory
 * @param string $assign optional
 * - default: jsondata - name of the Smarty variable to
 * assign variable to (only lower case [a..z] names are allowed in this param)
 *
 * ! If no 'assign' parameter is given data is assigned to {$jsondata|print_r}
 *
 * Howto:
 *
 * Example:
 *
 * {svgdata file='json/filename.json'}
 * {$jsondata|@print_r}
 * {svgdata file='json/filename.json' assign='myjsondata'}
 * {$my_jsondata|@print_r}
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

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z_])/', '', $params['assign']);
} else {
  $assign = 'jsondata';
}

$file = preg_replace("/[^a-z0-9.\/]+/i", "", $params['file']);
$fileinfo = pathinfo($file);

if ($fileinfo['extension'] != 'json') {
  return;
}

// resource config
$assets_path = cmsms()->config['assets_path'];
$config_file = $assets_path. '/configs'. '/theme.ini';

if (!file_exists($config_file)) {
  return;
}

$smarty->configLoad($config_file);
$activeTheme = $smarty->getConfigVars('activeTheme');
$smarty->configLoad($config_file, $activeTheme);

$theme_base_path = $smarty->getConfigVars('theme_base_path');
$theme_full_path = cmsms()->config['assets_path']. $theme_base_path;
$json_file = $theme_full_path. $file;

if (!file_exists($json_file)) {
  return;
}

if ($debug) {
  print "<pre>\n";
  print "assign:|$assign|\n";
  print "file:$file\n";
  print "json_file:$json_file\n";
}

###############################################################################
# program
###############################################################################

$jsondata = file_get_contents($json_file);
$out = json_decode($jsondata, true);

if ($debug) {
  print "out:\n";
  print_r($out);
  print "</pre>\n";
}

$smarty->assign($assign, $out);

return;

#
# EOF
#
?>