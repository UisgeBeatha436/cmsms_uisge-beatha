<!-- area: 1 of 3 -->
{strip}
	{$page_js_header = '' scope='global'}
	{$page_js_footer = '' scope='global'}
	{$theme_absolute_url = "{root_url}/assets{#theme_dst_path#}" scope='global'}
	{$theme_relative_url = "./assets{#theme_dst_path#}" scope='global'}
	{$noembed = 1 scope='global'}
	{$showAds = 1 scope='global'}
	{$static_url = 'https://statisch.develop.uisge-beatha.eu' scope='global'}
	{if $smarty.server.SERVER_NAME|lower eq 'develop.uisge-beatha.eu' || $smarty.server.SERVER_NAME|lower eq 'localhost'}
		{$google_code_global='GTM-W56XLX5' scope='global'} {* develop: GTM-W56XLX5 *}
		{if $smarty.server.SERVER_NAME|lower eq 'localhost'}
			{$_environment = "localhost"}
		{else}
			{$_environment = "www.develop.uisge-beatha.eu"}
			{*$theme_absolute_url = "{$static_url}/assets{#theme_dst_path#}" scope='global'*}
		{/if}
	{else}
		{$google_code_global='GTM-M95RWP' scope='global'} {* prod: GTM-M95RWP *}
		{$_environment = "www.uisge-beatha.eu" scope='global'}
	{/if}
	{$environment = {$_environment|replace:" ":""} scope='global'}
	{process_pagedata}

	{block name='open_content'}
		{* all content blocks are set on the page template *}
	{/block}

	<!DOCTYPE html>
	{* <!-- /area: 1 of 3 --> *}
	{* has-no-js will be removed when using modernizr *}
	<html class="has-no-js" lang="{cms_get_language|truncate:2:"":true}">
{/strip}