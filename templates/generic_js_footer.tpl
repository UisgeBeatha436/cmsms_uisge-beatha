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

{if "{#es5Modus#}" == 'on'}
  {* https://frontendstudio.github.io/docs/javascript.html#templating-method-1 *}
  {assign var=_unique_js_id value=10|mt_rand:30}
   
  <!-- b: third party .js libs -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/js/es5/jquery.js?fes={$_unique_js_id}"><\/script>')</script>

  {* <script src="{$theme_dst_path}/assets/dst/js/es5/jquery.slim.js"></script>*}

  {*<script type="text/javascript" src="http://localhost/assets/src/cmsms_uisge-beatha/node_modules/jquery_lazyscript/jquery.lazyscript.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_dst_path}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script> *}

  <script src="{$theme_dst_path}/assets/dst/js/es5/bootstrap.js"></script> 
  <script src="{$theme_dst_path}/assets/dst/js/es5/now-ui-kit.js"></script>
  <script src="{$theme_dst_path}/assets/dst/js/es5/fontawesome.js"></script>

  {*<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>*}
  <script type="text/javascript" src="{$theme_dst_path}/assets/dst/js/es5/rellax.js"></script> {* Script for parallax Rellax *}
  <script src="{$theme_dst_path}/assets/dst/js/es5/cookies-eu-banner.js"></script>

  <!-- c: plug-ins that have dependencies on b: >>> plugins.js -->  
  {* <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script> * }
  <script type="text/javascript" src="https://unpkg.com/now-ui-kit@1.0.1/assets/js/now-ui-kit.js"></script>*}
  
  <!-- d: custom scripts >>> scripts.js -->
  
  {*theme path: {$theme_dst_path*}
  {*  <script>window.jQuery || document.write('<script src="{$theme_relative_url}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script>
      <script src="{$theme_relative_url}/js/es5/plugins.js?fes={$_unique_js_id}"></script> *}
  <script src="{$theme_dst_path}/assets/dst/js/es5/scripts.js"></script> {* ?fes={$_unique_js_id}" *}

{/if}


{if "{#es6ModusLegacy#}" == 'on'}
  {include file="{#theme_resource#}generated/generated_js_footer.tpl"}
{/if}

{block name='floatbox'}
  {include file='cms_template:floatbox_js_css'}
{/block}

{*<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script
			  src="https://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous"></script>*}
<script>
  var rellax = new Rellax('.rellax', {
    // center: true
    callback: function(position) {
        // callback every position change
        console.log(position);
    }
  });
</script>

<!--script src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@10.19.0/dist/lazyload.min.js"></script-->
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
</script>
<script>
  $(document).ready(function() {
       $.getScript('https://assets.pinterest.com/js/pinit.js', function(){});
   });
</script>

<!--script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script-->