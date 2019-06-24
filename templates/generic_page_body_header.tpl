{* generic_page_body_header.tpl *}
{strip}
  {block name='body_header'}
    <header data-visible="on" id="js_header">
      {* <div class="header-content">
        {cms_selflink dir='start' text="{$sitename}"}
      </div> *}
      {block name='body_nav'}
        <nav id="navbarHeader" class="navbar navbar-color-on-scroll navbar-expand-lg fixed-top scrolling-navbar navbar-transparent"> {*  color-on-scroll="150" bgdefault navbar-custom *}
          <div class="container-fluid">
            <div class="navbar-header">
            </div>
            {* <div class="navbar-translate"> *}
              {* requires popper.js  rel="tooltip" *}
              {if $page_alias == 'hanse_311'}
                <a class="navbar-brand" href="{root_url}" rel="noreferrer" title="{$sitename} | Design based on MDBootstrap. Coded by Gregor" data-placement="bottom" target="_blank">
                  <img id="header_logo" class="logo lozad"  data-src="{uploads_url}/images/cms/Logo_Hanse_UisgeBeatha.png" alt="{$sitename}" title="{$sitename}">
                  {*<img id="header_logo" class="logo"  alt="{$sitename}" src="{CGSmartImage src="{uploads_url}/images/cms/Logo_Hanse_UisgeBeatha.png" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed={$noembed}}">*}
                </a>
              {else}
                <a class="navbar-brand" href="{root_url}" rel="noreferrer" title="{$sitename} | Design based on MDBootstrap. Coded by Gregor" data-placement="bottom" target="_blank">
                  <img id="header_logo" class="logo lozad" data-src="{uploads_url}/images/cms/Logo_Dehler_UisgeBeatha-png.png" alt="{$sitename}" title="{$sitename}" height="90">
                  {*<img id="header_logo" class="logo"  alt="{$sitename}" src="{CGSmartImage src="{uploads_url}/images/cms/Logo_Dehler_UisgeBeatha.svg" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed={$noembed}}" height="90">*}
                </a>
                {* https://svg-edit.github.io/svgedit/releases/latest/editor/svg-editor.html Logo_Dehler_UisgeBeatha.png *}
              {/if}
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation" aria-controls="navigation"> {*aria-controls="navigation-index"*}
                  <span class="navbar-toggler-icon">
                    <svg><use xlink:href="{$theme_relative_url}/svg/shape.svg#menu"/></svg>
                    {*svg use="hamburger"*}
                  </span>
              </button>
            {* </div> *}
            <div class="collapse navbar-collapse" id="navigation"  > {* data-color="orange" data-nav-image="{CGSmartImage src="{uploads_url}/images/cms/Dehler-logo.png" alt="{$sitename}" title="{$sitename}" noresponsive='1' notag=1 noembed={$noembed}}" *}
              {Navigator action='default' template="{#theme_resource#}navigator_navigation_multilevel_bootstrap_menu.tpl"}
              {*global_content name='socialFollowButtons' shape='round' navbar='1'*}
              <form class="form-inline ml-auto text-dark" data-background-color="#990000">
                {if isset($browser_lang) && $browser_lang != 'nl'}
                  <div class="form-group my-md-2 col-sm-9">
                    {include file='cms_template:google_Translate'}
                  </div>
                {/if}
                <div class="form-group col-sm-3">
                  <a href="#modalSearch" data-toggle="modal" data-target="#modalSearch" role="button" aria-disabled="true">
                  {*svg use="search"*}
                    <span class="icon-search">
                        <svg><use xlink:href="{$theme_relative_url}/svg/shape.svg#search"/></svg>
                    </span>
                  </a>
                </div>
              </form>
            </div>
          </div>
        </nav>
      {/block}
    </header>
  {/block}
{/strip}