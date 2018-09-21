<?php

/**
* Name: read_assets_dir
*
* Purpose:
* UDT to read out files from a CMSMS uploads or assets directory
* uses the 'get_matching_files' function which can be found in
* $cmsm_root/lib/misc_functions.php
*
* Configuration:
* @param string $dir  optional - default '/uploads';
* specify directory relative to relative to 'assets/dst' or 'uploads' directory
* @param string $extensions required - [gif,jpg,png]
* - comma seperated list of extensions to read
* (only lowercase extensions are allowed in this param)
* @param string $fileprefix optional - 'thumb'
* - works in relation with the $excludefiles parameter
*    either get all files with the prefix thumb or exclude files with prefix thumb
* @param boolean $excludefiles optional - [0|1] default: 0 - to exclude files or not
* @param boolean $assetsbase optional - [0|1] default: 0
* - use 'assets' directory instead of 'uploads' directory
* @param string $sort_type optional
* - [asc|desc] default : asc - sort ascending or descending
* @param string $assign optional - default: read_assets_dir
* - name of the Smarty variable to assign the variable
* to (only lower case [a..z] names are allowed in this param)
*
* Output:
* filename, basename, extension, absolute_url,
* relative_url, absolute_full_url, relative_full_url
*
* Example:
* @example {read_assets_dir dir='images/test/' extensions='gif,jpg'}
* {$read_assets_dir|@print_r}
* @example {read_assets_dir dir='images/test/'
* 					extensions='gif,jpg' fileprefix='thumb'
* 					excludefiles='0' sort_type='desc' assign='uploads'}
* {$uploads|@print_r}
* @example {read_assets_dir dir='images/test/'
* 					extensions='gif,jpg' fileprefix='thumb'
* 					excludefiles='1' sort_type='desc' assign='uploads'}
* {$uploads|@print_r}
* @example {read_assets_dir assetsbase='1'
* 					dir='templates/' extensions='tpl'
* 					assign='templates'}
* {$templates|@print_r}
*
* {if isset($read_assets_dir)}
*  {foreach from=$read_assets_dir item='asset' name='loop'}
*    <img src="{$read_assets_dir->relative_full_url}"
*			alt="{$read_assets_dir->filename}" width="25%"><br>
*  {/foreach}
* {/if}
*
*/

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = 0;
$config = cmsms()->GetConfig();
$output = array();

###############################################################################
# params
###############################################################################

// defaults

$extensions = '';
$fileprefix = '';
$sort_type = 'asc';
$assetsbase = isset($params['assetsbase']) ? $params['assetsbase'] : '0';
$excludefiles = isset($params['excludefiles']) ? $params['excludefiles'] : '0';
$sort_type = isset($params['sort_type']) ? $params['sort_type'] : 'asc';
$dir =  $config['uploads_path'] . '/';
$absolute_url = $config['uploads_url'] . '/';
$relative_url = '/uploads/';

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

if ( isset($params['extensions']) ) {
	$extensions = preg_replace('/([^a-z,])/', '', $params['extensions']);
}

if ( isset($params['fileprefix']) ) {
	$fileprefix = preg_replace('/([^a-zA-Z])/', '', $params['fileprefix']);
}

if (filter_var($excludefiles, FILTER_VALIDATE_BOOLEAN) === true) {
	$excludefiles = '1';
} else {
	$excludefiles = '0';
}

$sort_type = strtolower($sort_type) == 'asc' ? 'asc' : 'desc';

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z])/', '', $params['assign']);
} else {
	$assign = 'read_assets_dir';
}

###############################################################################
# program
###############################################################################

if ($debug == 1) {
	print "<pre>\n";
	print "assign:$assign\n";
	print "assetsbase:$assetsbase\n";
	print "dir:$dir\n";
	print "absolute_url:$absolute_url\n";
	print "relative_url:$relative_url\n";
	print "extensions:$extensions\n";
	print "fileprefix:$fileprefix\n";
	print "excludefiles:$excludefiles\n";
	print "</pre>";
}

$matching_files = get_matching_files(
		$dir, $extensions, true, true, $fileprefix, $excludefiles
	);

if (! is_array($matching_files)) {
	return;
}

if ($sort_type == 'asc') {
	array_multisort($matching_files, SORT_ASC);
} else {
	array_multisort($matching_files, SORT_DESC);
}

if ($debug == 1) {
	print "<pre>\n";
	print "sort_type: $sort_type\n";
	print "matching_files:\n";
	print_r($matching_files);
	print "</pre>\n";
}

$ouput = array();

foreach ($matching_files as $k) {
	$onerow = new stdClass();
	$pathinfo = pathinfo($k);

	$onerow->basename = $pathinfo['basename'];
	$onerow->extension = $pathinfo['extension'];
	$onerow->filename = $pathinfo['filename'];
	$onerow->absolute_url = $absolute_url;
	$onerow->relative_url = $relative_url;
	$onerow->absolute_full_url = $absolute_url . $k;
	$onerow->relative_full_url = $relative_url . $k;

	$output[] = $onerow;
}

if ($debug == 1) {
	print "<pre>\n";
	print "output:\n";
	print_r($output);
	print "</pre>\n";
}

$smarty->assign($assign, $output);
return;

#
# EOF
#
?>