{strip}
  {*<div class="page-header page-header-small">*}

    {if $page_alias == 'hanse_311'}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/UisgeBeatha.jpg" filter_crop2size="4500,1500,bc" alt="Hanse 311 - Uisge Beatha" notag=1}}
      {assign var='alt' value='Hanse 311 - Uisge Beatha'}
    {elseif $page_alias == 'fotoalbums'}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/Honfleur - 21.jpg" filter_crop2size="4500,1700,bc" alt="{$sitename} - Honfleur - Uisge Beatha" notag=1}}
      {assign var='alt' value='{$sitename} - Honfleur - Uisge Beatha'}
    {elseif $page_alias == 'logboek_artikelen'}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/Beachy Head.jpg" filter_crop2size="4500,1350,bc" alt="{$sitename} - Beachy Head - Uisge Beatha" notag=1}}
      {assign var='alt' value='{$sitename} - Beachy Head - Uisge Beatha'}
    {elseif $page_alias == 'downloads'}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/Breskens.jpg" filter_crop2size="4500,950,bc" alt="{$sitename} - Breskens - Uisge Beatha" notag=1}}
      {assign var='alt' value='{$sitename} - Breskens - Uisge Beatha'}
    {elseif $page_alias == 'gastenboek'}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/40MijlvanBru-27.jpg" filter_crop2size="4500,700,bc" alt="{$sitename} - 40 Mijlvan Bru - Uisge Beatha" notag=1}}
      {assign var='alt' value='{$sitename} - 40 Mijlvan Bru - Uisge Beatha'}
    {elseif $page_alias == 'gps-tracks'}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/Week aug17 - 10.jpg" filter_crop2size="4500,1200,bc" alt="{$sitename} - Breskens - Uisge Beatha" notag=1}}
      {assign var='alt' value='{$sitename} - Breskens - Uisge Beatha'}
    {else}
      {assign var='header_image' value={CGSmartImage src="{uploads_url}/images/cms/40MijlvanBru-02.jpg" alt="Dehler 36 JV - Uisge Beatha" notag=1}}
      {assign var='alt' value='Dehler 36 JV - Uisge Beatha'}
    {/if}
    {$_description={description}}

    <!-- Intro Section -->
    <div class="view jarallax rellax" data-rellax-speed="1" style="background-image: url('{$header_image}'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
      <div class="mask rgba-stylish-slight">
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="row pt-5 mt-3">
              <div class="col-md-12 mb-3">
                <div class="text-center">
                  <h1 class="display-4 text-white mb-2 rellax mb-5" data-rellax-speed="-1">
                    {if $_description != '' || $global_description != ''}
                      {if $global_description != ''}
                        {$global_description}
                      {else}
                        {description}
                      {/if}
                    {else}
                      Uisge Beatha 
                    {/if}
                  </h1>
                  {*<nav aria-label="breadcrumb">
                    {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
                  </nav>*}
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
    
    <nav aria-label="breadcrumb">
      {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
    </nav>

    {*<div class="page-header-image"  style="background-image: url('{$header_image}');">
    </div>
    <div class="content-center">
      <div class="row">
        <div class="col-md-8 ml-auto mr-auto">
          <div class="rellax" data-rellax-speed="-3">
            <h1 class="title">{menu_text}</h1>
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
          <nav aria-label="breadcrumb">
            {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
          </nav>
        </div>
      </div>
    </div>
  </div>*}
{/strip}