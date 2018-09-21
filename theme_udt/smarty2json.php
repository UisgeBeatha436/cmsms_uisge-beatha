<?php

/**
* Name: smarty2json
*
* Purpose:
* Turn smarty data into a JavaScript Object Notation (JSON)
* Handy if you like to use CMSMS module data inside
* JavaScript or as json configuration
*
* Parameters:
* @param string $data required - [smarty (object,array,string)]
* @param string $assign optional - default: ['smarty2json']
* - name of the Smarty variable to assign the variable to
* (only lower case [a..z] names are allowed in this param)
* @param boolean $pretty optional [0|1] default: 0 - pretty print output
*
* ! If no 'assign' parameter is given data is assigned to
* {$smarty2json|print_r}
*
* Howto:
*
* {$data = ['foo' => 'bar', 'sub' => [1, 2, 3]]}
* {smarty2json data=$data}
* {$smarty2json|print_r}
*
* {smarty2json data=$data assign='my_smarty2json' pretty=1}
* {$my_smarty2json|print_r}
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
  $assign = 'smarty2json';
}

if ( isset($params['data']) ) {
	$data = $params['data'];
} else {
  if ($debug) {
    print "no data assigned to smarty2json UDT \n";
  }
  return;
}

$pretty = preg_match('/^[0-1]*$/', $params['pretty']) ?
          $params['pretty'] : 0;

if ($debug) {
  print "<pre>\n";
  print "assign:|$assign|\n";
  print "data:\n";
  print_r($data);
  print "pretty:\n";
  print "$pretty\n";
  print "</pre>\n";
}

###############################################################################
# program
###############################################################################

if ($pretty == 1) {
  $out = json_encode($data, JSON_PRETTY_PRINT);
} else {
  $out = json_encode($data);
}

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