{if {$smarty.server.SERVER_NAME|lower} eq 'uisge-beatha'}
  {* Please:
     - this template should be added to the head of your template
     - Fill in yourdomain
     - Add GTM-code --->> M95RWP
     - Implement your dataLayer strategy (optional)
     - Remove comments
  *}

  {capture assign='datalayer'}
    {literal}

      dataLayer = [];

      dataLayer = [{
        'valueName': 'value',
      }];

      dataLayer.push(
        'valueName': 'value',
      );

    {/literal}
  {/capture}

  <script>
    {$datalayer}
    {literal}
      (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','GTM-M95RWP');
    {/literal}
  </script>
{else}
  <!-- generic_js_google_tag_manager is turned off for: ({$smarty.server.SERVER_NAME|lower}) -->
{/if}