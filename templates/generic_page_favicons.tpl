{* favicons *}
<link rel="icon" type="image/png" href="{$theme_relative_url}/favicons/favicon.ico">
<link rel="icon" type="image/png" href="{$theme_relative_url}/favicons/favicon-16x16.png" sizes="16x16">  
<link rel="icon" type="image/png" href="{$theme_relative_url}/favicons/favicon-32x32.png" sizes="32x32">  
<link rel="icon" type="image/png" href="{$theme_relative_url}/favicons/android-chrome-192x192.png" sizes="192x192">  

{* disable tap highlight on IE *}
<meta name="msapplication-tap-highlight" content="no">

{* web application manifest *}
<link rel="manifest" href="{$theme_relative_url}/favicons/manifest.json">

{* add to homescreen for chrome on android *}
<meta name="mobile-web-app-capable" content="yes">
<meta name="application-name" content="{sitename}">
<link rel="icon" type="image/png" sizes="192x192" href="{$theme_relative_url}/favicons/android-chrome-192x192.png">

{* add to homescreen for safari on ios *}
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="{sitename}">
{* <meta name="application-name" content="{sitename}"> *}
<link rel="apple-touch-icon" href="{$theme_relative_url}/favicons/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="57x57" href="{$theme_relative_url}/favicons/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="{$theme_relative_url}/favicons/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="{$theme_relative_url}/favicons/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="{$theme_relative_url}/favicons/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="{$theme_relative_url}/favicons/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="{$theme_relative_url}/favicons/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="{$theme_relative_url}/favicons/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="{$theme_relative_url}/favicons/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="167x167" href="{$theme_relative_url}/favicons/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="180x180" href="{$theme_relative_url}/favicons/apple-touch-icon-180x180.png">
<link rel="mask-icon" href="{$theme_relative_url}/favicons/safari-pinned-tab.svg" color="#ffffff">

{* 
 tile icon for win8 (144x144 + tile color)
 Note: the 270x will be scaled to 150x on low-density screens.
*}
<meta name="msapplication-config" content="{$theme_relative_url}/favicons/browserconfig.xml">
<meta name="msapplication-TileImage" content="{$theme_relative_url}/favicons/mstile-144x144.png">
<meta name="msapplication-TileColor" content="#ffffff">

{* color the status bar on mobile devices *}
<meta name="theme-color" content="#ffffff">