{* more information: browsersync.io *}

{* you can also include this file in:
  ./lib/assets/templates/cmsms-error-console.tpl just before </body> *}
{* turn on by setting $_browser_sync='true' *}
{* turn off by setting $_browser_sync='' or remove the code *}

{$_browser_sync = 'false'}

{if $_browser_sync != ''}
  {literal}
    <script id="__bs_script__">//<![CDATA[
    document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.js?v=2.26.3'><\/script>".replace("HOST", location.hostname));
//]]></script>
  {/literal}
{/if}
