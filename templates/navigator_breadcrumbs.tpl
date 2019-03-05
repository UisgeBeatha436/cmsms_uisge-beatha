<nav class="navbar navbar-expand-md indigo lighten-4 mb-5" aria-label="breadcrumb">  
  <a class="navbar-brand" href="#!">
    <img src="{uploads_url}/images/cms/Logo_Dehler_UisgeBeatha-png.png" height="30" alt="Uisge Beatha Dehler 36 JV logo">
  </a>
  <div class="mr-auto">
    <nav class="breadcrumb">
      <ol class="breadcrumb d-inline-flex pl-0 pt-0">
        {if isset($starttext)}
          <li class="indigo-text darken-4 mt-1">{$starttext}:&nbsp;</li>
        {/if}
        {foreach $nodelist as $node}
          {if $node->current}{/if}
          {if !$node@last}{/if}
          {if $node@last} {* last item in the list*}
            <li class="breadcrumb-item active black-text mt-1" aria-current="page">{$node->menutext}</li>
          {elseif $node->type == 'sectionheader'}
            <li class="breadcrumb-item">
              <a class="black-text" href="{$node->url}" title="{$node->menutext}">{$node->menutext}</a>
            </li>
          {else}
            <li class="breadcrumb-item">
              <a class="black-text" href="{$node->url}" title="{$node->menutext}">
                {$node->menutext}
              </a>
            </li>
          {/if}
        {/foreach}
      </ol>
    </nav>
  </div>
</nav>