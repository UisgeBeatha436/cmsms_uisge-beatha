{* <!-- parsed: 2 of 3 --> *}
<body>

{* include svg/shape.svg once *}
{*svgdata inline=1 assetsbase=1 file='svg/shape.svg' tpl="{#theme_resource#}txt_svg.tpl"*}

{include file="{#theme_resource#}generic_nojs_google_tag_manager.tpl"}

{block name='body_header'}
  <header data-visible="on" id="js_header">
    <div class="header-content">
      {cms_selflink dir='start' text="{sitename}"}
    </div>
  </header>
{/block}

{block name='body_nav'}
  {*<nav class="" data-visible="on" id="js_nav">{Navigator action='default' template="{#theme_resource#}navigator_navigator_multilevel_menu.tpl"}</nav>*}
  
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Uisge Beatha</a>
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
{/block}

{block name='body_content'}
  <div class="l-full">
    <div class="l-content">
      <a id="a-content"></a>
      {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_navigation.tpl"}<br>
      <h1>{title}</h1>
      {$content}
    </div>
  </div>
{/block}

{block name='body_footer'}
<footer data-visible="on" id="js_footer">
  <div class="l-footer">
    Made with <a href="https://www.cmsmadesimple.org/">CMS Made Simple</a> {custom_copyright}
  </div>
</footer>

{capture}
<div class="scroll" data-visible="off" id="js_scroll">

  {*$svg_file = "$theme_relative_url/svg/shape.svg"*}
  {$svg_file = "/svg.svg"}
  {svgdata assetsbase=1 file='svg/shape.svg' assign='svgdata'}
  {$key = 'angle-up'}

  {math assign="_w" format='%.0f' equation=((1000 - $svgdata[$key]->w) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
  {math assign="_h" format='%.0f' equation=((1000 - $svgdata[$key]->h) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
  <a data-scroll href="{get_current_url}#a-content">
    <svg class="icon" viewBox="0 0 1000 1000" preserveAspectRatio="xMidYMid meet">
      {* <use class="custom-{$key}" xlink:href="{$svg_file}#custom-circle" transform="translate(50 50) scale(0.90)"/> *}
      <use class="shape-{$key}" transform="translate({$_w} {$_h}) scale(0.70)" xlink:href="{$svg_file}#shape-{$key}"/>
    </svg>
  </a>

</div>
{/capture}

<div class="l-full">
  <div class="l-footer">
    FrontEndStudio &copy;
  </div>
</div>
{/block}

{block name='js_footer'}
  {include file="{#theme_resource#}generic_js_footer.tpl"}
  {include file="{#theme_resource#}generic_js_google_analytics.tpl"}
{/block}

{if isset($page_js_footer) && $page_js_footer != ''}
  {$page_js_footer}
{/if}

</body>
{* <!-- /parsed 2 of 3 --> *}