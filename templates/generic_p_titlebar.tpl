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
  
  {*<div class="jumbotron jumbotron-fluid mt-5" style="margin-top:80px;">
    <div class="container">
      <h2 class="display-4 text-center">{menu_text}</h2> { *class display-4* }
      <p class="lead">
        {$_description={description}}
        {if $_description != '' || $global_description != ''}
          {if $global_description != ''}
            {$global_description}
          {else}
            {description}
          {/if}
        {else}
          Uisge Beatha
        {/if}
      </p>
      <nav aria-label="breadcrumb" role="navigation">
        {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
      </nav>
    </div>
  </div>*}

  <div class="section">
      {assign var='header_image' value={CGSmartImage src='http://localhost/install/uploads/images/cms/40MijlvanBru-02.jpg' notag=1}}
      <div class="features-2 section-image" style="background-image: url('{$header_image}');">
      <div class="container">
        <div class="row">
            <div class="col-md-8 mr-auto ml-auto">
                <h2 class="title">{menu_text}</h2>
                {$_description={description}}
                <h5 class="title">
                  {if $_description != '' || $global_description != ''}
                    {if $global_description != ''}
                      {$global_description}
                    {else}
                      {description}
                    {/if}
                  {else}
                    Uisge Beatha
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
