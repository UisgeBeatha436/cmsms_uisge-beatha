<?php

/**
* Name: css_get_contents
*
* Purpose:
* UDT to get contents of a '.css' file stored inside
* the '/assets/dst/' or 'uploads' directory;
* Only use this UDT for development environments
* For production sites you can better store stylesheets inside:
*  ..... Layout -> Design Manager [Styleheets] section
*
* Configuration:
* @param string $dir optional - default ['/uploads']
*	- specify directory relative to relative to 'assets/dst' or 'uploads'
* @param string $file required - ['style.css']
* - default: '' - specify the .css file
* @param boolean $assetsbase optional - [0|1] default: 0
* - use 'assets' directory instead of 'uploads' directory
* @param string $assign optional - default: ''
* - name of the Smarty variable to assign the variable to
*   (only lower case [a..z] names are allowed in this param)
*
* ! If no 'assign' parameter is assigned the file content is printed to stdout
*
* Stick this UDT inside an Design Manager exported .css file
* (webroot/assets/css/style.css)
* This way {cms_stylesheet} can display the output.
*
* Example:
*
* {css_get_contents file='main.css'}
* // uploads/main.css
* {css_get_contents dir='css/' file='main.css' assign='style'}
* // uploads/css/main.css {$style|@print_r}
* {css_get_contents assetsbase=1 file='main.css'}
* // assets/dst/main.css
* {css_get_contents assetsbase=1 dir='css/' file='main.css' assign='style'}
* // assets/dst/css/main.css {$style|@print_r}
*
*/

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = 1;
$config = cmsms()->GetConfig();
$output = array();

###############################################################################
# params
###############################################################################

// defaults

$file = '';

$sort_type = 'asc';
$assetsbase = isset($params['assetsbase']) ? $params['assetsbase'] : '0';

$sort_type = isset($params['sort_type']) ? $params['sort_type'] : 'asc';
$dir =  $config['uploads_path'] . '/';
$absolute_url = $config['uploads_url'] . '/';
$relative_url = '/uploads/';

// sanitize

$file = isset($params['file']) ? $params['file'] : "";
$file_parts = pathinfo($file);

$extension = $file_parts['extension'];
$filename = preg_replace('/[^a-z\d-_]/i', '', $file_parts['filename']);

if ($extension != 'css' or ! strlen($filename)) {
  return;
} else {
  $cssfile = $filename. '.'. $extension;
}


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
	$theme_base_path = 'assets'. $smarty->getConfigVars('theme_dst_path');

	$assetsbase = '1';
	$dir = str_replace('uploads', $theme_base_path, $dir);
	$absolute_url = str_replace('uploads', $theme_base_path, $absolute_url);
	$relative_url = '/'. $theme_base_path. '/';
} else {
	$assetsbase = '0';
}

if (isset($params['dir'])) {
	$_dir = preg_replace('/([^a-z\/])/', '', $params['dir']);
	$_absolute_url = $absolute_url . $_dir;
	$_relative_url = $relative_url . $_dir;

	if (filter_var($_absolute_url, FILTER_VALIDATE_URL)) {
		$absolute_url = $_absolute_url;
		$relative_url = $_relative_url;
		$dir = $dir. $_dir;
	}
}

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z])/', '', $params['assign']);
} else {
	$assign = '';
}

$css_dir_file = $dir.$cssfile;

###############################################################################
# program
###############################################################################

if ($debug == 0) {
  print "<pre>\n";
  print "file: $file\n";
  print "cssfile: $cssfile \n";
	print "assign:$assign\n";
	print "assetsbase:$assetsbase\n";
  print "dir:$dir\n";
  print "css_dir_file: $css_dir_file \n";
	print "absolute_url:$absolute_url\n";
	print "relative_url:$relative_url\n";
	print "</pre>";
}

if (file_exists($css_dir_file)) {
  $output = "/* $cssfile */\n";
  $output .= file_get_contents($css_dir_file, false);

  if ($assign != '') {
    $smarty->assign($assign, $output);
  } else {
    print "$output \n";
  }

} else {
  print "/* $cssfile does not exists */\n";
}


return;


#
# EOF
#
?>