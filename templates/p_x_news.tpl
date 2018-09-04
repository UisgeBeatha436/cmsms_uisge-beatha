{config_load file='theme.ini' scope='global' section='cmsms_sandbox'}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
	{$content_01="{content label='Content 01'}" scope='global'}
	{$content_02 = "{content block='content_02' label='Content 02'}" scope='global'}
{/block}

{block name='body_content'}
	{include file="{#theme_resource#}generic_p_titlebar.tpl"}
	<div class="l-full">
		<a id="a-content"></a>
		<div class="l-content" data-visible="on" id="js_content">
			<div class="l-two-col-right-bar-one">

				{search action='default'
					formtemplate="{#theme_resource#}search_form.tpl"
					passthru_News_detailpage="news"
					resultpage='home'
					search_method='post'}

				{if isset($global_news_detail) && $global_news_detail == 1 ||
					isset($global_news_summary) && $global_news_summary == 1}
						{$content_01}
						<hr>
						{*news action='default' summarytemplate="{#theme_resource#}news_summary.tpl"*}
						{*news pagelimit='3' action='browsecat' browsecattemplate="{#theme_resource#}news_browse_category.tpl"*}
						<hr>
					{else}
						{$content_01}
						<hr>
						{news pagelimit='3' detailpage='news' summarytemplate="{#theme_resource#}news_summary.tpl" detailtemplate="{#theme_resource#}news_detail.tpl"}
						<hr>
					{/if}
				</div>
				<div class="l-two-col-right-bar-two">

					{$content_02}

					<hr>
					<h3>News categories</h3><br>

					{news pagelimit='3' action='browsecat' detailtemplate="{#theme_resource#}news_detail.tpl" summarytemplate="{#theme_resource#}news_summary.tpl" browsecattemplate="{#theme_resource#}news_browse_category.tpl"}<br>
					<div class="alert alert-secondary">{lipsum out='sentences' nr=1}</div>
					<div class="alert alert-secondary">{lipsum out='sentences' nr=1}</div>
					<hr>

				</div>
			</div>
		</div>
	{/block}