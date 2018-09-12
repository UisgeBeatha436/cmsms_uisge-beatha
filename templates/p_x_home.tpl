{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}  {* changed it to the right theme *}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
  {$content_image_01 = "{content_image dir='images' block='content_image_01' urlonly='true' label='Content image 01'}" scope='global'}
  {$content_01="{content label='Content 01'}" scope='global'}
{/block}

{block name='body_content'}

  

  <a id="a-content"></a>
  <div class="wrapper">
      <div class="page-header">
          <div class="page-header-image" data-parallax="true" style="background-image: url('//localhost/install/uploads/images/cms/40MijlvanBru-02.jpg');">
          </div>
          <div class="container">
            <div class="content-center">
                <h1 class="title text-center">Components Documentation</h1>
                <h3 class="description text-center">Elements description - v1.0.0</h3>
            </div>
        </div>
      </div>
    </div>
  </div>
  

{/block}