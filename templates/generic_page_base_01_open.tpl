<!-- area: 1 of 3 -->
{strip}
	{$page_js_header = '' scope='global'}
	{$page_js_footer = '' scope='global'}
	{$theme_absolute_url = "{root_url}/assets{#theme_dst_path#}" scope='global'}
	{$theme_relative_url = "./assets{#theme_dst_path#}" scope='global'}
	{$environment = "localhost" scope=global} {* localhost | develop.uisge-beatha.eu | uisge-beatha.eu = used to set if some scripts either or not need to run *}
	{assign var=noembed value=0 scope='global'}
	{assign var=showAds value=0 scope='global'}
	{process_pagedata}

	{block name='open_content'}
		{* all content blocks are set on the page template *}
	{/block}

	<!DOCTYPE html>
	{* <!-- /area: 1 of 3 --> *}
	{* has-no-js will be removed when using modernizr *}
	<html class="has-no-js" lang="{cms_get_language|truncate:2:"":true}">
{/strip}