{if $smarty.server.SERVER_NAME|lower eq {$environment}}
  {* Please:
    - This template should be added after the body tag of your project
     - Fill in yourdomain
     - Add UA-code
     prod: GTM-M95RWP
     develop: GTM-W56XLX5
     - Remove comments
  *}
  <noscript><iframe src="https://www.googletagmanager.com/ns.html?id={$google_code_global}"
  height="0" width="0" style="display:none;visibility:hidden" title="googletagmanager"></iframe></noscript>
{else}
  <!-- generic_nojs_google_tag_manager is turned off for: ({$smarty.server.SERVER_NAME|lower}) -->
{/if}