<?php

/**
* Name: config
*
* Purpose:
* output the config_path to Smarty
* - On the front-end it will be something like: assets/configs/
* - On the back-end it will be something like: admin/configs/
*
* How to:
* {$config_file="{config_path}/theme.ini"}
* {config_load file=$config_file scope='global'}
*
*/

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$config = cmsms()->getConfig();

###############################################################################
# program
###############################################################################

$request_uri = $_SERVER['REQUEST_URI'];
$admin_dir = cmsms()->config['admin_dir'];

if (strpos($request_uri, $admin_dir) !== false) {
  $config_path = cmsms()->config['root_path'].'/'. $admin_dir. '/configs';
} else {
  $config_path = cmsms()->config['assets_path']. '/configs';
}

print $config_path;

#
# EOF
#
?>