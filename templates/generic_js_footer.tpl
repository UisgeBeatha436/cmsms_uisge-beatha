{strip}
    {capture assign='_js_footer'}
      {if isset($global_js_footer) && $global_js_footer != ''}
        {$global_js_footer}
      {/if}
    {/capture}
    {$global_js_footer=$_js_footer scope='global'}

  {if "{#browsersyncModus#}" == 'on'}
    {include file="{#theme_resource#}generic_js_browser_sync.tpl"}
  {/if}

  {cgsi_convert}
    {* <!-- script src="{$theme_absolute_url}/js/es5/social.js"></script --> *}
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
    {* <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>*}
    <script>window.jQuery || document.write('<script src="{$theme_absolute_url}/js/es5/jquery.js?fes={$_unique_js_id}"><\/script>')</script> {* slim-version lacks getScript *}
    {*<script>
      var sNew = document.createElement("script");
      sNew.async = true;
      sNew.src = "/assets/dst/js/es5/jquery.js";
      var s0 = document.getElementsByTagName('script')[0];
      s0.parentNode.insertBefore(sNew, s0);
    </script>*}

    {* <script src="{$theme_absolute_url}/js/es5/jquery.slim.js"></script>*}

    <script defer src="{$theme_absolute_url}/js/es5/uisge-beatha.js?fes={$_unique_js_id}"></script>
    <script src="{$theme_absolute_url}/js/es5/lozad.js?fes={$_unique_js_id}"></script>

    {* <script src="//cdn.jsdelivr.net/combine/npm/lightgallery@1.6.11,npm/lightgallery@1.6.11/modules/lg-share.min.js,npm/lightgallery@1.6.11/modules/lg-pager.min.js"></script>
      <script type="module" src="//cdn.jsdelivr.net/npm/lightgallery.js@1.1.2/src/js/lg-utils.min.js"></script> *}

    {* <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>*}
    <script defer src="{$theme_absolute_url}/js/es5/parallax.js"></script>  {* Script for parallax Rellax  *}
    <script src="{$theme_absolute_url}/js/es5/cookies-eu-banner.js"></script>

    {* <!-- c: plug-ins that have dependencies on b: >>> plugins.js --> *}
    {* <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> * }
    <script src="https://unpkg.com/now-ui-kit@1.0.1/assets/js/now-ui-kit.js"></script>*}

    {* <!-- d: custom scripts >>> scripts.js --> *}
    <script defer src="{$theme_absolute_url}/js/es5/dyscrollup.js?fes={$_unique_js_id}"></script>
    <script defer src="{$theme_absolute_url}/js/es5/scripts.js?fes={$_unique_js_id}"></script>

    {* Resize logo and header *}
    <script defer src="{$theme_absolute_url}/js/es5/footerSettings.js?fes={$_unique_js_id}"></script>

  {/if}

  {if "{#es6ModusLegacy#}" == 'on'}
    {include file="{#theme_resource#}generated/generated_js_footer.tpl"}
  {/if}

  {* Lozad | example settings https://codepen.io/ApoorvSaxena/pen/vWmyQg *}
  {jsmin}
    <script>
      const observer = lozad(); // lazy loads elements with default selector as '.lozad'
      const gallerylozad = lozad('.gallery_lozad'); // lazy loads Gallery elements with selector as '.gallery_lozad'
      const youtubeFooterlozad = lozad('.footer_lozad'); // lazy loads Gallery elements with selector as '.youtubeFooterlozad'
      observer.observe();
      gallerylozad.observe();
      youtubeFooterlozad.observe();
      console.log('Lozad initiate loaded');
    </script>
  {/jsmin}
  {* lazy load *}

  {* noptimize  |  https://gulshankumar.net/setup-lazy-loading-google-adsense-ad-units/ *}
  {if isset($showAds)}
    {jsmin}
      <script>
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
          console.log('Google Ads loaded at onload');
      </script>
    {/jsmin}
  {/if}
  {* vanilla scroll 2 top *}

  {* Blockquote *}

  {* CookiesEuBanner *}
  {jsmin}
    <script>
      new CookiesEuBanner(function(){
      // Your code to launch when user accept cookies
      {literal}
        // GA Analytics
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
          ga('create', 'UA-3361592-1', 'auto');
          ga('send', 'pageview');
        // Google Tagmanager
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
          new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
          j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
          'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
          })(window,document,'script','dataLayer','{/literal}{$google_code_global}{literal}');
          // prod: GTM-M95RWP
          // develop: GTM-W56XLX5
      {/literal}
      console.log('Cookies accepted and loaded.');
      }, true);
    </script>
  {/jsmin}

  {block name='floatbox'}
    {include|strip file='cms_template:floatbox_js_css'}
  {/block}
  {if $page_alias == "departure-times-and-tides"}
    <script asyn defer src="{$theme_absolute_url}/js/es5/datatables.js"></script>
  {/if}
  {* Material Select Initialization *}
  {jsmin}
    <script async defer src="https://cse.google.com/query_renderer.js"></script>
    <script async defer src="https://cse.google.com/api/partner-pub-3514636835854223:dxfo8gajmec/popularqueryjs?view=overall&callback=(new+PopularQueryRenderer(document.getElementById(%22queries%22))).render"></script>
  {/jsmin}
{/strip}