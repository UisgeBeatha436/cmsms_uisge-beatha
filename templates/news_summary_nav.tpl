<nav class="side-nav">
  <ul>
  {foreach from=$cats item=node}
    {if $node.depth > $node.prevdepth}
      {repeat string="<ul>" times=$node.depth-$node.prevdepth}
    {elseif $node.depth < $node.prevdepth}
      {repeat string="</li></ul>" times=$node.prevdepth-$node.depth}
    </li>
    {elseif $node.index > 0}
      </li>
    {/if}
    <li{if $node.index == 0}{/if}>
    {if $node.count > 0}
      <a href="{$node.url}">{$node.news_category_name}</a>
    {else}
      <span class="text-muted">{$node.news_category_name}</span>
    {/if}
  {/foreach}
  {repeat string="</li></ul>" times=$node.depth-1}</li>
  </ul>
</nav>