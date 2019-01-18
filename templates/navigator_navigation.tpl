{strip}
{*

  == This template can be used for navigations without any levels ==
  When a node has children call the: "main_level_markup" function again,
  to rise the sub nodes to the top level.

*}

{function name=main_level_markup depth=1}
  {foreach $data as $node name='loop'}
    {if $node->type == 'sectionheader'}
      {*<li><strong>{$node->menutext}</strong></li>*}
      {if isset($node->children)}
        {*main_level_markup data=$node->children depth=$depth+1*}
        <li>
          <a href="{$node->url}"{if $node->target ne ''} target="{$node->target}"{/if}>{$node->menutext}</a>
        </li>
      {/if}
    {else if $node->type == 'separator'}
      <li><hr></li>
    {else}
      <li>
        <a href="{$node->url}"{if $node->target ne ''} target="{$node->target}"{/if}>{$node->menutext}</a>
      </li>
      {if isset($node->children)}
        {*main_level_markup data=$node->children depth=$depth+1*}
      {/if}
    {/if}
  {/foreach}
{/function}

{if isset($nodes)}
  <ul class="pull-center">
      {main_level_markup data=$nodes depth=0}
  </ul>
{/if}
{/strip}