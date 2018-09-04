{config_load file='theme.ini' scope='global' section='cmsms_sandbox'}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
  {$content_01="{content label='Content 01'}" scope='global'}
{/block}

{block name='body_content'}
  {include file="{#theme_resource#}generic_p_titlebar.tpl"}
  <div class="l-full">
    <a id="a-content"></a>
    <div class="l-content" data-visible="on" id="js_content">
      {include file="{#theme_resource#}generic_p_titlebar.tpl"}
      {$content_01}
    </div>
  </div>
{/block}