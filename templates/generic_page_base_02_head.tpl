{* <!-- parsed: 3 of 3 --> *}
<head>
  <!-- Amazon S3 -->
  <link rel="dns-prefetch" href="//s3.amazonaws.com">
  <!-- Google CDN -->
  <link rel="dns-prefetch" href="//ajax.googleapis.com">
  <!-- Microsoft CDN -->
  <link rel="dns-prefetch" href="//ajax.microsoft.com">
  <link rel="dns-prefetch" href="//ajax.aspnetcdn.com">
  <!-- CDN JS -->
  <link rel="dns-prefetch" href="//cdnjs.cloudflare.com">
  <!-- Bootstrap CDN -->
  <link rel="dns-prefetch" href="//netdna.bootstrapcdn.com">
  <!-- Google Tag Manager -->
  <link rel="dns-prefetch" href="//www.googletagmanager.com">
  <!-- Google Analytics -->
  <link rel="dns-prefetch" href="//www.google-analytics.com">
  <!-- Google Fonts -->
  <link rel="dns-prefetch" href="//fonts.googleapis.com">
  <!-- Facebook -->
  <link rel="dns-prefetch" href="//connect.facebook.net">
  <!-- Google+ -->
  <link rel="dns-prefetch" href="//apis.google.com">
  <!-- Linkedin -->
  <link rel="dns-prefetch" href="//platform.linkedin.com">
  <!-- Twitter -->
  <link rel="dns-prefetch" href="//platform.twitter.com">
  <meta name="copyright" content="Copyright © Gregor de Graaf, All Rights Reserved">
  <meta name="google-site-verification" content="ZELEPW5SSIsv1PqdZrX91yXfEsjCNmJEHG50F7vVri4" />
  {* 23may18 Verificatie Daisycon *}
  <meta name="baf0efcf61df286" content="3453aede4510b730471f07b6ca7bd7c2" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  {metadata showbase='true'}
  {if $smarty.server.SERVER_NAME|lower eq {$environment}}
    <meta name="robots" content="index,follow">
  {else}
    <meta name="robots" content="noindex,nofollow">
  {/if}
  <meta name="HandheldFriendly" content="true">
  {if isset($taglist)}
    {autometa key_add="{$taglist} Dehler 36 JV" key_density=3 description=0}
  {else}
    {autometa key_add="Dehler 36 JV, saildrive 130s, volvo penta, md2030, lewmar, zeilen, urenteller" key_density=3 description=0}
  {/if}
  {* <meta name="keywords" content="{search action="keywords" count="20"}"> *}
  <meta name="MobileOptimized" content="320">
  <meta name="owner" content="Gregor de Graaf">
  <meta name="publisher" content="Gregor de Graaf">
  {if isset($boat_date)}
    {if $boat_date|date_format:'YYYY-MM-DD' > '2016-03-10'}
      {$sitename = "{sitename}"} <!-- Dehler title -->
    {else}
      {assign var=sitename value='Uisge Beatha | De Hanse 311, mijn vorige boot'} <!-- Hanse title -->
    {/if}
  {else}
    {$sitename = {sitename}}
  {/if}
 
  {if isset($taglist)}
    {autometa key_add="{$taglist}, Dehler 36 JV" key_density=3 description=0}
  {else}
    {autometa key_add="Dehler 36 JV, saildrive 130s, volvo penta, md2030, lewmar, zeilen, urenteller" key_density=3 description=0}
  {/if}

  {if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() == ''}
    {$description_global = "{$content_obj->TitleAttribute()|strip_tags:false|strip|truncate:300:'':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}" scope = 'global'}
  {elseif $page_description|count_words < '6'}
    {capture name='meta_description' assign='description_global'}{$page_title} | {$page_description}{/capture}
  {else}
    {assign var='description_global' value=$page_description}
  {/if}
  <meta name="description" content="{$description_global}">
  {$_full_title = "{title} - {$sitename}"}
  {$_full_title = "{$_full_title|cms_escape:htmlall|truncate:80}" scope='global'}
  <title>{$_full_title|cms_escape:htmlall|truncate:80}</title>

  {if isset($canonical_global)}
    {$canonical_real_global = $canonical_global scope='global'}
  {elseif isset($content_obj)}
    {$canonical_real_global = $content_obj->GetURL() scope='global'}
  {/if}
  {$canonical = $canonical_real_global scope='global'} {* to make sure no other canonical setting is missed *}
  <link rel="canonical" href="{$canonical_real_global}">

  {include file="{#theme_resource#}generic_page_favicons.tpl"}

  {*if isset($images_all_global) && $images_all_global|@count >=1}
    {include file="{#theme_resource#}generic_page_social_images.tpl"}
  {/if*}

  {include file="{#theme_resource#}generic_page_social_metadata.tpl"}

  {if isset($page_js_header) && $page_js_header != ''}
    {$page_js_header}
  {/if}

  {block name='js_header'}
    {include file="{#theme_resource#}generic_js_google_tag_manager.tpl"}
    {include file="{#theme_resource#}generic_js_header.tpl"}
  {/block}

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-3514636835854223",
          enable_page_level_ads: true
     });
</script>

  {* Define social links *}
  {assign var="feed" value='/rssfeed.rss' scope=global}
  {assign var="twitter" value='https://www.twitter.com/GJdeGraaf' scope=global}
  {assign var="facebook" value='https://www.facebook.com/uisgebeatha.eu' scope=global}
  {assign var="google" value='https://plus.google.com/+GregordeGraaf' scope=global}
  {assign var="pinterest" value='https://nl.pinterest.com/gjdgraaf/uisge-beatha/' scope=global}
  {assign var="linkedin" value='https://www.linkedin/gregordegraaf' scope=global}

  {cms_selflink dir='prev' rellink=1}
  {cms_selflink dir='next' rellink=1}

  {nocache}
    {*cms_stylesheet*}
  {/nocache}
  {* remove $_unique_css_id when not developing, otherwise the css file won't be cached *}
  {if "{#browsersyncModus#}" == 'on'}
    {assign var=_unique_css_id value=10|mt_rand:3000000}
  {else}
    {assign var=_unique_css_id value=1}
  {/if}
  <link rel="stylesheet" href="{$theme_relative_url}/css/main.css?fes{$_unique_css_id}">
  <!--link rel="stylesheet" href="{$theme_relative_url}/css/now-ui-kit.css?fes{$_unique_css_id}"-->
  {browser_lang accepted='nl' assign='browser_lang' scope=global} {* used for Google Translate to check if translation is needed. Doesn't work too well because in NL it gives en... *}


  <!-- Search Modal -->
  <div id="modalSearch" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modalSearchTitle"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-center" role="document">
      <!-- Modal content / modal needs to be on a different place than the section it's been called from -->
      <div class="modal-content" style="background: var(--fill-color-boat-light);">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title text-white">Zoek binnen Uisge Beatha</h4>
        </div>
        <div class="modal-body">
          <!-- Replace the following with your own search script from https://www.google.com/cse. -->
          {* <script>
              (function ()
              {
                  var cx = '008246143810435871214:nr0bhziz1xo';
                  var gcse = document.createElement('script');
                  gcse.type = 'text/javascript';
                  gcse.async = true;
                  gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
                      '//cse.google.com/cse.js?cx=' + cx;
                  var s = document.getElementsByTagName('script')[0];
                  s.parentNode.insertBefore(gcse, s);
              })();
          </script> *}
          <!--gcse:search></gcse:search-->
          <form formaction="zoeken" formenctype="multipart/form-data" formmethod="get" style="color:white;"/>
            <input class="form-control"  type="text" id="zoekForm" name="q" placeholder="Geef zoekterm in" required>
            <input type="submit" value="Ga" formaction="/zoeken" id="submit" style="position: absolute; left: -9999px; width: 1px; height: 1px; "tabindex="-1">
        </form>
        </div>
        <div class="modal-footer">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Sluit</button>
          <button class="btn btn-primary" id="modalSearchSubmit" type="submit">Zoeken</button>
        </div>
      </div>
    </div>
  </div>

</head>
{* <!-- /parsed: 3 of 3 --> *}