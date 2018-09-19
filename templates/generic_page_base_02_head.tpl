{* <!-- parsed: 3 of 3 --> *}
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  {metadata showbase='true'}

  {if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() != ''}
    <meta name="description" content="{$content_obj->TitleAttribute()|strip_tags:false|strip|truncate:300:'':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}">
  {/if}

  {$_full_title = "{title} - {sitename}"}
  <title>{$_full_title|cms_escape:htmlall|truncate:80}</title>

  {if isset($canonical_global)}
    {$canonical_real_global = $canonical_global scope='global'}
  {elseif isset($content_obj)}
    {$canonical_real_global = $content_obj->GetURL() scope='global'}
  {/if}

  <link rel="canonical" href="{$canonical_real_global}">

  {include file="{#theme_resource#}generic_page_favicons.tpl"}

  {if isset($images_all_global) && $images_all_global|@count >=1}
    {include file="{#theme_resource#}generic_page_social_images.tpl"}
  {/if}

  {include file="{#theme_resource#}generic_page_social_metadata.tpl"}

  {if isset($page_js_header) && $page_js_header != ''}
    {$page_js_header}
  {/if}

  {block name='js_header'}
    {include file="{#theme_resource#}generic_js_google_tag_manager.tpl"}
    {include file="{#theme_resource#}generic_js_header.tpl"}
  {/block}

  {nocache}
    {*cms_stylesheet*}
  {/nocache}
  {* remove $_unique_css_id when not developing, otherwise the css file won't be cached *}
  {assign var=_unique_css_id value=10|mt_rand:3000000}
  <link rel="stylesheet" href="{$theme_relative_url}/css/main.css?fes{$_unique_css_id}">

  {* 03sep18: added on Arnoud's advice * }
  13sept18: added via @import
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
*}
  
</head>
{* <!-- /parsed: 3 of 3 --> *}