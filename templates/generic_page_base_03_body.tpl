<!-- parsed: 2 of 3 generic page base 03 --> 

<body class="{page_attr key='extra1'}">
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
  {*svgdata inline=1 assetsbase=1 file='svg/shape.svg' tpl="{#theme_resource#}txt_svg.tpl"*}

{include file="{#theme_resource#}generic_nojs_google_tag_manager.tpl"}

{block name='body_header'}
  {*<header data-visible="on" id="js_header"> *}
    {*<div class="header-content">
      {cms_selflink dir='start' text="{$sitename}"}
    </div>*}
    
    {block name='body_nav'}
      <nav class="navbar navbar-color-on-scroll navbar-expand-lg fixed-top navbar-transparent" color-on-scroll="170"> {* bgdefault navbar-custom *}
        <div class="container-fluid">
          <div class="navbar-header">
            
          </div>
          <div class="navbar-translate">
            {cgsi_convert} {* requires popper.js  rel="tooltip" *}
              {if $page_alias == 'hanse_311'}
                <a class="navbar-brand" href="{root_url}"  title="{$sitename} | Design based on Now_UI-Kit. Coded by Gregor" data-placement="bottom" target="_blank"><img id="header-logo" class="logo"  alt="{$sitename}" src="{uploads_url}/images/cms/Logo_Hanse_UisgeBeatha.png" height="90vh"/>
              {else}
                <a class="navbar-brand" href="{root_url}"  title="{$sitename} | Design based on Now_UI-Kit. Coded by Gregor" data-placement="bottom" target="_blank"><img id="header-logo" class="logo"  alt="{$sitename}" src="{uploads_url}/images/cms/Logo_Dehler_UisgeBeatha.png" height="90vh"/>
              {/if}
              </a>
            {/cgsi_convert}
            {*<a class="navbar-brand" href="{root_url}" rel="tooltip" title="Design based on Now_UI-Kit. Coded by Gregor" data-placement="bottom" target="_blank">
              Now Ui Kit Pro
            </a>*}
            {*<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-bar top-bar"></span>
              <span class="navbar-toggler-bar middle-bar"></span>
              <span class="navbar-toggler-bar bottom-bar"></span>
            </button>*}
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-bar top-bar"></span>
              <span class="navbar-toggler-bar middle-bar"></span>
              <span class="navbar-toggler-bar bottom-bar"></span>
            </button>
            {*<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon navbar-light"></span>
            </button>*}
          </div>
          <div class="collapse navbar-collapse" id="navbarNav" data-nav-image="{root_url}/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.svg" data-color="orange">
            {Navigator action='default' template="{#theme_resource#}navigator_navigation_multilevel_bootstrap_menu.tpl"}
            {*global_content name='socialFollowButtons' shape='round' navbar='1'*}
            <form class="form ml-auto text-dark" data-background-color="#990000">
              {if $browser_lang != 'nl'}
                <div class="form-group">
                  {include file='cms_template:google_Translate'}
                </div>
                </div>
              {/if}
              <div class="row">
              <div class="col-md-12">
                

                  {* <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text bg-transparent border-right-0">{svg use="search"}</span>
                    </div>
                    <input class="form-control py-0 border-left-0 border" type="text" value="..." id="zoekForm" name="q" required>
                    <div class="input-group-append">
                      <button class="btn btn-outline-secondary border-left-0 border" type="button">
                          Zoek
                      </button>
                    </div>
                  </div> *}
                  <div class="input-group">
                    {*<div class="input-group-prepend">
                      <div class="input-group-text">{svg use="search"}</div>*}
                            <a href="#modalSearch" data-toggle="modal" data-target="#modalSearch" role="button" aria-disabled="true">{svg use="search"}</a>
                            
                    <!--/div-->
                    <!-- Button trigger modal -->

                    {*<input type="text" class="form-control" placeholder="Ik zoek" style="color:white;"/> 
                    If you want a more sophisticated solution read about Google's reCAPTCHA service *}
                    
                    {*<form formaction="zoeken" formenctype="multipart/form-data" formmethod="get" style="color:white;"/>
                        <input class="form-control"  type="text" id="zoekForm" name="q" placeholder="Zoek" required>
                        <input type="submit" value="Ga" formaction="/zoeken" id="submit" style="position: absolute; left: -9999px; width: 1px; height: 1px; "tabindex="-1">
                    </form>*}
                  </div>
              </div>
              </div>
            </form>
          </div>
        </div>
      </nav>
    {*  <nav class="navbar navbar-expand-lg fixed-top navbar-dark danger-color">
        <div class="container-fluid">
          <div class="navbar-translate">
            <a class="navbar-brand" href="{root_url}" title="{$sitename}" data-placement="bottom"><img id="header-logo" class="logo"  alt="{$sitename}" src="//uisge-beatha.eu/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.png" height="150vh"/>
            </a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse text-dark" id="navbarSupportedContent">
            {Navigator action='default' template="{#theme_resource#}navigator_navigation_multilevel_bootstrap_menu.tpl"}
            <form class="form-inline ml-auto text-dark" data-background-color="#990000">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Ik zoek" style="color:blue;">
              </div>
            </form>
          </div>
        </div>
      </nav> *}
    {/block}

  {*</header>*}
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
    <footer class="footer footer-big" data-background-color="grijs">   
      <div class="container-fluid">
        {*<div class="content">*}
          <div class="row">
            <div class="col-md-3 d-none d-sm-block float-left"> {* l-three-col-one *}
              <p>Made with <a href="https://www.cmsmadesimple.org/">CMS Made Simple</a> &copy; {custom_copyright}</p>
              <p>Deze pagina is {* HitCounter *} keer bekeken. Op dit moment {visitors}.</p><br />



              {*<a href="{get_current_url}#a-content" class="shape-link"><span>TOP</span></a>
              <h4>Laatst gewijzigde pagina's</h4>
              {recently_updated number='3' css_class='text-left h6 small' *}
            </div>
            <div class="col-md-5 d-none d-sm-block" id="marinetraffic">
              <h3 class="font-weight-bold">Waar bevindt Uisge Beatha zich?</h3>
              {*<input type="button" class="button-class" onclick="function(click)">*}
              <script>
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
                // Read more at http://www.marinetraffic.com/en/p/embed-map#6YXCVvOUaBxYHgoT.99
              </script>
              <script src="http://www.marinetraffic.com/js/embed.js"></script>
    
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
            </div>
            <div class="col-md-3 ml-md-3 ml-sm-1 font-weight-bold">
              <h3 class="font-weight-bold">Nieuwtjes ontvangen?</h3>
              {CGBetterForms form="mailingForm"}
            </div>
          </div>
        {* </div> *}
      </div>
    </footer>
    
    {* <div class="container">
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
 
</body>

{* <!-- /parsed 2 of 3 --> *}