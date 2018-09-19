{* <div class="row">
    <div class="col-md-12">
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
            -->
          {/if}
        </h5>
      </div>
      <div>
        {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
      </div>
    </div>
  </div> *}

  {*<div class="page-header page-header-mini">
      <div class="page-header-image" data-parallax="true" style="background-image: url('//localhost/install/uploads/images/cms/40MijlvanBru-02.jpg'); transform: translate3d(0px, 0px, 0px);">
      </div>
  </div>*}
  <div class="section">
  <div class="features-2 section-image" style="background-image: url('//localhost/install/uploads/images/cms/40MijlvanBru-02.jpg')">
  <div class="container">
    <div class="row">
        <div class="col-md-8 mr-auto ml-auto">
            <h2 class="title">{menu_text}</h2>
            {$_description={description}}
            <h5>
              {if $_description != '' || $global_description != ''}
                {if $global_description != ''}
                  {$global_description}
                {else}
                  {description}
                {/if}
              {else}
                <p>Uisge Beatha</p>
              {/if}
            </h5>
        </div>
    </div>

    <div class="row">
        <div class="col-md-11">
          <nav aria-label="breadcrumb" role="navigation">
            {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
          </nav>
        </div>
    </div>
  </div>
  </div>
</div>