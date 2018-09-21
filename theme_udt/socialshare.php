<?php

/**
 * Name: socialshare
 *
 * Purpose:
 * UDT to generate "socialshare" / "socialmedia" buttons to share CMSMS url's
 *
 * Parameters:
 *
 * @param string $tpl optional [cms_template:socialshare]
 * - name of the the template resource
 * @param string $title required [CMSMS contact page]
 * - title of the url to share
 * @param string $url required [http://my.com/contact/]
 * - url to share
 * @param string $imageurl optional [http://my.com/images/logo.gif]
 * - imageurl to share
 * @param string $description optional [A page with a contact form]
 * - description of the content
 * @param string $brands optional [twitter,facebook]
 * - comma seperated list of brands to generate data for
 * @param string $assign optional - default: socialshare
 * - name of the Smarty variable to assign the variable to
 * (only lower case [a..z_] names are allowed in this param)
 *
 * - $imageurl + $description are only used for a pinterest socialshare button
 * - When you do not specify $brands data for brands available in
 *   this UDT are generated
 * - Provide the $brands parameter to change the order or brand names you like
 *   to generate data for
 * - If no 'assign' parameter is given data is assigned to
 *   {$socialshare|print_r}
 *
 * Howto:
 *
 * {capture assign=socialshare_title}{$entry->title}{/capture}
 * {capture assign=socialshare_url}{root_url}/blog/{$entry->id}/{/capture}
 * {capture assign=socialshare_description}{$entry->summary}/{/capture}
 * {capture assign=socialshare_imageurl}
 *  {root_url}/[% example_directory %]/[% example_filename %].[jpg|gif|png]
 * {/capture}
 *
 * {socialshare title=$socialshare_title url=$socialshare_url imageurl=$socialshare_imageurl description=$socialshare_description}
 * {socialshare title='' url='' imageurl=''
 *  description='' brands='twitter, facebook'}
 * {socialshare title='' url='' imageurl=''
 *  description='' brands='twitter, facebook'
 *  tpl='cms_template:socialshare' assign='mysocialshare'}
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$debug = 0;

$options = array (
  'twitter'   => 'https://twitter.com/home?status=[%title%]%3A+[%url%]',
  'pinterest' => 'https://pinterest.com/pin/create/button/?url=[%url%]%26media=[%imageurl%]%26description=[%description%]',
  'facebook'  => 'https://www.facebook.com/share.php?u=[%url%]%26t=[%title%]',
  'linkedin'  => 'https://www.linkedin.com/shareArticle?mini=true&url=[%url%]',
  'google'    => 'https://plus.google.com/share?url=[%url%]',
  'whatsapp'  => 'whatsapp://send?text=[%title%]%20[%url%]',
  'email'     => 'mailto:?subject=[%title %]%26body=[%title%]%3A[%url%]',
  'print'     => 'javascript:window.print();',
);

$brands = 'twitter, pinterest, facebook, linkedin, google, whatsapp, email, print';
$title = '';
$url = '';
$imageurl = '';
$description = '';
$tpl = '';

###############################################################################
# params
###############################################################################

if ( !empty($params['brands']) ) {
  $brands = preg_replace("/[^a-z,]/", "", $params['brands']);
}

$brands = trim(preg_replace('/[\s+]/', "", $brands));
$brands = preg_split("/,/", $brands);

if ( !empty($params['title']) ) {
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
  return false;
}

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z_])/', '', $params['assign']);
} else {
  $assign = 'socialshare';
}

if ($debug) {
  print "<pre>\n";
  print "brands:\n";
  print_r($brands);
  print "title:$title\n";
  print "url:$url\n";
  print "imageurl:$imageurl\n";
  print "description:$description\n";
  print "assign:$assign\n";
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
    $out[$onerow->brand] = $onerow;
    if ($debug) {
      print_r($onerow);
    }
  }

}

if ( isset($params['tpl']) ) {
  $resource = trim($params['tpl']);

  if ($debug) {
    print "recoure:$resource\n";
  }

  $tpl_ob = $smarty->CreateTemplate($resource,null,null);
  $tpl_ob->assign($assign, $out);
  $tpl_ob->display();
} else {
  $smarty->assign($assign, $out);
}

if ($debug) {
  print "</pre>\n";
}

return;

#
# EOF
#
?>