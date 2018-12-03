{* facebook metadata *}
{* https://developers.facebook.com/docs/sharing/webmasters#markup *}
{* https://developers.facebook.com/tools/debug/ *}
  <meta property="og:title" content="{title}">
{if isset($canonical_real_global)}
  <meta property="og:url" content="{$canonical_real_global}">
{elseif isset($content_obj)}
  <meta property="og:url" content="{$content_obj->GetURL()}">
{/if}
  <meta property="og:site_name" content="{$sitename}">
{if isset($og_type)}
  <meta property="og:type" content="{$og_type}">
{else}
  <meta property="og:type" content="website">
{/if}
{*
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
  <meta property="og:image:alt" content="{$og_image_alt}">
{else}
  <meta property="og:image" content="{$theme_absolute_url}/images/og_image.png">
  <meta property="og:image:width" content="280">
  <meta property="og:image:height" content="280">
  <meta property="og:image:alt" content="{$sitename} logo">
{/if}
{if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() != ''}
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
  <meta name="twitter:site" content="@twittername">
  <meta name="twitter:title" content="{title}">
{if isset($twitter_image) && $twitter_image != ''}
  <meta name="twitter:image" content="{$twitter_image}">
{else}
  <meta name="twitter:image" content="{$theme_absolute_url}/images/twitter_summary_image.png">
{/if}
{if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() != ''}
  <meta name="twitter:description" content="{$content_obj->TitleAttribute()|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}">
{else}
  {* do not re-use title *}
{/if}
{* /twitter metadata *}

{* Google Plus *}
<link href="https://plus.google.com/116890025813489569543" rel="publisher">