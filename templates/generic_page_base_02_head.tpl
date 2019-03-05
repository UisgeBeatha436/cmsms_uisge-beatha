<!-- area: 2 of 3 -->
<!-- /area: 3 of 3 -->
  {if "{#minifyHTML#}" == 'on'}
    {$minify_html_enabled=true}
  {else}
    {$minify_html_enabled=false}
  {/if}
{/strip}
{minify_html_block collapse_whitespace='1' enabled=$minify_html_enabled}
  <head>
  	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {metadata showbase='true'}
    <!-- Amazon S3 -->
    <link rel="preload" href="//s3.amazonaws.com">
    <!-- Google CDN -->
    <link rel="preload" href="//ajax.googleapis.com">
    <!-- Microsoft CDN -->
    <link rel="preload" href="//ajax.microsoft.com">
    <link rel="preload" href="//ajax.aspnetcdn.com">
    <!-- CDN JS -->
    <link rel="preload" href="//cdnjs.cloudflare.com">
    <!-- Bootstrap CDN -->
    <link rel="preload" href="//netdna.bootstrapcdn.com">
    <!-- Google Tag Manager -->
    <link rel="preload" href="//www.googletagmanager.com">
    <!-- Google (Analytics) -->
    <link rel="preload" href="//www.google-analytics.com">
    <link rel="preconnect" href="https://apis.google.com">
    <link rel="preconnect" href="https://translate.googleapis.com">
    <link rel="preconnect" href="https://accounts.google.com">
    <link rel="preconnect" href="https://adservice.google.nl">
    <link rel="preconnect" href="https://pagead2.googlesyndication.com">
    <link rel="preconnect" href="https://pagead2.googlesyndication.com">
    <link rel="preconnect" href="https://adservice.google.com">
    <link rel="preconnect" href="https://www.gstatic.com">
    <!-- Google Fonts -->
    <link rel="preload" href="//fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://ajax.googleapis.com">
    <!-- Facebook -->
    <link rel="preload" href="//connect.facebook.net">
    <link rel="preload" href="//connect.facebook.com">
    <link rel="preconnect" href="https://connect.facebook.com">
    <!-- Google+ -->
    <link rel="preload" href="//apis.google.com">
    <link rel="preconnect" href="https://apis.google.com">
    <!-- Linkedin -->
    <link rel="preload" href="//platform.linkedin.com">
    <link rel="preconnect" href="//platform.linkedin.com">
    <!-- Twitter -->
    <link rel="preload" href="//platform.twitter.com">
    <link rel="preconnect" href="//platform.twitter.com">
    <!-- Prefetch DNS for external assets 
    <link rel="dns-prefetch" href="//fonts.googleapis.com" -->
    <link rel="dns-prefetch" href="//www.google-analytics.com">
    <!-- Preconnect for external assets -->
    <link rel="preconnect" href="//static.uisge-beatha.eu">
    <link rel="preconnect" href="//www.google-analytics.com" crossorigin>
    <!--link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Light.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Bold.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Medium.woff2" as="font" type="font/woff2" crossorigin="anonymous"-->
    <meta name="copyright" content="Copyright © Gregor de Graaf, All Rights Reserved">
    {$last_modified = $last_modified|default:"{modified_date format='%e-%m-%Y'}" scope=global}
    {$page_modified = $page_modified|default:"{modified_date format='%e-%m-%Y'}" scope=global}
    {$page_image = $page_image|default:"{uploads_url}/images/cms/Uisge-Beatha_Main_Image.jpg" scope=global}
    {$page_title = $page_title|default:"{title}" scope=global}
    <meta name="google-site-verification" content="ZELEPW5SSIsv1PqdZrX91yXfEsjCNmJEHG50F7vVri4" />
    {* 23may18 Verificatie Daisycon *}
    <meta name="baf0efcf61df286" content="3453aede4510b730471f07b6ca7bd7c2" />
    <meta name="robots" content="noindex,nofollow">
    <meta name="HandheldFriendly" content="true">
    {if isset($taglist)}
      {autometa key_add="{$taglist} Dehler 36 JV" key_density=3 description=0}
    {else}
      {autometa key_add="Dehler 36 JV, saildrive 130s, volvo penta, md2030, lewmar, zeilen, urenteller" key_density=3 description=0}
    {/if}
    <!-- meta name="keywords" content="{search action="keywords" count="20"}" -->
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
    {if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() == ''}
      <!-- {$description_global = "{$content_obj->TitleAttribute()|strip_tags:false|strip|truncate:300:'':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}" scope = 'global'} -->
      {$description_global = "{$content_obj->TitleAttribute()|strip_tags:false|strip|truncate:300}" scope = 'global'}
    {elseif $page_description|count_words < '6'}
      <!-- {capture name='meta_description' assign='description_global'}{$page_title} | {$page_description}{/capture} -->
      {assign var='description_global' value="{$page_title} | {if !empty($page_description)}{$page_description}{else}{description}{/if}" scope='global'}
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
    {$canonical_global = $canonical_real_global scope='global'} {* to make sure no other canonical setting is missed *}
    <link rel="canonical" href="{$canonical_real_global}">

    {include|strip file="{#theme_resource#}generic_page_favicons.tpl"}

    {*if isset($images_all_global) && $images_all_global|@count >=1}
      {include|strip file="{#theme_resource#}generic_page_social_images.tpl"}
    {/if*}

    {include|strip file="{#theme_resource#}generic_page_social_metadata.tpl"}

    {if isset($page_js_header) && $page_js_header != ''}
      {$page_js_header}
    {/if}

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
    {* <link rel="stylesheet" href="{$theme_relative_url}/css/main.css?fes{$_unique_css_id}"> *}
    {* https://github.com/filamentgroup/loadCSS *}
    {*if $page_alias == 'testpage'}
      < !-- Lightgallery css loaded -->
      <link type="text/css" rel="stylesheet" href="./assets/src/node_modules/lightgallery.js/dist/css/lightgallery.css" />
    {else}
      < !-- Lightgallery css not loaded -->
    {/if*}
  {/minify_html_block}
  {strip}
  {capture assign='_main'}
    <link rel="preload" href="{$theme_relative_url}/css/main.css{if $_unique_css_id != 1}?fes{$_unique_css_id}{/if}" as="style" onload="this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="{$theme_relative_url}/css/main.css{if $_unique_css_id != 1}?fes{$_unique_css_id}{/if}"></noscript>
  {/capture}
  {$_main}
    <!--link rel="preload" href="{$theme_relative_url}/css/main.css?fes{$_unique_css_id}" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="{$theme_relative_url}/css/main.css?fes{$_unique_css_id}"></noscript-->
  {/strip}
    {jsmin}
    <script>
        /*! loadCSS. [c]2017 Filament Group, Inc. MIT License */
        /* This file is meant as a standalone workflow for
        - testing support for link[rel=preload]
        - enabling async CSS loading in browsers that do not support rel=preload
        - applying rel preload css once loaded, whether supported or not.
        */
        (function( w ){
          "use strict";
          // rel=preload support test
          if( !w.loadCSS ){
            w.loadCSS = function(){};
          }
          // define on the loadCSS obj
          var rp = loadCSS.relpreload = {};
          // rel=preload feature support test
          // runs once and returns a function for compat purposes
          rp.support = (function(){
            var ret;
            try {
              ret = w.document.createElement( "link" ).relList.supports( "preload" );
            } catch (e) {
              ret = false;
            }
            return function(){
              return ret;
            };
          })();

          // if preload isn't supported, get an asynchronous load by using a non-matching media attribute
          // then change that media back to its intended value on load
          rp.bindMediaToggle = function( link ){
            // remember existing media attr for ultimate state, or default to 'all'
            var finalMedia = link.media || "all";

            function enableStylesheet(){
              // unbind listeners
              if( link.addEventListener ){
                link.removeEventListener( "load", enableStylesheet );
              } else if( link.attachEvent ){
                link.detachEvent( "onload", enableStylesheet );
              }
              link.setAttribute( "onload", null ); 
              link.media = finalMedia;
            }

            // bind load handlers to enable media
            if( link.addEventListener ){
              link.addEventListener( "load", enableStylesheet );
            } else if( link.attachEvent ){
              link.attachEvent( "onload", enableStylesheet );
            }

            // Set rel and non-applicable media type to start an async request
            // note: timeout allows this to happen async to let rendering continue in IE
            setTimeout(function(){
              link.rel = "stylesheet";
              link.media = "only x";
            });
            // also enable media after 3 seconds,
            // which will catch very old browsers (android 2.x, old firefox) that don't support onload on link
            setTimeout( enableStylesheet, 3000 );
          };

          // loop through link elements in DOM
          rp.poly = function(){
            // double check this to prevent external calls from running
            if( rp.support() ){
              return;
            }
            var links = w.document.getElementsByTagName( "link" );
            for( var i = 0; i < links.length; i++ ){
              var link = links[ i ];
              // qualify links to those with rel=preload and as=style attrs
              if( link.rel === "preload" && link.getAttribute( "as" ) === "style" && !link.getAttribute( "data-loadcss" ) ){
                // prevent rerunning on link
                link.setAttribute( "data-loadcss", true );
                // bind listeners to toggle media back
                rp.bindMediaToggle( link );
              }
            }
          };

          // if unsupported, run the polyfill
          if( !rp.support() ){
            // run once at least
            rp.poly();

            // rerun poly on an interval until onload
            var run = w.setInterval( rp.poly, 500 );
            if( w.addEventListener ){
              w.addEventListener( "load", function(){
                rp.poly();
                w.clearInterval( run );
              } );
            } else if( w.attachEvent ){
              w.attachEvent( "onload", function(){
                rp.poly();
                w.clearInterval( run );
              } );
            }
          }
          // commonjs
          if( typeof exports !== "undefined" ){
            exports.loadCSS = loadCSS;
          }
          else {
            w.loadCSS = loadCSS;
          }
        }( typeof global !== "undefined" ? global : this ) );
    </script>
    {/jsmin}
  {minify_html_block collapse_whitespace='1' enabled=$minify_html_enabled}
    {browser_lang accepted='nl' assign='browser_lang' scope=global} {* used for Google Translate to check if translation is needed. Doesn't work too well because in NL it gives en... *}
    <!-- cgjs_render on the next line -->
    <!-- {cgjs_render} -->
    {* https://stackoverflow.com/questions/3221561/eliminate-flash-of-unstyled-content *}
    {include|strip file="{#theme_resource#}AIS_location.tpl"}
    {block name='js_header'}
      {include|strip file="{#theme_resource#}generic_js_google_tag_manager.tpl"}
      {include|strip file="{#theme_resource#}generic_js_header.tpl"}
    {/block}
    {if $page_alias == 'logboekpagina' OR $page_alias == 'fotoalbums' OR $page_alias == 'afkomst-naam' OR $page_alias == 'dehler-36-jv'}
      <script src="https://static.uisge-beatha.eu/_Javascripts/floatbox_813/floatbox/floatbox.js"></script>
    {/if}
  </head>
{/minify_html_block}
{strip}
<!-- tmpl: head:end -->