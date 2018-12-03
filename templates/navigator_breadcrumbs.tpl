<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    {if isset($starttext)}
      <li class="text-info">{$starttext}:&nbsp;</li>
    {/if}
    {foreach $nodelist as $node}
      {if $node->current}{/if}
      {if !$node@last}{/if}
      {if $node@last} {* last item in the list*}
        <li class="breadcrumb-item active" aria-current="page">{$node->menutext}</li>
      {elseif $node->type == 'sectionheader'}
        <li class="breadcrumb-item">
          <a href="{$node->url}" title="{$node->menutext}">{$node->menutext}</a>
        </li>
      {else}
          <li class="breadcrumb-item">
            <a href="{$node->url}" title="{$node->menutext}">
              {$node->menutext}
            </a>
          </li>
      {/if}
    {/foreach}
  </ol>
</nav>