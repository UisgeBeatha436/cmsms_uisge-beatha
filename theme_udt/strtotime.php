<?php

/**
 * Name: strtotime
 *
 * Purpose:
 *
 * UDT to transform any datetime string into a Unix timestamp
 * See also: http://php.net/manual/en/function.strtotime.php
 * In CMSMS > 2.2 for security reasons
 * PHP functions are not available inside Smarty
 *
 * If you do not want to turn on:
 * $config['permissive_smarty'] = 1;
 * but need strtotime this functionality is for you.
 *
 * Howto:
 *
 * - Assign to variable:
 * {$unixts = "{strtotime str=$entry->modified_date}" }
 * {$unixts} -> ...
 *
 * - Output directly:
 * {strtotime str='2000-12-31 23:59:59'} -> 978303599
 *
 */

if(!is_object(cmsms())) exit;
$str = get_parameter_value($params,'str');

if ($str != '') {
  print strtotime($str);
}

return;

#
# EOF
#
?>