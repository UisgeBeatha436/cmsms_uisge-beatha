{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}  {* changed it to the right theme *}
{extends file="{#theme_resource#}page_base.tpl"}

{block name='open_content' append}
  {$content_image_01 = "{content_image dir='images' block='content_image_01' urlonly='true' label='Content image 01'}" scope='global'}
  {$content_01="{content label='Content 01'}" scope='global'}
{/block}

{block name='body_content'}

<span class="border border-primary">Home page bootstrap border to see if bootstrap is loaded</span>

  <div class="l-full">
    <div class="parallax"> {* Create text in the center of the homepage *}
      <svg>
        <text x="50%" y="50%" dy=".3em">
          {sitename}
        </text>
      </svg>
    </div>

    <div class="l-hero" data-visible="on" id="js_hero">
      {if isset($content_02) && $content_02 != ''}
        {$src_in=$content_02|replace:"{root_url}/":''}
        {picture_element
          src=$src_in
          scales='304, 305, 465, 705, 945, 1137, 1425'
        }
      {else} 
        <img data-image="0" src="//placehold.it/1500x541" alt="placehold.it" class="cover">
      {/if}
    </div>
  </div>

  <a id="a-content"></a>

  <div class="l-full">
    <div class="l-content" data-visible="on" id="js_content">
      {$content_01}
    </div>
  </div>

{/block}
