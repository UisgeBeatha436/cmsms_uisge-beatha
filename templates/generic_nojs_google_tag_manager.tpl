{if $smarty.server.SERVER_NAME|lower eq 'yourdomain.com'}
  {* Please:
    - This template should be added after the body tag of your project
     - Fill in yourdomain
     - Add UA-code
     - Remove comments
  *}
  {*
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-XXX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
  *}
{else}
  <!-- generic_nojs_google_tag_manager is turned off for: ({$smarty.server.SERVER_NAME|lower}) -->
{/if}