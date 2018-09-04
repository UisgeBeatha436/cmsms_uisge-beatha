{foreach from=$items item=entry name=loop}
<item>
  <title>{$entry->title|escape}</title>
  <description>{strip}
    {if $entry->summary}
      {eval var=$entry->summary assign='_summary'}
      {$_summary|strip_tags|escape|truncate:400}
    {else}
      {eval var=$entry->content assign='_content'}
      {$_content|strip_tags|escape|truncate:400}
    {/if}
    {/strip}</description>
    <guid>{$entry->link}</guid>
    <link>{$entry->link}</link>
    <pubDate>{$entry->postdate|rfc_date}</pubDate>
  </item>
  {/foreach}