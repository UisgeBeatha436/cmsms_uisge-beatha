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
  {* cache buster *}
  {if "{#browsersyncModus#}" == 'on'}
    {assign var=_unique_js_id value=10|mt_rand:3000000}
  {else}
    {assign var=_unique_js_id value=1}
  {/if}
  <script defer src="{$theme_relative_url}/js/es5/modernizr.js?fes={$_unique_js_id}"></script>
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  {* <script defer src="{$theme_relative_url}/js/es5/picturefill.js?fes={$_unique_js_id}"></script> *}
{/if}