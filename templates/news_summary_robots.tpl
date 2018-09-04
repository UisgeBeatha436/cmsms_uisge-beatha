{if isset($items)}
{foreach from=$items item='entry' name='loop'}
Allow: {$entry->link|replace:{root_url}:''}
{/foreach}
{/if}