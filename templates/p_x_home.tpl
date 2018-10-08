{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}  {* changed it to the right theme *}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
  {$content_image_01 = "{content_image dir='images' block='content_image_01' urlonly='true' label='Content background image'}" scope='global'}
  {$content_01="{content label='Content main section'}" scope='global'}
{/block}

{block name='body_content'}
  <a id="a-content"></a>
  <div class="wrapper">
    <div class="page-header clear-filter" filter-color="orange">
      <div class="page-header-image" data-parallax="true" style="background-image: url('//localhost/install/uploads/images/cms/40MijlvanBru-02.jpg');">
      </div>
      <div class="content-center">
        <div class="container">
          <div class="content-center">
            <h1 class="h1-seo text-center">{sitename}</h1>
            <h2 class="description text-center">Dehler 36 JV</h2>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          {$content_01}
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <hr>
        <h2 class="title">Logboek berichten</h2>
          {CGBlog summarytemplate="blogSummaryHome" number="3" detailpage="{if isset($blog_page)}{$blog_page}{/if}"} 
      </div>
    </div>
  </div>
{/block}