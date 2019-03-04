{* Google Tag Manager (noscript) 
    prod: GTM-M95RWP
    develop: GTM-W56XLX5
*}
{strip}
{if $smarty.server.SERVER_NAME|lower eq {$environment}}
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M95RWP"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    {if !(isset($created_date))}
        {$created_date = "{$last_modified}"}
    {/if}
    <script type="application/ld+json">
        {
        "@context": "http://schema.org",
        "@type": "NewsArticle",
        "mainEntityOfPage": {
            "@type": "WebPage",
            "@id": "{$canonical}"
            },
        {literal}
        "potentialAction": {
            "@type": "SearchAction",
            "target": "https://www.uisge-beatha.eu/zoeken?q={Uisge Beatha}",
            "query-input": "required name=Uisge_Beatha"
            },
        {/literal}
        "name": "Uisge Beatha",
        "publisher": {
            "@type": "Organization",
            "name": "Uisge Beatha",
            "logo": {
                "@type": "ImageObject",
                "url": "{$page_image}"
            }
        },
        "author": {
            "@type": "Person",
            "name": "Gregor de Graaf"
        },
        "headline": "{$page_title}",
        "dateModified": "{$last_modified}",
        "datePublished": "{$created_date}",
        "image": "{$page_image}",
        "url": "{$canonical}",
        "description": "{$description_global}",
        "sameAs": [
            "https://www.facebook.com/uisgebeatha.eu/",
            "https://nl.pinterest.com/gjdgraaf/uisge-beatha/",
            "https://twitter.com/GJdeGraaf",
            "https://plus.google.com/+GregordeGraaf"
        ]
        }
    </script>
{else}
      <!-- generic_js_footer_google_tag_manager is turned off for: ({$smarty.server.SERVER_NAME|lower}) -->
{/if}
{* End Google Tag Manager (noscript) *}
{/strip}