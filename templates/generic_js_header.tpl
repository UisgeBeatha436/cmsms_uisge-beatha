{*
  {capture assign='_js_header'}
    {$global_js_header}
    <!-- new content here -->
  {/capture}
  {$global_js_header=$_js_header scope='global'}
*}

{if isset($global_js_header) && $global_js_header != ''}
  {$global_js_header}
{/if}

{if "{#es6ModusModern#}" == 'on'}
  {include file="{#theme_resource#}generated/generated_js_header.tpl"}
{/if}

{if "{#es5Modus#}" == 'on'}
  {assign var=_unique_js_id value=10|mt_rand:30}
  <script src="{$theme_relative_url}/js/es5/modernizr.js?fes={$_unique_js_id}"></script>
  <script src="{$theme_relative_url}/js/es5/picturefill.js?fes={$_unique_js_id}"></script>
{/if}