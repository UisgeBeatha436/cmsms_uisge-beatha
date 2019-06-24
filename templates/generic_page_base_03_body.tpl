{* area: 3 of 3 generic page base 03 *}
{$three=3 scope='global'}
<body class="{page_attr key='extra1'}">
  {strip}
    <a name="top"></a>
	  {* include svg/shape.svg once *}
    {svgdata inline=1 assetsbase=1 file='svg/shape.svg' tpl="cms_template:txt_svg"}
  {/strip}
  {minify_html_block enabled='1' collapse_whitespace='1' collapse_json_lt='0'}
  {* /area: 3 of 3 *}
    {* -- Cookie EU Banner -- *}
    {capture assign='_cookie'}
      {include file="{#theme_resource#}generic_page_body_cookie.tpl"}
    {/capture}
    {$_cookie|strip}
    {* Search Modal *}
    {capture assign='_modal_search'}
      {include file="{#theme_resource#}generic_page_body_search.tpl"}
    {/capture}
    {$_modal_search|strip}
    {*include file="{#theme_resource#}generic_nojs_google_tag_manager.tpl"*}
    {include file="{#theme_resource#}generic_page_body_header.tpl"}
    {*
    A) <img src="my-navbar-image.png" class="img-fluid" alt="My responsive image.">
    B) https://stackoverflow.com/questions/42460930/how-to-resize-navbar-logo-on-scroll-down
    *}
    {capture assign='_main'}
      <main>
        <div class="container-fluid pl-0 pr-0">
          {block name='body_content'} {* this block displays the actual content *}
              <div class="row">
                <a id="a-content"></a>
                <div class="col-md-12">
                  {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_navigation.tpl"}<br>
                </div>
                <div class="col-12">
                  <h1>{title}</h1>
                  {$content}
                </div>
              </div>
          {/block}
        </div>
      </main> {* End main *}
    {/capture}
    {$_main|strip}
    {* Footer *}
      {include|strip file="{#theme_resource#}generic_page_footer.tpl"}
    {* /.Footer *}
    {include file="{#theme_resource#}generic_js_footer.tpl"}
    {if isset($page_js_footer)}
      {$page_js_footer}
      {include|strip file="{#theme_resource#}generic_page_js_footer.tpl"} {* used in the page logic area *}
    {/if}
    {*include|strip file='cms_template:svgIcons'*}
    {* CookiesEUBanner 12jun19 moved to js-template, not sure if it works *}
    {*if isset($smarty.cookies.hasConsent)*}
      {block name='js_footer'}
        {*include file="{#theme_resource#}generic_js_google_analytics.tpl" code is part of the cookie acceptance above *}
        {include file="{#theme_resource#}generic_js_footer_google_tag_manager.tpl"}
      {/block}
    {*/if*}
    {include|strip file='cms_template:AIS_location'}
  {/minify_html_block}
</body>
{* tmpl: body:end *}