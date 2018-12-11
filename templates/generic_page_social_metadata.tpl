{if $page_description|count_words < '6'}
   {capture name='meta_description' assign='metadescription'}{$page_title} | {$page_description}{/capture}
{else}
   {assign var='metadescription' value=$page_description}
{/if}
{if isset($page_image)}
  {assign var=twitter_image value=$page_image}
  {assign var=og_image value=$page_image}
{/if}
{$imagesize = getimagesize($page_image)}
{assign var=og_image_height value={$imagesize[1]}}
{assign var=og_image_width value={$imagesize[0]}}

{* facebook metadata *}
{* https://developers.facebook.com/docs/sharing/webmasters#markup *}
{* https://developers.facebook.com/tools/debug/ *}
  <meta property="og:title" content="{$page_title}"> {* was title *}
{if isset($canonical_global)} {* was canonical_real_global *}
  <meta property="og:url" content="{$canonical_global}">
{elseif isset($content_obj)}
  <meta property="og:url" content="{$content_obj->GetURL()}">
{/if}
  <meta property="og:site_name" content="{$sitename}">
{if isset($og_type)}
  <meta property="og:type" content="{$og_type}">
{else}
  <meta property="og:type" content="website">
{/if}
  <meta property="fb:app_id" content="175931732519501">
  {* <meta property="fb:admins" content=""> 01dec18 still in use? *}
  <meta property="fb:pages" content="419992328194645">

{if isset($og_updated_time)}
  <meta property="og:updated_time" content="{$og_updated_time}">
{else}
  <meta property="og:updated_time" content="{modified_date format='%a, %d %b %Y %H:%M:%S %z'}">
{/if}

{if isset($og_postdate)}
  <meta property="" content="{$og_postdate}">
{/if}

{if isset($og_image) && $og_image != ''}
  <meta property="og:image" content="{$og_image}">
  <meta property="og:image:width" content="{$og_image_width}">
  <meta property="og:image:height" content="{$og_image_height}">
  <meta property="og:image:alt" content="{$page_title}"> {* og_image_alt*}
{else}
  <meta property="og:image" content="{$theme_absolute_url}/images/og_image.png">
  <meta property="og:image:width" content="280">
  <meta property="og:image:height" content="280">
  <meta property="og:image:alt" content="{$sitename} logo">
{/if}
{if isset($metadescription)}
  <meta property="og:description" content="{$metadescription}">
{elseif isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() != ''}
  <meta property="og:description" content="{$content_obj->TitleAttribute()|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}">
{else}
  <meta property="og:description" content="{title} - {$sitename}">
{/if}
{* /facebook metadata *}

{* twitter metadata *}
{* https://dev.twitter.com/cards/types *}
{* https://cards-dev.twitter.com/validator *}
{if isset($twitter_metadata)}
  {$twitter_metadata}
{else}
  <meta name="twitter:card" content="summary">
{/if}
  <meta name="twitter:site" content="@GJdeGraaf">
  <meta name="twitter:title" content="{$page_title}"> {*title*}
{if isset($twitter_image) && $twitter_image != ''}
  <meta name="twitter:image" content="{$page_image}"> {*twitter_image*}
{else}
  <meta name="twitter:image" content="{$theme_absolute_url}/images/twitter_summary_image.png">
{/if}
<meta name="twitter:description" content="{$metadescription}">
{*if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() != ''}
  <meta name="twitter:description" content="{$content_obj->TitleAttribute()|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}">
{else}
  { * do not re-use title * }
{/if*}
<meta name="twitter:description" content="{$metadescription|strip|truncate:200}">
<meta name="twitter:domain" content="{root_url}">
<meta name="twitter:url" content="{$canonical_global}">


{* /twitter metadata *}

{* Google Plus *}
<link href="https://plus.google.com/116890025813489569543" rel="publisher">