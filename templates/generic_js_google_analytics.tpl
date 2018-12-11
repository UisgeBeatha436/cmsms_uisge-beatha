{if $smarty.server.SERVER_NAME|lower eq {$environment}}
  {* Please:
     - Fill in yourdomain
     - Add UA-code
     - Remove comments
  *}
  {*
  {literal}
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-XXXXX-X', 'auto');
      ga('send', 'pageview');
    </script>
  {/literal}
  *}
{else}
  <!-- generic_js_google_analytics is turned off for: ({$smarty.server.SERVER_NAME|lower}) -->
{/if}