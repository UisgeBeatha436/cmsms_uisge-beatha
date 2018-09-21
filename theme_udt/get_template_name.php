<?php

/**
 * Name: get_template_name
 *
 * Purpose:
 * UDT to get the $template_name from a $page_id
 *
 * Params:
 * @param int $page_id - Content Manager -> page_id / content_id
 * @param string $assign optional - default: get_template_name
 * - name of the Smarty variable to assign the variable to
 * (only lower case [a..z] names are allowed in this param)
 *
 * Howto:
 * {get_template_name page_id=$content_id}
 * {$get_template_name}
 * {get_template_name page_id=$content_id assign='my_get_template_name'}
 * {$my_get_template_name}
 *
 * Inspired by: Robert Hunt
 * http://www.i-do-this.com/blog/94/Getting-the-Template-Name
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# globals
###############################################################################

$contentops = cmsms()->GetContentOperations();

###############################################################################
# params
###############################################################################

$page_id = !empty($params['page_id']) ? (int) $params['page_id'] : null;

if ( isset($params['assign']) ) {
	$assign = preg_replace('/([^a-z_])/', '', $params['assign']);
} else {
  $assign = 'get_template_name';
}

###############################################################################
# program
###############################################################################

$template_name = null;

if ($page_id) {
  $contentobj = $contentops->LoadContentFromId($page_id,true);
  $template_id = $contentobj->TemplateId();
  $tpl = CmsLayoutTemplate::load($template_id);

  if ($tpl) {
    $template_name = $tpl->get_name();
  }
}

if ($assign) {
  $smarty->assign($assign, $template_name);
}

#
# EOF
#
?>