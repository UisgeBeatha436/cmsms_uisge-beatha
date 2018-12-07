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

<script src="{root_url}/assets/src/node_modules/social/social.js"></script>

{if "{#es5Modus#}" == 'on'}
  {* https://frontendstudio.github.io/docs/javascript.html#templating-method-1 *}
  {assign var=_unique_js_id value=10|mt_rand:30}
   
  <!-- b: third party .js libs -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/js/es5/jquery.js?fes={$_unique_js_id}"><\/script>')</script>

  {* <script src="{$theme_dst_path}/assets/dst/js/es5/jquery.slim.js"></script>*}

  {*<script type="text/javascript" src="{root_url}/assets/src/node_modules/jquery_lazyscript/jquery.lazyscript.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script> *}

  <script src="{$theme_dst_path}/assets/dst/js/es5/bootstrap.js"></script> 
  <script src="{$theme_dst_path}/assets/dst/js/es5/now-ui-kit.js"></script>
  {* <script src="{$theme_dst_path}/assets/dst/js/es5/fontawesome.js"></script> 
    {
      "outputFileName": "fontawesome.js",
      "dependencies": [
        "node_modules/@fortawesome/fontawesome-free/js/all.js"
      ]
    },
  *}

  {*<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>*}
  <script type="text/javascript" src="{$theme_dst_path}/assets/dst/js/es5/rellax.js"></script> {* Script for parallax Rellax *}
  <script src="{$theme_dst_path}/assets/dst/js/es5/cookies-eu-banner.js"></script>

  <!-- c: plug-ins that have dependencies on b: >>> plugins.js -->  
  {* <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> * }
  <script type="text/javascript" src="https://unpkg.com/now-ui-kit@1.0.1/assets/js/now-ui-kit.js"></script>*}
  
  <!-- d: custom scripts >>> scripts.js -->
  {*<script src="{$theme_dst_path}/assets/dst/js/es5/social.js"</scripts>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/assets/dst/js/es5/social.js?fes={$_unique_js_id}"><\/script>')</script> *}
  {* theme path: {$theme_dst_path *}
  {*  <script>window.jQuery || document.write('<script src="{$theme_relative_url}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script>
      <script src="{$theme_relative_url}/js/es5/plugins.js?fes={$_unique_js_id}"></script> *}
  <script src="{$theme_dst_path}/assets/dst/js/es5/scripts.js?fes={$_unique_js_id}"></script>

{/if}

{if "{#es6ModusLegacy#}" == 'on'}
  {include file="{#theme_resource#}generated/generated_js_footer.tpl"}
{/if}

{block name='floatbox'}
  {include file='cms_template:floatbox_js_css'}
{/block}

{* <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script
			  src="https://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous"></script> *}
<script>
  var rellax = new Rellax('.rellax', {
    // center: true
    callback: function(position) {
        // callback every position change
        console.log(position);
    }
  });
</script>

<!-- script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@10.19.0/dist/lazyload.min.js"></script -->
<script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@8.17.0/dist/lazyload.min.js"></script>

{* Resize logo and header *}
<script>
    window.onscroll = function() {
    growShrinkLogo()
  };

  var Logo = document.getElementById("header-logo");
  var endOfDocumentTop = 150;
  var size = 0;

  function growShrinkLogo() {
  var scroll = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

    if (size == 0 && scroll > endOfDocumentTop) {
      Logo.className = 'smallLogo';
      size = 1;
    } else if(size == 1 && scroll <= endOfDocumentTop){
      Logo.className = 'largeLogo';
    size = 0;
    }
  }
</script>

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

  function load_ad() {
    // put here the code to load your ads
    (adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: "ca-pub-3514636835854223",
        enable_page_level_ads: true
    });
  }

  new LazyLoad({
    elements_selector: "#google_ad",
    callback_enter: load_ad
  });
</script>
<script>
    $(document).ready(function() {
      /******************************
          BOTTOM SCROLL TOP BUTTON
      ******************************/
      // declare variable
      var scrollTop = $(".scrollTop");
      $(window).scroll(function() {
        // declare variable
        var topPos = $(this).scrollTop();
        // if user scrolls down - show scroll to top button
        if (topPos > 100) {
          $(scrollTop).css("opacity", "0.7");
        } else {
          $(scrollTop).css("opacity", "0");
        }
      }); // scroll END
      //Click event to scroll to top
      $(scrollTop).click(function() {
        $('html, body').animate({
          scrollTop: 0
        }, 800);
        return false;
      }); // click() scroll top EMD
    }); // ready() END
  </script>

  <script> // Content with blockquotes is missing a class. Script to add it otherwise Bootstrap wouldn't understand it
    $( "blockquote" ).last().addClass( "blockquote" );
  </script>

  <div id="fb-root"></div>  {* required to enable Facebook plugins *}
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
  <script>
    $(document).ready(function() {
        $.getScript('https://assets.pinterest.com/js/pinit.js', function(){});
    });
  </script>
<!--script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script-->