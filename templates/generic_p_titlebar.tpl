{strip}
  {*<div class="page-header page-header-small">*}
    {$noembed=0}
    {if $page_alias == 'hanse_311'}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/UisgeBeatha.jpg" filter_crop2size="4500,1500,bc" alt="Hanse 311 - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = 'Hanse 311 - Uisge Beatha'}
    {elseif $page_alias == 'fotoalbums'}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/Honfleur - 21.jpg" filter_crop2size="4500,1700,bc" alt="{$sitename} - Honfleur - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = '{$sitename} - Honfleur - Uisge Beatha'}
    {elseif $page_alias == 'logboek_artikelen'}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/Beachy Head.jpg" filter_crop2size="4500,1350,bc" alt="{$sitename} - Beachy Head - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = '{$sitename} - Beachy Head - Uisge Beatha'}
    {elseif $page_alias == 'downloads'}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/Breskens.jpg" filter_crop2size="4500,950,bc" alt="{$sitename} - Breskens - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = '{$sitename} - Breskens - Uisge Beatha'}
    {elseif $page_alias == 'gastenboek'}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/40MijlvanBru-27.jpg" filter_crop2size="4500,700,bc" alt="{$sitename} - 40 Mijlvan Bru - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = '{$sitename} - 40 Mijlvan Bru - Uisge Beatha'}
    {elseif $page_alias == 'gps-tracks'}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/Week aug17 - 10.jpg" filter_crop2size="4500,1200,bc" alt="{$sitename} - Breskens - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = '{$sitename} - Breskens - Uisge Beatha'}
    {else}
      {$header_image = {CGSmartImage src="{uploads_url}/images/cms/40MijlvanBru-02.jpg" alt="Dehler 36 JV - Uisge Beatha" noembed={$noembed} notag=1}}
      {$alt = 'Dehler 36 JV - Uisge Beatha'}
    {/if}
    {$_description={description}}

    <!-- Intro Section -->
    <div class="view jarallax rellax lozad" data-rellax-speed="1" data-background-image='{$header_image}' style="background-image: url('{$header_image}'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
      <div class="mask rgba-stylish-slight">
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="row pt-5 mt-3">
              <div class="col-md-12 mb-3">
                <div class="text-center">
                  <h1 class="display-4 text-white mb-2 rellax mb-5" data-rellax-speed="-1">
                    {if isset($_description) || isset($global_description)}
                      {if isset({description})}
                        {description}
                      {elseif isset($global_description)}
                        {$global_description}
                      {else}
                        Uisge Beatha
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
    {Navigator action='breadcrumbs' template="{#theme_resource#}navigator_breadcrumbs.tpl"}
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