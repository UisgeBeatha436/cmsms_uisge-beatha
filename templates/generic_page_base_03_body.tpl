<!-- parsed: 2 of 3 --> 
<body class="{$addClass}">

{* include svg/shape.svg once *}
{*svgdata inline=1 assetsbase=1 file='svg/shape.svg' tpl="{#theme_resource#}txt_svg.tpl"*}

{include file="{#theme_resource#}generic_nojs_google_tag_manager.tpl"}

{* block name='body_header'}
  <header data-visible="on" id="js_header">
    <div class="header-content">
      {cms_selflink dir='start' text="{sitename}"}
    </div>
  </header>
{/block *}

{*
A) <img src="my-navbar-image.png" class="img-fluid" alt="My responsive image.">
B) https://stackoverflow.com/questions/42460930/how-to-resize-navbar-logo-on-scroll-down

*}

{block name='body_nav'}
   {* <nav class="navbar fixed-top navbar-expand-lg navbar-transparent bg-white navbar-absolute" color-on-scroll="400">
    <div class="container">
      <a class="navbar-brand" href="#" title="{sitename}"><img id="header-logo" class="logo"  alt="{sitename}" src="//uisge-beatha.eu/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.png" height="150vh"/></a> { * https://www.freeiconspng.com/uploads/sailing-boat-png-29.png src="//uisge-beatha.eu/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.png"/> * }
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        {Navigator action='default' template="{#theme_resource#}navigator_navigation_multilevel_bootstrap_menu.tpl"}
        <form class="form-inline ml-auto" data-background-color>
          <div class="form-group has-white">
            <input type="text" class="form-control" placeholder="Ik zoek">
          </div>
        </form>
      </div>
    </div>
  </nav> *}
  <div class="container">
    <nav class="navbar fixed-top navbar-expand-lg navbar-light  navbar-absolute" color-on-scroll="400">
      {* <a class="navbar-brand" href="#">Uisge Beatha</a> *}
      <a class="navbar-brand" href="{root_url}" title="{sitename}"><img id="header-logo" class="logo"  alt="{sitename}" src="//uisge-beatha.eu/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.png" height="150vh"/> {* https://www.freeiconspng.com/uploads/sailing-boat-png-29.png src="//uisge-beatha.eu/uploads/images/cms/Dehler%20-%20logo%20transparant%20lunarpic.png"/> *}
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        {Navigator action='default' template="{#theme_resource#}navigator_navigation_multilevel_bootstrap_menu.tpl"}
        <form class="form-inline ml-auto" data-background-color>
            <div class="form-group has-white">
              <input type="text" class="form-control" placeholder="Ik zoek">
            </div>
        </form>
      </div>
    </nav>
  </div>
{/block}
<div class="wrapper">
  {block name='body_content'}
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
        <div class="content">
          <div class="row">
            <div class="col-md-3"> {* l-three-col-one *}
              Made with <a href="https://www.cmsmadesimple.org/">CMS Made Simple</a> {custom_copyright}<br><br>
              <a href="{get_current_url}#a-content" class="shape-link"><span>TOP</span></a>
            </div>
            <div class="col-md-5">
              <h3>Waar bevindt Uisge Beatha zich?</h3>
              <script> 
                width='100%';	// the width of the embedded map in pixels or percentage 
                height='300';	// the height of the embedded map in pixels or percentage 
                border='1';	// the width of the border around the map (zero means no border) 
                shownames='true';	// to display ship names on the map (true or false) 
                latitude='51.7143';	// the latitude of the center of the map, in decimal degrees 
                longitude='04.0889';	// the longitude of the center of the map, in decimal degrees 
                zoom='11';	// the zoom level of the map (values between 2 and 17) 
                maptype='0';	// use 0 for Normal Map, 1 for Satellite, 2 for OpenStreetMap 
                trackvessel='' //244770624';	 MMSI of a vessel (note: vessel will be displayed only if within range of the system) - overrides "zoom" option 
                fleet='';	// the registered email address of a user-defined fleet (user's default fleet is used) 
                // Read more at http://www.marinetraffic.com/en/p/embed-map#6YXCVvOUaBxYHgoT.99
              </script> 
              <script type="text/javascript" src="//www.marinetraffic.com/js/embed.js"></script>
            </div>
            <div class="col-md-3">
              <h3>Nieuwtjes ontvangen?</h3>
              {CGBetterForms form="mailingForm"}
            </div>
          </div>
        </div>
      </div>
    </footer>
    
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div calss="pull-center">FrontEndStudio &copy;
          </div>
        </div>
        <div class="col-md-6">
          <h4>Leuk als dit wordt gedeeld</h4>
          <p>social media buttons</p>
          <button class="btn btn-twitter">
            <i class="fab fa-twitter"></i> Connect with Twitter
          </button>
          <button class="btn btn-icon btn-neutral btn-twitter">
						<i class="fab fa-twitter"></i>
					</button>
          <a href="#pablo" class="btn btn-primary btn-icon btn-round">
              <i class="fab fa-twitter"></i>
          </a>
          <div class="col-md-4 col-sm-5">
            <p class="category">Default</p>
            <button class="btn btn-twitter">
              <i class="fab fa-twitter"></i> Connect with Twitter
            </button>
          </div>
          <div class="col-md-1 col-sm-1">
            <p class="category">&nbsp;</p>
            <button class="btn btn-icon btn-twitter">
              <i class="fab fa-twitter"></i>
            </button>
          </div>
      </div>
    </div>

    {capture}
      <div class="scroll" data-visible="off" id="js_scroll">
        { * $svg_file = "$theme_relative_url/svg/shape.svg" * }
        {$svg_file = "/svg.svg"}
        {svgdata assetsbase=1 file='svg/shape.svg' assign='svgdata'}
        {$key = 'angle-up'}
        {math assign="_w" format='%.0f' equation=((1000 - $svgdata[$key]->w) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
        {math assign="_h" format='%.0f' equation=((1000 - $svgdata[$key]->h) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
        <a data-scroll href="{get_current_url}#a-content">
          <svg class="icon" viewBox="0 0 1000 1000" preserveAspectRatio="xMidYMid meet">
            { * <use class="custom-{$key}" xlink:href="{$svg_file}#custom-circle" transform="translate(50 50) scale(0.90)"/> * }
            <use class="shape-{$key}" transform="translate({$_w} {$_h}) scale(0.70)" xlink:href="{$svg_file}#shape-{$key}"/>
          </svg>
        </a>
      </div>
    {/capture}
  {/block}
</div>

{block name='js_footer'}
  {include file="{#theme_resource#}generic_js_footer.tpl"}
  {include file="{#theme_resource#}generic_js_google_analytics.tpl"}
{/block}

{if isset($page_js_footer) && $page_js_footer != ''}
  {$page_js_footer}
{/if}

</body>
{* <!-- /parsed 2 of 3 --> *}