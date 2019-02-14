<!-- area: 1 of 3 -->
{strip}
	{$page_js_header = '' scope='global'}
	{$page_js_footer = '' scope='global'}
	{$theme_absolute_url = "{root_url}/assets{#theme_dst_path#}" scope='global'}
	{$theme_relative_url = "./assets{#theme_dst_path#}" scope='global'}
	{process_pagedata}
	{$environment = "localhost" scope=global} {* localhost | www.develop.uisge-beatha.eu | www.uisge-beatha.eu --->>>> used to set if some scripts either or not need to run *}
	
	{block name='open_content'}
		{* all content blocks are set on the page template *}
	{/block}

	<!DOCTYPE HTML>
	{* has-no-js will be removed when using modernizr *}
	<!-- /area: 1 of 3 -->
	<html class="has-no-js" lang="{cms_get_language|truncate:2:"":true}">