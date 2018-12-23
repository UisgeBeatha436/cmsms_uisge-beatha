{*
  {capture assign='_js_footer'}
    {$global_js_footer}
  {/capture}
  {$global_js_footer=$_js_footer scope='global'}
*}

{if isset($global_js_footer) && $global_js_footer != ''}
  {$global_js_footer}
{/if}

{if "{#browsersyncModus#}" == 'on'}
  {include file="{#theme_resource#}generic_js_browser_sync.tpl"}
{/if}

{cgsi_convert}
  {* <!-- script src="{$theme_dst_path}/assets/dst/js/es5/social.js"></script --> *}
{/cgsi_convert}

{if "{#es5Modus#}" == 'on'}
  {* https://frontendstudio.github.io/docs/javascript.html#templating-method-1 *}
  {* cache buster *}
  {if "{#browsersyncModus#}" == 'on'}
    {assign var=_unique_js_id value=10|mt_rand:3000000}
  {else}
    {assign var=_unique_js_id value=1}
  {/if}
   
  {* <!-- b: third party .js libs --> *}
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/js/es5/jquery.js?fes={$_unique_js_id}"><\/script>')</script> {* slim-version lacks getScript *}

  {* <script src="{$theme_dst_path}/assets/dst/js/es5/jquery.slim.js"></script>*}

  {*<script type="text/javascript" src="{root_url}/assets/src/node_modules/jquery_lazyscript/jquery.lazyscript.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script> *}

  <script defer src="{$theme_dst_path}/assets/dst/js/es5/bootstrap.js"></script> 
  <script defer src="{$theme_dst_path}/assets/dst/js/es5/now-ui-kit.js"></script>
  
  {* <script src="{$theme_dst_path}/assets/dst/js/es5/fontawesome.js"></script> 
    {
      "outputFileName": "fontawesome.js",
      "dependencies": [
        "node_modules/@fortawesome/fontawesome-free/js/all.js"
      ]
    },
  *}

  {*<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>*}
  <script type="text/javascript" src="{$theme_dst_path}/assets/dst/js/es5/parallax.js"></script>  {* Script for parallax Rellax *}
  {*<script src="{$theme_dst_path}/assets/dst/js/es5/cookies-eu-banner.js"></script>*}

  {* <!-- c: plug-ins that have dependencies on b: >>> plugins.js --> *}
  {* <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> * }
  <script type="text/javascript" src="https://unpkg.com/now-ui-kit@1.0.1/assets/js/now-ui-kit.js"></script>*}
  
  {* <!-- d: custom scripts >>> scripts.js --> *}
  {*<script src="{$theme_dst_path}/assets/dst/js/es5/social.js"</script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/assets/dst/js/es5/social.js?fes={$_unique_js_id}"><\/script>')</script> *}
  {* theme path: {$theme_dst_path *}
  {*  <script>window.jQuery || document.write('<script src="{$theme_relative_url}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script>
      <script src="{$theme_relative_url}/js/es5/plugins.js?fes={$_unique_js_id}"></script> *}
  
  <script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@8.17.0/dist/lazyload.min.js"></script>
  <script src="{$theme_dst_path}/assets/dst/js/es5/scripts.js?fes={$_unique_js_id}"></script>
{/if}
{* <!-- script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@10.19.0/dist/lazyload.min.js"></script --> *}


{if "{#es6ModusLegacy#}" == 'on'}
  {include file="{#theme_resource#}generated/generated_js_footer.tpl"}
{/if}


{jsmin}

{* Rellax *}

{* Resize logo and header *}
<script  src="{$theme_dst_path}/assets/dst/js/es5/resize_header_logo.js"></script>

{* lazy load *}
<script>
  var myLazyLoad = new LazyLoad({
      elements_selector: ".lazy"
  });

  // lazyload used in the Bootstrap carousel
  $(function() {
    return $(".carousel.lazy").on("slide.bs.carousel", function(ev) {
      var lazy;
      lazy = $(ev.relatedTarget).find("img[data-src]");
      lazy.attr("src", lazy.data('src'));
      lazy.removeAttr("data-src");
    });
  });
</script>
<!--script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script-->
<!--noptimize  |  https: / /gulshankumar.net/setup-lazy-loading-google-adsense-ad-units/ -->
<script type="text/javascript">
  function downloadJSAtOnload() {
  var element = document.createElement("script");
  element.src = "https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js";
  document.body.appendChild(element);
  }
  if (window.addEventListener)
    window.addEventListener("load", downloadJSAtOnload, false);
  else if (window.attachEvent)
    window.attachEvent("onload", downloadJSAtOnload);
  else window.onload = downloadJSAtOnload;
</script>
<!--/noptimize-->
<script>
  {jsmin}
  (adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: "ca-pub-3514636835854223",
        enable_page_level_ads: true
  });
  {/jsmin}
</script>

{* scroll 2 top *}

  <script> // Content with blockquotes is missing a class. Script to add it otherwise Bootstrap wouldn't understand it
    $( "blockquote" ).last().addClass( "blockquote" );
  </script>

  {*<div id="fb-root"></div>  { * required to enable Facebook plugins *}
  {*<script src="{root_url}/assets/src/node_modules/social/social.js"></script>

  <script>(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.2";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));</script> *}

  {*<script>
    $(document).ready(function () {
      var options = {
        type: "scroll",
        scripts: [
          "https://platform.twitter.com/widgets.js",
          "https://connect.facebook.net/nl_NL/sdk.js#xfbml=1&appId=175931732519501",
          "https://apis.google.com/js/plusone.js",
          "https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
          // "https://www.marinetraffic.com/js/embed.js"
          ],
        success: function () {
            FB.init({ status: true, cookie: true, xfbml: true });
          }
      };
      $.lazyscript(options);
    });
  </script> *}
  <script>
    new CookiesEuBanner(function(){
        // Your code to launch when user accept cookies
    }, true);
  </script>

  {* https://varvy.com/pagespeed/defer-many-javascripts.html * }
  <script type="text/javascript">
    function downloadJSAtOnload() {
    var element = document.createElement("script");
    element.src = "./assets/dst/js/es5/defer.js";
    document.body.appendChild(element);
    }
    if (window.addEventListener)
    window.addEventListener("load", downloadJSAtOnload, false);
    else if (window.attachEvent)
    window.attachEvent("onload", downloadJSAtOnload);
    else window.onload = downloadJSAtOnload;
  </script> *}
{/jsmin}

  {block name='floatbox'}
    {include file='cms_template:floatbox_js_css'}
  {/block}

  <!-- script>
    $(document).ready(function() {
        $.getScript('https://assets.pinterest.com/js/pinit.js', function(){});
    });
  </script -->
<!--script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script-->