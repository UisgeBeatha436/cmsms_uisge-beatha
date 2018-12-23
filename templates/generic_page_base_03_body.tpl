<!-- parsed: 2 of 3 generic page base 03 --> 
<body class="{page_attr key='extra1'}">
{strip}
  <div class="container">
    <div class="row alert alert-info text-center fixed-bottom" role="alert" id="cookies-eu-banner" style="display: none;">
      <div class="col-12 ml-auto mr-auto">
        <p>By continuing your visit to this site, you accept the use of cookies by Google Analytics to make visits statistics.</p>
      </div>
      <div class="col-12">
        <div class="text-center">
          <a class="btn btn-info pull-center btn-round" type="button" href="./read-more.html" id="cookies-eu-more">Meer info</a>
          <button type="button" class="btn btn-warning btn-round pull-center" id="cookies-eu-reject">Afwijzen</button>
          <button type="button" class="btn btn-succes btn-round pull-center" id="cookies-eu-accept">Accepteren</button>
        </div>
      </div>
    </div>
  </div>

  {* include svg/shape.svg once *}
  {* svgdata inline=1 assetsbase=1 file='svg/shape.svg' tpl="{#theme_resource#}txt_svg.tpl"*}

  {include file="{#theme_resource#}generic_nojs_google_tag_manager.tpl"}

  {block name='body_header'}
    <header data-visible="on" id="js_header">
      {*<div class="header-content">
        {cms_selflink dir='start' text="{$sitename}"}
      </div>*}
      
      {block name='body_nav'}
        <nav class="navbar navbar-color-on-scroll navbar-expand-lg fixed-top scrolling-navbar navbar-transparent" color-on-scroll="170"> {* bgdefault navbar-custom *}
          <div class="container-fluid">
            <div class="navbar-header">
            </div>
            <div class="navbar-translate">
              {* requires popper.js  rel="tooltip" *}
              {if $page_alias == 'hanse_311'}
                <a class="navbar-brand" href="{root_url}" rel="noreferrer" title="{$sitename} | Design based on Now_UI-Kit. Coded by Gregor" data-placement="bottom" target="_blank"><img id="header-logo" class="logo"  alt="{$sitename}" src="{CGSmartImage src="{uploads_url}/images/cms/Logo_Hanse_UisgeBeatha.png" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed=1}" height="90vh"/></a>
              {else}
                <a class="navbar-brand" href="{root_url}" rel="noreferrer" title="{$sitename} | Design based on Now_UI-Kit. Coded by Gregor" data-placement="bottom" target="_blank"><img id="header-logo" class="logo"  alt="{$sitename}" src="{CGSmartImage src="{uploads_url}/images/cms/Dehler-logo.png" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed=0}" height="90vh"/></a>
                {* https://svg-edit.github.io/svgedit/releases/latest/editor/svg-editor.html Logo_Dehler_UisgeBeatha.png *}
              {/if}
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar top-bar"></span>
                <span class="navbar-toggler-bar middle-bar"></span>
                <span class="navbar-toggler-bar bottom-bar"></span>
              </button>
            </div>
            <div class="collapse navbar-collapse" id="navbarNav" data-nav-image="{CGSmartImage src="{uploads_url}/images/cms/Dehler-logo.png" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed=0}" data-color="orange"> {* {CGSmartImage src="{uploads_url}/images/cms/Dehler-logo.png" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed=0}" {root_url}/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.svg" *}
              {Navigator action='default' template="{#theme_resource#}navigator_navigation_multilevel_bootstrap_menu.tpl"}

              {*global_content name='socialFollowButtons' shape='round' navbar='1'*}
              <form class="form-inline ml-auto text-dark" data-background-color="#990000">
                {if $browser_lang != 'nl'}
                  <div class="form-group my-md-2 col-sm-9">
                    {include file='cms_template:google_Translate'}
                  </div>
                {/if}
                <div class="form-group col-sm-3">
                  <a href="#modalSearch" data-toggle="modal" data-target="#modalSearch" role="button" aria-disabled="true">{svg use="search"}</a>  
                </div>
              </form>
            </div>
          </div>
          {*<div class="navbar-header navbar-search">
            <div class="form-inline">
              {if $browser_lang != 'nl'}
                <div class="form-group my-md-2 col-sm-9">
                  {include file='cms_template:google_Translate'}
                </div>
              {/if}
              <div class="form-group col-sm-3">
                <a href="#modalSearch" data-toggle="modal" data-target="#modalSearch" role="button" aria-disabled="true">{svg use="search"}</a>  
              </div>            
            </div>
          </div>*}
        </nav>
      {/block}
    </header>
  {/block}
  {*
  A) <img src="my-navbar-image.png" class="img-fluid" alt="My responsive image.">
  B) https://stackoverflow.com/questions/42460930/how-to-resize-navbar-logo-on-scroll-down
  *}

  <div class="wrapper">
    {block name='body_content'} {* this block displays the actual content *}
      <div class="container">
        <div class="row">
          <a id="a-content"></a>
          {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_navigation.tpl"}<br>
          <h1>{title}</h1>
          {$content}
        </div>
      </div>
    {/block}

    {block name='body_footer'}
      {* <footer  data-visible="on" id="js_footer"> *}
      <footer class="footer footer-big" data-background-color="grijs" data-visible="on" id="js_footer">   
        <div class="container-fluid">
          {*<div class="content">*}
            <div class="row">
              <div class="col-md-3 d-none d-sm-block float-left"> {* l-three-col-one *}
                <p>Made with <a href="https://www.cmsmadesimple.org/">CMS Made Simple</a> &copy; {custom_copyright}</p>
                <p>Op dit moment {visitors}.</p> {* Deze pagina is { HitCounter } keer bekeken.  *}
                {*<a href="{get_current_url}#a-content" class="shape-link"><span>TOP</span></a>
                <h4>Laatst gewijzigde pagina's</h4>
                {recently_updated number='3' css_class='text-left h6 small' *}
              </div>
              <div class="col-md-5 d-none d-sm-block" id="marinetraffic">
                <h3 class="font-weight-bold">Waar bevindt Uisge Beatha zich?</h3>
                {*<input type="button" class="button-class" onclick="function(click)">*}
                <!--script>
                  var width='100%';   // the width of the embedded map in pixels or percentage 
                  var height='300';   // the height of the embedded map in pixels or percentage 
                  var border='1'; // the width of the border around the map (zero means no border) 
                  var shownames='true';   // to display ship names on the map (true or false) 
                  var latitude='51.7143'; // the latitude of the center of the map, in decimal degrees 
                  var longitude='04.0889';    // the longitude of the center of the map, in decimal degrees 
                  var zoom='11';  // the zoom level of the map (values between 2 and 17) 
                  var maptype='0';    // use 0 for Normal Map, 1 for Satellite, 2 for OpenStreetMap 
                  var trackvessel='' //244770624';     MMSI of a vessel (note: vessel will be displayed only if within range of the system) - overrides "zoom" option 
                  var fleet='';   // the registered email address of a user-defined fleet (user's default fleet is used) 
                  / / Read more at http://www.marinetraffic.com/en/p/embed-map#6YXCVvOUaBxYHgoT.99
                </script>
                <script src="//www.marinetraffic.com/js/embed.js"></script-->
      
                {* <script>
                    var resource = document.createElement('script'); 
                    resource.async = "true";
                    resource.src = "//www.marinetraffic.com/js/embed.js";
                    var script = document.getElementsByTagName('script')[0];
                    script.parentNode.insertBefore(resource, script);
                </script> *}
                {*<script type="text/javascript">
                  //function myFunc(e) {
                    // var script = document.createElement('script');
                    ///script.src = '{root_url}/assets/src/js/marineTraffic.js';
                    ///script.type = 'text/javascript';
                    // $('head')[0].appendChild(script);
                    // }
                    // src="{root_url}/assets/src/js/marineTraffic.js";
                  //window.onload = init();
                  //   var script = document.createElement("script");
                    //  script.type = "text/javascript";
                    //  script.src = "{root_url}/assets/src/js/marineTraffic.js";
                  //   script.onclick = function(e){
                  //       alert("Script is ready!");
                    //  };
                  //   document.body.appendChild(script);
                // }

                </script>*}
                {cgsi_convert}
                {cge_cache_block expires=240}
                  {jsmin}
                    <script type="text/javascript">
                      // Map appearance
                      var width="100%";         // width in pixels or percentage
                      var height="200";         // height in pixels
                      var names=false;           // always show ship names (defaults to false)

                      // Single ship tracking
                      var mmsi="244770624";     // display latest position (by MMSI)
                      var imo="244770624";      // display latest position (by IMO, overrides MMSI)
                      var show_track=true;      // display track line (last 24 hours)
                    </script>
                    <script type="text/javascript" src="https://www.vesselfinder.com/aismap.js"></script>
                  {/jsmin}
                {/cge_cache_block}
                {/cgsi_convert}
              </div>
              <div class="col-md-3 ml-md-3 ml-sm-1 font-weight-bold">
                <h3 class="font-weight-bold">Nieuwtjes ontvangen?</h3>
                {CGBetterForms form="mailingForm"}
              </div>
            </div>
          {* </div> *}
        </div>
      </footer>
      {*<div class="container">
        <div class="row ">
          <div class="col-md-6">
            <div class="pull-center copyright" id="copyright" >FrontEndStudio &copy;
            </div>
          </div>
          <div class="col-md-6">
            <h4>Leuk als dit wordt gedeeld</h4>
          </div>
        </div> *}
        <footer class="footer" data-footer-background-color="blue_gradient">
          <div class="container">
            <a class="footer-brand" href="#uisge-beatha">{$sitename}</a>
            {*<ul class="pull-center"></ul>*}
            {Navigator action='default' template="{#theme_resource#}navigator_navigation.tpl"}
            {global_content name='socialFollowButtons' shape='neutral' link='1'}
          </div>
        </footer>
      {*capture}
        <div class="scroll" data-visible="off" id="js_scroll">
          {$svg_file = "$theme_relative_url/svg/shape.svg"}
          {$svg_file = "/svg.svg"}
          {svgdata assetsbase=1 file='svg/shape.svg' assign='svgdata'}
          {$key = 'angle-up'}
          {math assign="_w" format='%.0f' equation=((1000 - $svgdata[$key]->w) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
          {math assign="_h" format='%.0f' equation=((1000 - $svgdata[$key]->h) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
          <a data-scroll href="{get_current_url}#a-content">
            <svg class="icon" viewBox="0 0 1000 1000" preserveAspectRatio="xMidYMid meet">
              <use class="custom-{$key}" xlink:href="{$svg_file}#custom-circle" transform="translate(50 50) scale(0.90)"/>
              <use class="shape-{$key}" transform="translate({$_w} {$_h}) scale(0.70)" xlink:href="{$svg_file}#shape-{$key}"/>
            </svg>
          </a>
        </div>
      {/capture*}
    {/block} 
  </div>
  
  {block name='js_footer'}
    {include file="{#theme_resource#}generic_js_footer.tpl"}
    {include file="{#theme_resource#}generic_js_google_analytics.tpl"}
    {include file="{#theme_resource#}generic_js_footer_google_tag_manager.tpl"}
  {/block}

  {if isset($page_js_footer) && $page_js_footer != ''}
    {$page_js_footer}
  {/if}
  <div id="stop" class="scrollTop"> {* used to scroll to the top of the page *}
    {svg use="up-hand"}
  </div>
  {include file='cms_template:svgIcons'}
{/strip}
</body>

{* <!-- /parsed 2 of 3 --> *}