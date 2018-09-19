{config_load file='theme.ini' scope='global' section='ccmsms_uisge-beatha'}
{extends file="{#theme_resource#}page_base.tpl"}
{assign var='addClass' value="product-page"}

{block name='open_content' append}
	{$content_01="{content label='Content 01'}" scope='global'}
	{$content_02 = "{content block='content_02' label='Content 02'}" scope='global'}
{/block}

{block name='body_content'}
	{include file="{#theme_resource#}generic_p_titlebar.tpl"}
	<div class="l-full">
		<div class="l-content" data-visible="on" id="js_content">

			<div class="l-two-col-left-bar-one">
				<a id="a-content"></a>
				{$content_01}
			</div>

			<div class="l-two-col-left-bar-two">
				{$content_02}
			</div>

		</div>
	</div>
{/block}