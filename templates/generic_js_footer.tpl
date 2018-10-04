{*
  {capture assign='_js_footer'}
    {$global_js_footer}
  {/capture}
  {$global_js_footer=$_js_footer scope='global'}
*}

{if isset($global_js_footer) && $global_js_footer != ''}
  {$global_js_footer}
{/if}

{include file="{#theme_resource#}generic_js_browser_sync.tpl"}

{capture assign='es5'}
  {assign var=_unique_js_id value=10|mt_rand:30}
  <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.slim.min.js"></script>
  <script>window.jQuery || document.write('<script src="{$theme_relative_url}/js/es5/jquery.slim.js?fes={$_unique_js_id}"><\/script>')</script>
  <script src="{$theme_relative_url}/js/es5/plugins.js?fes={$_unique_js_id}"></script>
  <script src="{$theme_relative_url}/js/es5/scripts.js?fes={$_unique_js_id}"></script>
{/capture}

{capture assign='es6'}
  {include file="{#theme_resource#}generated/generated_js_footer.tpl"}
{/capture}

{*$es5*}
{$es6}

{block name='floatbox'}
  {include file='cms_template:floatbox_js_css'}
{/block}

<!-- script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script -->
<script
			  src="https://code.jquery.com/jquery-3.3.1.min.js"
			  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
			  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://unpkg.com/now-ui-kit@1.0.1/assets/js/now-ui-kit.js"></script>
<!--script src="assets/js/now-ui-kit-pro.js?v=1.2.2" type="text/javascript"></script-->


{* 14jun17 script for endeless scrolling of blog articles - https://www.cmscanbesimple.org/blog/cmsms-modules-and-endless-scrolling
  // contentSelector: '.jscroll', // loadingHtml: '<i class="icon-spinner3"></i>' *}
{* <script src="//unpkg.com/jscroll/dist/jquery.jscroll.min.js"></script>
<script>
$(function() {
    $('div.jscroll').jscroll( {
    nextSelector: 'a.jscroll-link:last',
    autoTrigger: true,
    debug: true
    
    } );
} );
</script>*}
