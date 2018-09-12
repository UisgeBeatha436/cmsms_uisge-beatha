{*

== This template can be used for navigations with multiple levels ==

There is a markup function for nodes at the "main_level" (1)
and another one for the "sub_level" (1.1) markup.
When you want to apply markup for nodes at a deeper level implement this yourself.

Currently menu items > 2 levels deep (1.1.1 / 1.1.1.1 / ....) will get the "sub_level" output,
without an open/close div tag.

1. main <- main_level_markup
1.1 sub <- sub_level_markup
1.1.1 sub_sub <- sub_level_markup without a container
1.1.1.1 sub_sub_sub <- sub_level_markup without a container

*}

{capture name='example'}
  {* implode_class is used for styling purpose *}
  {*$list_class = []*}
  {*$list_class[] = ''*}
  {*implode_class class=$list_class*}
  {function implode_class}
      {if count($class) > 0} class='{implode(' ',$class)}'{/if}
  {/function}

  {function name='sub_sub_level_markup' depth=1}
    {foreach $data as $node name='sub_sub_loop'}
      {*
        <!-- sub_sub_level not implemented -->
        <!-- based on the type of node you can apply styling, see function implode_class above -->
        {if $node@first && $node@total > 1}first_child{/if}
        {if $node@last && $node@total > 1}last_child{/if}
        {if $node->current}currrent_page{/if}
        {if $node->parent}parent_of_current_page{/if}
        {if $node->children_exist}we_have_children{/if}
      *}
    {/foreach}
  {/function}
{/capture}


{function name='sub_level_markup' depth=1}
{foreach $data as $node name='sub_loop'}

	{if $smarty.foreach.sub_loop.first}
	{if $node->depth <= 2}
		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
	{/if}
	{/if}

	{if $node->type == 'sectionheader'}
	<strong>{$node->menutext}</strong>
	{if isset($node->children)}
		{sub_level_markup data=$node->children depth=$depth+1}
	{/if}
	{else if $node->type == 'separator'}
	<div class="dropdown-divider"></div>
	{else}
	<a class="dropdown-item" href="{$node->url}">{if $node->target ne ""} target="{$node->target}"{/if}{$node->menutext}</a>
	{if isset($node->children)}
		{* <!-- call sub_level again but when depth > 2 it will not print the open/close div --> *}
		{sub_level_markup data=$node->children depth=$depth+1}
	{/if}
	{/if}

	{if $smarty.foreach.sub_loop.last}
	{if $node->depth <= 2}
		</div>
	{/if}
	{/if}

  {/foreach}
{/function}

{function name=main_level_markup depth=1}
	{assign var='aclass' value='dropdown-item'}
	<ul class="navbar-nav mr-auto">
		{foreach $data as $node name='loop'}
		{if $node->type == 'sectionheader'}
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="{$node->url}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$node->menutext}</a>
				{if isset($node->children)}
					{sub_level_markup data=$node->children depth=$depth+1}
				{/if}
			</li>
		{else if $node->type == 'separator'}
			<div class="dropdown-divider"></div>
		{else}
		{* <a class="menu-button{if $node->children_exist}dropdown-wrapper{/if}"></a> *}
		{* <a href="{$node->url}"{if $node->target ne ""} target="{$node->target}"{/if}><class="menu{if $node->children_exist}-button{/if}">{$node->menutext}</a> *}
		{if isset($node->children)}
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="{$node->url}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$node->menutext}</a>
			</li>
			{sub_level_markup data=$node->children depth=$depth+1}
		{else}
			<li class="nav-item{if {$node->current}} active{/if}"> {* {if {$node->current}}<span class="sr-only">(current)</span>{/if} *}
				<a class="nav-link"  href="{$node->url}">{$node->menutext}</a>
			</li>
		{/if}
	{/if}
	{/foreach}
    </ul>
{/function}

{if isset($nodes)}
  {main_level_markup data=$nodes depth=0}
{/if}