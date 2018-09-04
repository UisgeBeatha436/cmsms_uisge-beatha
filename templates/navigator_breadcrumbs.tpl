<ul class="breadcrumbs">
  {if isset($starttext)}
    <li>{$starttext}:</li>
  {/if}
  {foreach $nodelist as $node}
    {if $node->current}{/if}
    {if !$node@last}{/if}
    {if $node@last}
      <li>{$node->menutext}</li>
    {elseif $node->type == 'sectionheader'}
      <li>
        {$node->menutext}
      </li>
    {else}
        <li>
          <a href="{$node->url}" title="{$node->menutext}">
            {$node->menutext}
          </a>
        </li>
    {/if}
  {/foreach}
  </ul>