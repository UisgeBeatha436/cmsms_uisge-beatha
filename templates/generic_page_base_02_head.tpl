{* area: 2 of 3 *}
{* /area: 3 of 3 *}
  {if "{#minifyHTML#}" == 'on'}
    {$minify_html_enabled=true}
  {else}
    {$minify_html_enabled=false}
  {/if}
{/strip}
<head>
  {minify_html_block enabled='1' collapse_whitespace='1' enabled=$minify_html_enabled}
  	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    {metadata showbase='true'}
    {* Amazon S3 *}
    <link rel="preconnect" href="//s3.amazonaws.com">
    {* Google CDN *}
    <link rel="preconnect" href="//ajax.googleapis.com">
    {* Microsoft CDN *}
    <link rel="preconnect" href="//ajax.microsoft.com">
    <link rel="preconnect" href="//ajax.aspnetcdn.com">
    {* CDN JS *}
    <link rel="preconnect" href="//cdnjs.cloudflare.com">
    {* Bootstrap CDN *}
    <link rel="preconnect" href="//netdna.bootstrapcdn.com">
    {* Google Tag Manager *}
    <link rel="preconnect" href="//www.googletagmanager.com">
    {* Google (Analytics & Translate & Adsense) *}
    <link rel="preconnect" href="//www.google-analytics.com">
    {*<link rel="preconnect" href="https://apis.google.com" crossorigin="anonymous">
    <link rel="preconnect" href="https://translate.googleapis.com" crossorigin="anonymous">
    <link rel="preconnect" href="https://accounts.google.com" crossorigin="anonymous">
    <link rel="preconnect" href="https://adservice.google.nl" crossorigin="anonymous">
    <link rel="preconnect" href="https://pagead2.googlesyndication.com">
    <link rel="preconnect" href="https://adservice.google.com">
    <link rel="preconnect" href="https://www.gstatic.com" crossorigin="anonymous">*}
    <link rel="preconnect" href="https://apis.google.com">
    <link rel="dns-prefetch" href="https://www.google-analytics.com">
    <link rel="preconnect" href="https://www.google-analytics.com" crossorigin="anonymous">
    {* Google Fonts *}
    <link rel="preconnect" href="//fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://ajax.googleapis.com">
    {* Facebook *}
    <link rel="preconnect" href="//connect.facebook.net">
    <link rel="preconnect" href="//connect.facebook.com">
    <link rel="preconnect" href="https://staticxx.facebook.com">
    <link rel="preconnect" href="https://connect.facebook.com">
    <link rel="preconnect" href="https://connect.facebook.net">
    <link rel="preconnect" href="https://staticxx.facebook.com">
    {* Linkedin *}
    <link rel="preconnect" href="https://platform.linkedin.com">
    {* Twitter *}
    <link rel="preconnect" href="https://platform.twitter.com">
    {* Prefetch DNS for external assets
    <link rel="dns-prefetch" href="https://fonts.googleapis.com" *}
    {* Preconnect for external assets *}
    <link rel="preconnect" href="//statisch.uisge-beatha.eu">
    {*<link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Light.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Bold.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="{$theme_relative_url}/webfont/Roboto-Medium.woff2" as="font" type="font/woff2" crossorigin="anonymous">*}
    <meta name="copyright" content="Copyright © Gregor de Graaf, All Rights Reserved">
    {$last_modified = $last_modified|default:"{modified_date format='%e-%m-%Y'}" scope='global'}
    {$page_modified = $page_modified|default:"{modified_date format='%e-%m-%Y'}" scope='global'}
    {$page_image = $page_image|default:"{uploads_url}/images/cms/Uisge-Beatha_Main_Image.jpg" scope='global'}
    {$page_title = $page_title|default:"{title}" scope='global'}
    <meta name="google-site-verification" content="ZELEPW5SSIsv1PqdZrX91yXfEsjCNmJEHG50F7vVri4" />
    {* 23may18 Verificatie Daisycon *}
    <meta name="baf0efcf61df286" content="3453aede4510b730471f07b6ca7bd7c2" />
    {if $smarty.server.SERVER_NAME|lower eq {$environment}}
      <meta name="robots" content="index,follow">
    {else}
      <meta name="robots" content="noindex,nofollow">
    {/if}
    <meta name="HandheldFriendly" content="true">
    {if isset($taglist)}
      {autometa key_add="{$taglist}, Dehler 36 JV, Zeilen, Varen, Zeilboot" key_density=3 description=0}
    {else}
      {autometa key_add="Dehler 36 JV, saildrive 130s, volvo penta, md2030, lewmar, zeilen, urenteller, varen, zeilboot" key_density=3 description=0}
    {/if}
    {* meta name="keywords" content="{search action="keywords" count="20"}" *}
    <meta name="MobileOptimized" content="320">
    <meta name="owner" content="Gregor de Graaf">
    <meta property="publisher" content="Gregor de Graaf">
    {if isset($boat_date)}
      {if $boat_date|date_format:'YYYY-MM-DD' > '2016-03-10'}
        {$sitename = "{sitename}"} {* Dehler title *}
      {else}
        {assign var=sitename value='Uisge Beatha | De Hanse 311, mijn vorige boot'} {* Hanse title *}
      {/if}
    {else}
      {$sitename = {sitename}}
    {/if}
    {if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() == ''}
      {* {$description_global = "{$content_obj->TitleAttribute()|strip_tags:false|strip|truncate:300:'':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}" scope = 'global'} *}
      {$description_global = "{$content_obj->TitleAttribute()|strip_tags:false|strip|truncate:300}" scope = 'global'}
    {elseif isset($page_description) && $page_description|count_words < '6'}
      {* {capture name='meta_description' assign='description_global'}{$page_title} | {$page_description}{/capture} *}
      {assign var='description_global' value="{$page_title} | {if isset($page_description)}{$page_description}{else}{description}{/if}" scope='global'}
    {else}
      {assign var='description_global' value="{if isset($page_description) && $page_description !=''}{$page_description}  | Logboek met zeilverhalen en bootonderhoud{/if}"}
    {/if}
    <meta name="description" content="{$description_global}">
    {$_full_title = "{if isset($page_title)}{$page_title} | {/if}{title} - {$sitename} - Dehler 36 JV"}
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
  {capture assign='_main'}
    <link rel="preload" href="{$theme_relative_url}/css/main.css{if $_unique_css_id != 1}?fes{$_unique_css_id}{/if}" as="style" onload="this.rel='stylesheet'">
    <noscript><link rel="stylesheet" href="{$theme_relative_url}/css/main.css{if $_unique_css_id != 1}?fes{$_unique_css_id}{/if}"></noscript>
  {/capture}
  {$_main|strip}
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
  {minify_html_block enabled='1' collapse_whitespace='1' enabled=$minify_html_enabled}
    {browser_lang accepted='nl' assign='browser_lang' scope=global} {* used for Google Translate to check if translation is needed. Doesn't work too well because in NL it gives en... *}
    {* cgjs_render on the next line
      {cgjs_render} *}
    {* https://stackoverflow.com/questions/3221561/eliminate-flash-of-unstyled-content *}
    {include|strip file="{#theme_resource#}AIS_location.tpl"}
    {block name='js_header'}
      {include|strip file="{#theme_resource#}generic_js_google_tag_manager.tpl"}
      {include|strip file="{#theme_resource#}generic_js_header.tpl"}
    {/block}
    {strip}
      <style>
        .youtube-player {
            position: relative;
            padding-bottom: 56.23%;
            /* Use 75% for 4:3 videos */
            height: 0;
            overflow: hidden;
            max-width: 100%;
            background: #000;
            margin: 5px;
        }

        .youtube-player iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 100;
            background: transparent;
        }

        .youtube-player img {
            bottom: 0;
            display: block;
            left: 0;
            margin: auto;
            max-width: 100%;
            width: 100%;
            position: absolute;
            right: 0;
            top: 0;
            border: none;
            height: auto;
            cursor: pointer;
            -webkit-transition: .4s all;
            -moz-transition: .4s all;
            transition: .4s all;
        }

        .youtube-player img:hover {
            -webkit-filter: brightness(75%);
        }

        .youtube-player .play {
            height: 72px;
            width: 72px;
            left: 50%;
            top: 50%;
            margin-left: -36px;
            margin-top: -36px;
            position: absolute;
            background: url("//i.imgur.com/TxzC70f.png") no-repeat; // shows the play-button
            cursor: pointer;
        }

      </style>
    {/strip}
  {/minify_html_block}
</head>
{* tmpl: head:end *}