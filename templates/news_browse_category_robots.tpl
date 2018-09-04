{if $count > 0}
{foreach from=$cats item=node}
{if $node.count > 0}
Allow: {$node.url|replace:{root_url}:''}
{/if}
{/foreach}
{/if}