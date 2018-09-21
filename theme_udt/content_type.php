<?php

/**
 * Name: content_type
 *
 * Purpose:
 * UDT to set the content type of a cmsms page to
 * the type you want eg. txt or xml
 *
 * Howto:
 * {content_type type='text/plain'}
 * {content_type type='text/xml'}
 *
 */

if(!is_object(cmsms())) exit;

###############################################################################
# params
###############################################################################

$content_type = get_parameter_value($params,'type');

###############################################################################
# program
###############################################################################

if ($content_type != '') {
  cmsms()->set_content_type($content_type);
}

return;

#
# EOF
#
?>