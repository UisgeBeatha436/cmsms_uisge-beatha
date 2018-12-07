{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}
{extends file="{#theme_resource#}page_base.tpl"}
{assign var='addClass' value="landing-page"}

{block name='open_content' append}
	{$content_01 = "{content label='Content 01'}" scope='global'}
	{$content_02 = "{content block='content_02' label='Content 02'}" scope='global'}
	{$content_03 = "{content block='content_03' label='Content 03'}" scope='global'}
{/block}

{block name='body_content'}
	{include file="{#theme_resource#}generic_p_titlebar.tpl"}
	{*<div class="l-content" data-visible="on" id="js_content">*}
	<div class="section section-content">
		<div class="container">
			<div class="row">
				<div class="section col-md-2 ml-auto mr-auto text-center">
					<a id="a-content"></a>
					{$content_01}
				</div>
				<div class="section col-12 col-md-8 ml-auto mr-auto">
					<a id="a-content"></a>
					{$content_02}
				</div>
				<div class="section col-md-2 ml-auto mr-auto">
					<a id="a-content"></a>
					{$content_03}
				</div>
			</div>
		</div>
	</div>
{/block}