<?php

/**
* Name: lipsum
*
* Purpose:
*
* Generate Lorem ipsum via a CMSMS UDT
* This code is a wrapper around a Lorem ipsum PHP generator you can find on:
* https://github.com/joshtronic/php-loremipsum
*
* Copyright:
* The PHP lorem ipsum generator is written by
* Josh Sherman (https://crowdsync.io)
* open sourced under a MIT License
*
* Prerequisite:
* This UDT is dependent on php-loremipsum do a
* ~ composer install before running code
*
* Howto:
* You can find extensive documentation on the php-loremipsum github page
*
* Required parameters:
*  $out: what do you like to output -
*  [word || words || sentence || sentences || paragraph || paragraphs] (string)
*  [line || lines are an alias for sentence || sentences]
*
* Optional parameters:
* $nr: number of times the output will occure  (number) without quotes
* ! when you are using: word || sentence || paragraph the default is 1
* @param string $html: html tag to wrap output in (string)
* @param string $assign optional - default: ''
* - name of the Smarty variable to assign the variable to
* (only lower case [a..z_] names are allowed in this param)
*
* ! If no 'assign' parameter is given data printed directly

* CMSMS examples:
*
* - Output directly:
* {lipsum out='words' nr=2 html='p'}
* -> <p>word1<p> <p>word2</p>
* {lipsum out='words' nr=2 html='p, i'}
* -> <p><i>word1</i></p> <p><i>word2</i></p>
* {lipsum out='sentences' nr=10}
* -> 10 sentences.....
* {lipsum out='words' nr=5 html='<li><a href="$1">$1</a></li>'}
* -> 5 words wrapped in li and a tags

* - Assign to variable (list):
* {lipsum out='paragraphs' nr=2 assign='mylipsum'}
* {$mylipsum|@print_r}
*
*/

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = 0;

require __DIR__ . '/vendor/autoload.php';
$lipsum = new joshtronic\LoremIpsum();

$_out = array (
  'word', 'words',
  'sentence', 'sentences',
  'line', 'lines',
  'paragraph', 'paragraphs',
);

###############################################################################
# params
###############################################################################

if ( !empty($params['out']) ) {
  $out = preg_replace("/[^a-z]/", "", $params['out']);
}

$out = trim(preg_replace('/[\s+]/', "", $out));

if (! in_array($out, $_out)) {
  return;
}

if ( !empty($params['nr']) ) {
  $nr = preg_replace("/[^0-9]/", "", $params['nr']);
  if ($nr == '') {
    $nr = 1;
  }
} else {
  $nr = 1;
}

if ( !empty($params['html']) ) {
  $html = $params['html'];

  if (strpos($html, ',') !== false ) {
    $html = trim(preg_replace('/[\s+]/', "", $html));
    $html = preg_split("/,/", $html);
  }

} else {
  $html = '';
}

if ( !empty($params['assign']) ) {
  $assign = preg_replace("/[^a-z_]/", "", $params['assign']);
} else {
  $assign;
}

$list = array();

###############################################################################
# program
###############################################################################

switch ($out) {
  case 'word':
    print $lipsum->word($html);
    break;
  case 'words':
    if (isset($assign)) {
      $list = $lipsum->wordsArray($nr, $html);
    } else {
      print $lipsum->words($nr, $html);
    }
    break;
    case 'sentence':
    print $lipsum->sentence($html);
    break;
  case "sentences":
    if (isset($assign)) {
      $list = $lipsum->sentencesArray($nr, $html);
    } else {
      print $lipsum->sentences($nr, $html);
    }
    break;
  case 'line':
    print $lipsum->sentence($html);
    break;
  case "lines":
    if (isset($assign)) {
      $list = $lipsum->sentencesArray($nr, $html);
    } else {
      print $lipsum->sentences($nr, $html);
    }
    break;
  case "paragraph":
    print $lipsum->paragraph($html);
    break;
  case "paragraphs":
    if (isset($assign)) {
      $list = $lipsum->paragraphsArray($nr, $html);
    } else {
      print $lipsum->paragraphs($nr, $html);
    }
    break;
  default:
    return;
}

if (count($list)) {
  $smarty->assign($assign, $list);
}

return;

#
# EOF
#
?>