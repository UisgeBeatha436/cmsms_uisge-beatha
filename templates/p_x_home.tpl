{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}  {* changed it to the right theme *}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
  {$content_image_01 = "{content_image dir='images' block='content_image_01' urlonly='true' label='Content background image'}" scope='global'}
  {$footer_youtube_01 = "{content block='footer_youtube_01' label='Youtube code used in footer'}" scope='global'}
  {$content_01="{content label='Content main section'}" scope='global'}
{/block}

{block name='body_content'}
    {assign var='parallax_img' value={CGSmartImage src="{uploads_url}/images/cms/40MijlvanBru-02.jpg" alt='{$sitename} | Dehler 36 JV' noembed={$noembed} notag=1}}
    <a id="a-content"></a>
    <div class="wrapper">
        <div data-speed="100" class="view">
            <img
                style="width: 100%; height: 100vh; transform: translate3d(0px, 0px, 0px) !important;" {* needed to override default style *}
                class="img-fluid rellax lozad"
                data-rellax-speed="-3"
                data-rellax-percentage="0.5"
                data-src="{$parallax_img}"
                alt="{$sitename} | Dehler 36 JV"
            > {* end img *}
            <div class="mask rgba-stylish-slight">
                <div class="container flex-center text-center">
                    <div class="row mt-5">
                        <div class="col-md-12 wow fadeIn mb-3">
                            <h1 class="display-2 text-white mb-2 rellax" data-rellax-speed="-1">{$sitename}</h1>
                            <h2 class="display-4 text-uppercase text-white-50 mb-3 mt-1 font-weight-bold rellax"
                                data-rellax-speed="3">Dehler 36 JV</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-basic-components">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        {$content_01}
                    </div>
                </div>
            </div>
            <hr>
            <div class="section">
                <div class="container">
                    <section class="text-center my-5" id="card-decks">
                        <!-- Section heading -->
                        <h2 class="h2-responsive font-weight-bold my-5">Logboek berichten</h2>
                        <!-- Section description -->
                        <p class="dark-grey-text w-responsive mx-auto mb-5">Artikelen rondom Uisge Beatha over reizen, verblijven, ervaring en onderhoud.</p>
                        {CGBlog summarytemplate="blogSummaryHome" number="3" detailpage="{if
                        isset($blog_page)}{$blog_page}{/if}"}
                    </section>
                </div>
            </div>
        </div>
    </div>
{/block}