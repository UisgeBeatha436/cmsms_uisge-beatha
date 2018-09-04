{strip}
{* GLOBAL_DATA *}

{$global_news_detail = 1 scope='global'}
{*assign '_images_all' []*}

{if $entry->summary != ''}
  {cgsi_getimages assign='_images_summary' nocontent='1'}{eval var=$entry->summary}{/cgsi_getimages}
  {if isset($_images_summary)}
    {append var='_images_all' value=$_images_summary index='images_summary'}
  {/if}
{/if}

{if $entry->content != ''}
  {cgsi_getimages assign='_images_content' nocontent='1'}{eval var=$entry->content}{/cgsi_getimages}
  {if isset($_images_content)}
    {append var='_images_all' value=$_images_content index='images_content'}
  {/if}
{/if}

{if isset($_images_all) && $_images_all|@count}
    {$images_all_global=$_images_all scope='global'}
{else}
  {assign 'images_all_global' [] scope='global'}
{/if}

{if isset($entry->canonical)}
  {assign var='canonical_global' value=$entry->canonical scope='global'}
{/if}

{capture assign='_summary'}{eval var=$entry->summary}{/capture}
{capture assign='_content'}{eval var=$entry->content_obj}{/capture}

{$_summary=$_summary|strip_tags:false|strip|truncate:300:'':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}
{$_content=$_content|strip_tags:false|strip|truncate:300:'':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}

{$content_obj->SetTitleAttribute($_summary|default:$_content)}

{if $entry->category}
  {capture assign='_title'}{strip}{$entry->title} - {$entry->category}{/strip}{/capture}
  {$content_obj->SetName($_title)}
  {$global_description=$entry->category scope='global'}
{else}
  {$content_obj->SetName({$entry->title})}
{/if}

{$current_news_id=$entry->id scope=global}
{$current_news_category=$entry->category scope=global}
{$og_type='article' scope='global'}
{$og_updated_time=$entry->modified_date|date_format:"%Y-%m-%dT%H:%M:%S%z"}

{* /GLOBAL_DATA *}
{/strip}

{* SOCIAL_LINKS *}

{if isset($content_obj->TitleAttribute()) && $content_obj->TitleAttribute() != ''}
  {capture assign='_sociallinks_description'}{$content_obj->TitleAttribute}{/capture}
{else}
  {$_sociallinks_description = ''}
{/if}

{$_sociallinks_title = "{title} - {sitename}"}
{capture assign='_sociallinks_title'}{$_sociallinks_title|cms_escape:htmlall|truncate:80}{/capture}

{if isset($canonical_global)}
  {$_sociallinks_url = $canonical_global}
{elseif isset($content_obj)}
  {$_sociallinks_url = $content_obj->GetURL()}
{/if}

{if isset($_images_all) && $_images_all['images_content']|@count}
  {*get_html_attributes html={$_images_all['images_content'][0]}*}
  {capture assign='_sociallinks_imageurl'}{root_url}/{$_images_all['images_content'][0]['src']}{/capture}
{else}
  {capture assign='_sociallinks_imageurl'}{$theme_absolute_url}/images/twitter_summary_image.png{/capture}
{/if}

{sociallinks title=$_sociallinks_title url=$_sociallinks_url imageurl=$_sociallinks_imageurl description=$_sociallinks_description}

{* SOCIAL_LINKS *}


<h2>{$entry->title|cms_escape:htmlall}</h2>

{if $entry->postdate}
  <p><strong>
    {if $entry->author}{$author_label} {$entry->author}{/if}
    {$entry->postdate|cms_date_format}{if $entry->category} in <span class="badge">{*$category_label*}{$entry->category}</span>{/if}
  </strong></p>
{/if}

{if $entry->summary}
  <em>{eval var=$entry->summary}</em>
{/if}

{eval var=$entry->content}

{if $entry->extra}
  <p>
    <strong>{$extra_label}</strong><br>
    {$entry->extra}
  </p>
{/if}

{if $return_url != ''}
  <a href="{cms_selflink href='news'}" class="button">Return</a>
  {if $category_name != ''}<a href="{$category_link}" class="button">Return to {$category_name}</a>{/if}
{/if}

{capture}
  <!-- fields turned off and not styled -->
  <pre>
  {if isset($entry->fields)}
    {foreach $entry->fields as $fieldname => $field}
      {if $field->type == 'file'}
        {if !empty($field->value)}
          name: {$field->name}
          value: {$field->value}
          file_location: {$entry->file_location}
          file_url: {file_url file=$field->value}
        {/if}
      {elseif $field->type == 'linkedfile'}
        {if !empty($field->value)}
          name: {$field->name}
          value: {$field->value}
          file_location: {$entry->file_location}
          file_url: {file_url file=$field->value}
        {/if}
      {else}
        name: {$field->name}
        value: {$field->value}
      {/if}
    {/foreach}
  {/if}
  </pre>
{/capture}