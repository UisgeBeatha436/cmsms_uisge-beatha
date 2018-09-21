<?php

/**
 * Name: sociallinks
 *
 * Purpose:
 * UDT to include markup for sociallinks.
 *
 * Howto:
 *
 * {capture assign=sociallinks_title}{$entry->title}{/capture}
 * {capture assign=sociallinks_url}{root_url}/blog/{$entry->id}/{/capture}
 * {capture assign=sociallinks_description}{$entry->summary}/{/capture}
 * {capture assign=sociallinks_imageurl}{root_url}/[% example_directory %]/[% example_filename %].[jpg|gif|png]{/capture}
 *
 *
 *  // All brands are displayed or provide the brands you like to display
 * {sociallinks title=$sociallinks_title url=$sociallinks_url imageurl=$sociallinks_imageurl description=$sociallinks_description}
 * {socialbookmarker title='' url='' imageurl='' description='' brands='twitter, facebook'}
 *
 *
 * Required parameters:
 * title : title of bookmark (string)
 * url : url of bookmark (string)
 *
 * Optional parameters: (pinterest)
 * imageurl: url of the image to ping
 * description: content description
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$options = array (
  'twitter'   => 'http://twitter.com/home?status=[%title%]%3A+[%url%]',
  'pinterest' => 'http://pinterest.com/pin/create/button/?url=[%url%]%26media=[%imageurl%]%26description=[%description%]',
  'facebook'  => 'http://www.facebook.com/share.php?u=[%url%]%26t=[%title%]',
  'linkedin'  => 'http://www.linkedin.com/shareArticle?mini=true&url=[%url%]',
  'google'    => 'https://plus.google.com/share?url=[%url%]'
);

$brands = 'twitter, pinterest, facebook, linkedin';
$title = '';
$url = '';
$imageurl = '';
$description = '';

###############################################################################
# params
###############################################################################

if ( !empty($params['brands']) ) {
  // echo "brands ".$params['brands'];
  $brands = preg_replace("/[^a-z,]/", "", $params['brands']);
}

$brands = trim(preg_replace('/[\s+]/', "", $brands));
$brands = preg_split("/,/", $brands);

if ( !empty($params['title']) ) {
  // echo "title ".$params['title'];
  $title = preg_replace("/[^a-zA-Z0-9,\s*:]/", "", $params['title']);
}

$title = preg_replace('/[^a-zA-Z0-9,\s,-,:]/', "", $title);
$title = trim(preg_replace('/[\s+]{2,}/', " ", $title));

if ( !empty($params['url']) ) {
  $url = $params['url'];
}

$url = filter_var($url, FILTER_SANITIZE_URL);

if ( !empty($params['imageurl']) ) {
  $imageurl = $params['imageurl'];
}

$imageurl = filter_var($imageurl, FILTER_SANITIZE_URL);

if ( !empty($params['description']) ) {
  $description = $params['description'];
}

$description = filter_var($description, FILTER_SANITIZE_STRING);

if ( empty($title) || empty($url) || empty($brands[0]) ) {
  $smarty->assign('sociallinks', 'error');
  return false;
}


###############################################################################
# program
###############################################################################

$out = array();

foreach ($brands as $brandskey => $brandsvalue) {
  $destinationurl = $options[$brandsvalue];

  $matches = array();
  preg_match_all('/\[\%(\w+)\%\]/', $options[$brandsvalue], $matches);
  $slice = array_slice($matches[1], 0);

  $onerow = new stdClass();

  foreach ($slice as $key => $value) {
    $encoded_value = urlencode(cms_htmlentities($$value));
    $destinationurl = str_replace('[%'.$value.'%]', $encoded_value, $destinationurl);
  }

  $onerow->brand          = $brandsvalue;
  $onerow->title          = $title;
  $onerow->url            = $url;
  $onerow->imageurl       = $imageurl;
  $onerow->description    = $description;
  $onerow->destinationurl = $destinationurl;

  if (! empty($destinationurl) ) {
    $out[] = $onerow;
  }

}

$smarty->assign('sociallinks', $out);
return;

#
# EOF
#
?>