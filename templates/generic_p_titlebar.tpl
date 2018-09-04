<div class="l-titlebar-container">
    <div class="l-titlebar-row">
      <div>
        <h2>{menu_text}</h2>

        {$_description={description}}
        <h5>
          {if $_description != '' || $global_description != ''}
            {if $global_description != ''}
              {$global_description}
            {else}
              {description}
            {/if}
          {else}
            --
          {/if}
        </h5>

      </div>
      <div>
        {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
      </div>
    </div>
  </div>