{* 
*	Template name: Bootstrap4 Nav
*	-------------------------------------
*
*	This is the default template for use with the "Navigator" module. It is capable of generating 
*	the three stock Bootstrap Navbar types: default, static and fixed. It can also be customised 
* 	with the included Bootstrap4 classes for light and dark. 

* 	Customisations should be made in the "Bootstrap4 Settings" template and NOT in this file, and 
* 	the following can be done there:
*
*	 - Change navbar position
*	 - Change navbar brand text
*	 - Change navbar brand logo
*	 - Change toggler alignment
*	 - Switch dark/light Bootstrap theme
*
*	Note: this template should be set as the "default" template of its type for the Bootstrap4 theme
*
*	Part of the CMSMS Bootstrap4 template by stom | stom66.co.uk
*}

{$default_navbar_style = $default_navbar_style|default:"default" scope=global}
{function name=Nav_menu depth=1}{strip}
	{foreach $data as $node}
		{* setup classes for the anchor and list item *}
		{assign var='liclass' value='nav-item'}

		{if $depth < 1}
			{assign var='aclass' value='nav-link'}
		{else}
			{assign var='aclass' value='dropdown-item'}
		{/if}

		{if $node->current}
			{assign var='liclass' value=$liclass|cat:' active'}
			{assign var='aclass' value=$aclass|cat:' active'}
		{/if}

		{if $node->parent}
			{assign var='liclass' value=$liclass|cat:' active'}
			{assign var='aclass' value=$aclass|cat:' active'}
		{/if}

		{if $node->children_exist && $depth < 1}
			{assign var='liclass' value=$liclass|cat:' dropdown'}
			{assign var='aclass' value=$aclass|cat:' dropdown-toggle'}
		{/if}

		{* build the menu item node *}
		{if $node->type == 'sectionheader'}
			{if $depth < 1}<li class='{if $depth>0}-header{/if} {$liclass}'>{/if}
			{if isset($node->children) && ($depth == 0)}
				<a  href="#" class="{$aclass}" id="nav-link-{$node->id}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					{$node->menutext} <span class="caret"></span>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="nav-link-{$node->id}">
					{Nav_menu data=$node->children depth=$depth+1}
				</div>
			{else}
				<h6 class="dropdown-header">{$node->menutext}</h6>
			{/if}
			{if $depth < 1}</li>{/if}
		{else if $node->type == 'separator'}
			{if $depth < 1}<li role="separator" class='divider {$liclass}'></li>{/if}
		{else}
			{* regular item *}
			{if $depth < 1}<li class="{$liclass}">{/if}
			{if isset($node->children) && ($depth == 0)}
				<a  href="#" class="{$aclass}" id="nav-link-{$node->id}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					{$node->menutext} <span class="caret"></span>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="nav-link-{$node->id}">
					{Nav_menu data=$node->children depth=$depth+1}
				</div>
			{else}
				<a class="{$aclass}" href="{$node->url}"{if $node->target ne ""} target="{$node->target}"{/if}><span>{$node->menutext}</span></a>
			{/if}
			{if $depth < 1}</li>{/if}
		{/if}
	{/foreach}
{/strip}{/function}

{if $default_navbar_style=="default"}<div class="container">{/if}
	<nav class="{$navbar_classes}">
		{if $default_navbar_style!=="default"}<div class="container">{/if}
		{if $navbar_toggler_align=="right"}
		<a class="navbar-brand" href="#">
			{CGSmartImage src=$navbar_brand alias1=navbar_logo} {$navbar_brand_text}
		</a>
		{/if}

		<button class="navbar-toggler navbar-toggler-right" 
				type="button" 
				data-toggle="collapse" 
				data-target="#navbarCollapse" 
				aria-controls="navbarCollapse" 
				aria-expanded="false" 
				aria-label="Toggle navigation">
			{*fa i=bars*}
		</button>

		{if $navbar_toggler_align=="left"}
		<a class="navbar-brand" href="#">
			{CGSmartImage src=$navbar_brand alias1=navbar_logo} {$navbar_brand_text}
		</a>
		{/if}

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav ml-auto">
				{if isset($nodes)}
					{Nav_menu data=$nodes depth=0}
				{/if}
			</ul>
		</div>
	{if $default_navbar_style!=="default"}</div>{/if}
	</nav>
{if $default_navbar_style=="default"}</div>{/if}