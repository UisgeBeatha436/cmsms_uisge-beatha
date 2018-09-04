{$global_news_summary='1' scope='global'}

{if $category_name}
  {* <h1>{$category_name}</h1> *}
  {$_setname = "{title} - {$category_name}"}
  {$global_description=$category_name scope='global'}
  {$content_obj->SetName($_setname)}
{/if}

{if $pagecount > 1}
  <p>
    {if $pagenumber > 1}
      <a href="{$firsturl}">first</a> | <a href="{$prevurl}">prev</a>
    {else}
      <s>first</s> | <s>prev</s>
    {/if}

    <strong>{*$pagetext*}{$pagenumber} {$oftext} {$pagecount}</strong>

    {if $pagenumber < $pagecount}
      <a href="{$nexturl}">next</a> | <a href="{$lasturl}">last</a>
    {else}
      <s>next</s> | <s>last</s>
    {/if}
  </p>
{/if}

{foreach from=$items item=entry}

  <a href="{$entry->moreurl}" title="{$entry->title|cms_escape:htmlall}">
    <h3>{$entry->title|cms_escape}</h3>
  </a>

  {if $entry->postdate}
    <p><strong>
      {if $entry->author}{$author_label} {$entry->author}{/if}
      {$entry->postdate|cms_date_format}{if $entry->category} in <span class="badge">{*$category_label*}{$entry->category|lower}</span>{/if}
    </strong></p>
  {/if}

  {if $entry->summary}
    {capture assign=_summary}{eval var=$entry->summary}{/capture}
    <p><em>{$_summary|strip_tags:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}</em></p>
    <a href="{$entry->moreurl}" class="button">More</a>
  {else if $entry->content}
    {capture assign=_content}{eval var=$entry->content}{/capture}
    <p><em>{$_content|strip_tags:false|truncate:350:'...':false:false|regex_replace:"/^[\s]*(.*?)[\s]*$/":"$1"}</em></p>
    <a href="{$entry->moreurl}" class="button">More</a>
  {/if}

  {if isset($entry->extra)}
    {capture}
    {* extra turned off and not styled *}
    <p>
      <strong>Extra:</strong><br>
      {$entry->extra}
    </p>
    {/capture}
  {/if}

  {if isset($entry->fields)}
    {capture}
      {* fields turned off and not styled *}
      <pre>
        {foreach from=$entry->fields item='field'}
          {if $field->type == 'file'}
            {if isset($field->value) && $field->value}
              file: <img src="{$entry->file_location}/{$field->value}">
            {/if}
          {elseif $field->type == 'linkedfile'}
            {if !empty($field->value)}
              linkedfile: <img src="{file_url file=$field->value}" alt="{$field->value}"/>
            {/if}
          {else}
            field.name: {$field->name}
            field.value: {$field->value}
          {/if}
        {/foreach}
      </pre>
    {/capture}
  {/if}

  <hr>

{/foreach}