{strip}
{* <!-- parsed: 1 of 3 --> *}
{$page_js_header = '' scope='global'}
{$page_js_footer = '' scope='global'}
{$theme_absolute_url = "{root_url}/assets{#theme_dst_path#}" scope='global'}
{$theme_relative_url = "./assets{#theme_dst_path#}" scope='global'}
{process_pagedata}

{block name='open_content'}
	{*$content_01="{content label='Content 01'}" scope='global'*}
{/block}

<!doctype html>
{* has-no-js will be removed when using modernizr *}
<html class="has-no-js" lang="{cms_get_language|truncate:2:"":true}">
{* <!-- /parsed: 1 of 3 -->} *}
{/strip}
