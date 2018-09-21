<?php

/**
 * Name: parse_query_string
 *
 * Purpose:
 * UDT to get variables from a query_string (url)
 *
 * Params:
 * @param string $query_string - query_string (url) to get variables from
 * @param string $assign optional
 * - default: parse_query_string
 * - name of the Smarty variable to assign the variable to
 * (only lower case [a..z] names are allowed in this param)
 *
 * - If no 'assign' parameter is given data is assigned
 * to {$get_html_attributes|print_r}
 *
 * Howto:
 * {$query_string = 'index.php?a=1&b=2'}
 * {parse_query_string query_string=$query_string}
 * {$parse_query_string|@print_r}
 * {$parse_query_string['obj']|@print_r}
 * {$parse_query_string['list']|@print_r}
 *
 * {parse_query_string query_string=$query_string assign='my_parse_query_string'}
 * {$my_parse_query_string|@print_r}
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

$query_string = isset($params['query_string']) ? $params['query_string'] : "";

if ( isset($params['assign']) ) {
  $assign = preg_replace('/([^a-z_])/', '', $params['assign']);
} else {
  $assign = 'parse_query_string';
}

###############################################################################
# program
###############################################################################

if ($debug) {
  print "<pre>\n";
  print "PARSE_QUERY_STRING:\n";
  print "query_string:|$query_string|\n";
  print "assign:|$assign|\n";
}

$parts = parse_url($query_string);
parse_str($parts['query'], $query);


$_query_obj = new stdClass();
$_query_list = [];
foreach($query as $key => $value) {
  $_key = preg_replace('/^amp;/', '', $key);
  $_query_obj->{$_key} = $value;
  $_query_list[$_key] = $value;
}

$parts['obj'] = $_query_obj;
$parts['list'] = $_query_list;

if ($debug) {
  print "parts:\n";
  print_r($parts);
  print "</pre>\n";
}

$smarty->assign($assign, $parts);

return;

#
# EOF
#
?>