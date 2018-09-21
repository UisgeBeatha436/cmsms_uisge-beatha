<?php

/**
 * Name: get_html_attributes
 *
 * Purpose:
 * UDT to get attributes from a html tag.
 *
 * Params:
 * @param string $html - html string to get attibutes from
 * @param string $assign optional - default: get_html_attributes
 * - name of the Smarty variable to assign the variable to
 * (only lower case [a..z] names are allowed in this param)
 *
 * - If no 'assign' parameter is given data is assigned to
 * {$get_html_attributes|print_r}
 *
 * Howto:
 * {$tag = '<a href="http://cmsms.org">link</a>'}
 * {get_html_attributes html=$tag}
 * {$html_attributes->href} -> http://cmsms.org
 *
 * {get_html_attributes html=$tag assign='my_get_html_attributes'}
 * {$my_html_attributes->href} -> http://cmsms.org
 *
 * All attributes are stored in the $attributes stdClass()
 * For alt attributes the extension is stripped out
 *
 * Dependencies:
 * This UDT needs DOMDocument and DOMXPath
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

$html = isset($params['html']) ? $params['html'] : "";

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z_])/', '', $params['assign']);
} else {
  $assign = 'get_html_attributes';
}

if ($debug) {
  print "<pre>\n";
  print "html:\n";
  var_dump(htmlspecialchars($html));
  print "<textarea>|$html|</textarea>\n";
  print "assign:$assign\n";
}

###############################################################################
# program
###############################################################################

$dom = new DOMDocument;
$dom->loadHTML($html);
$xpath = new DOMXPath($dom);
$nodes = $xpath->query('//@*');

if ($debug) {
    print "nodes:\n";
    print_r($nodes);
}

$attributes = new stdClass();

foreach ($nodes as $node) {
    $k = $node->nodeName;

    if ($k == 'alt') {
      $node->nodeValue = preg_replace('/\\.[^.\\s]{3,4}$/', '',
        $node->nodeValue);
    }

    $attributes->$k = $node->nodeValue;
}

if ($debug) {
  print "attributes:\n";
  print_r($attributes);
  print "</pre>\n";
}

$smarty->assign($assign, $attributes);

return;

#
# EOF
#
?>