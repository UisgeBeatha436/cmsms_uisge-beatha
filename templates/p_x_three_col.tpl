{config_load file='theme.ini' scope='global' section='cmsms_sandbox'}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
	{$content_01="{content label='Content 01'}" scope='global'}
	{$content_02 = "{content block='content_02' label='Content 02'}" scope='global'}
	{$content_03 = "{content block='content_03' label='Content 03'}" scope='global'}
{/block}

{block name='body_content'}
	{include file="{#theme_resource#}generic_p_titlebar.tpl"}
	<div class="l-full">
		<div class="l-content" data-visible="on" id="js_content">

			<div class="l-three-col-one">
				<a id="a-content"></a>
				{$content_01}
			</div>

			<div class="l-three-col-two">
				{$content_02}
			</div>

			<div class="l-three-col-three">
				{$content_03}
			</div>

		</div>
	</div>
{/block}