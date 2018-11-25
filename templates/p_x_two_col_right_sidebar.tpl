<!-- p x col right -->
{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}
{extends file="{#theme_resource#}page_base.tpl"}
{assign var='addClass' value="product-page"}

{block name='open_content' append}
	{$content_01="{content label='Content 01'}" scope='global'}
	{$content_02 = "{content block='content_02' label='Content 02'}" scope='global'}
{/block}

{block name='body_content'}
	{include file="{#theme_resource#}generic_p_titlebar.tpl"}
	<div class="section section-content">
		<div class="container">
			{* <div class="l-content" data-visible="on" id="js_content"> *}
			<div class="row">
				<div class="col-md-9 ml-auto mr-auto">
					{*<a id="a-content"></a>*}
					{$content_01}
				</div>
				<div class="col-md-3 d-none d-sm-block ml-auto mr-auto">
					{$content_02}
				</div> {* class sidebar right *}
			</div>
		</div>
	</div>
	</div>
{/block}