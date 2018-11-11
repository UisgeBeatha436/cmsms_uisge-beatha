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

{*<div class="page-header page-header-small">
  {assign var='header_image' value={CGSmartImage src='http://localhost/install/uploads/images/cms/40MijlvanBru-02.jpg' notag=1}}
  <div class="page-header-image" data-parallax="true" style="background-image: url('{$header_image}');">
  </div>
  <div class="content-center">
    <div class="row">
      <div class="col-md-8 mr-auto ml-auto">
        <h1 class="title rellax" data-rellax-speed="-1">{menu_text}</h1>
        {$_description={description}}
        <h4 class="h3-description rellax" data-rellax-speed="-3">
          {if $_description != '' || $global_description != ''}
            {if $global_description != ''}
              {$global_description}
            {else}
              {description}
            {/if}
          {else}
            Uisge Beatha
          {/if}
        </h4>
        <nav aria-label="breadcrumb" role="navigation">
          {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
        </nav>
      </div>
    </div>
  </div>
</div>*}
<div class="page-header page-header-small">
      {assign var='header_image' value={CGSmartImage src='http://localhost/install/uploads/images/cms/40MijlvanBru-02.jpg' notag=1}}
      {$_description={description}}
      <div class="page-header-image"  style="background-image: url('{$header_image}');">
      </div>
      <div class="content-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <div class="rellax" data-rellax-speed="-3">
              <h1 class="title"  >{menu_text}</h1>
            </div>
            <h4>
              {if $_description != '' || $global_description != ''}
                {if $global_description != ''}
                  {$global_description}
                {else}
                  {description}
                {/if}
              {else}
                  Uisge Beatha
              {/if}
            </h4>
            <nav aria-label="breadcrumb" role="navigation">
              {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
            </nav>
          </div>
        </div>
      </div>
    </div>