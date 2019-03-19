{strip}
{if $inline == 1}
<svg x="0" y="0" viewBox="0 0 1000 1000" style="display: none;">
{else}
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0" y="0" viewBox="0 0 1000 1000">
{/if}
{/strip}

  <defs>

<style type="text/css">
{literal}
  g {
    display: none;
  }
  g:target {
      display: inline;
  }
{/literal}

{config_load file='theme.ini' scope='global' section='cmsms_uisge-beatha'}
{include file="{#theme_resource#}txt_colors.tpl"}

  {foreach from=$colors item='color' name='loop'}
  .{$color['name']} {
    fill: {$color['hex']};
  }
  {/foreach}

</style>

{foreach from=$svgdata item='svg' name='loop'}
  <symbol viewBox="{*$svg->viewBox*}0 0 1000 1000" id="shape-{$svg->id}">
    <path d="{$svg->d}" />
  </symbol>
{/foreach}
  <symbol viewBox="0 0 1000 1000" id="custom-square">
    <rect x="0" y="0" width="1000" height="1000" />
  </symbol>

  <symbol viewBox="0 0 1000 1000" id="custom-square-round">
      <rect x="0" y="0" width="1000" height="1000" rx="150" ry="150" />
  </symbol>

  <symbol viewBox="0 0 1000 1000" id="custom-circle">
    <circle cx="500" cy="500" r="500"/>
  </symbol>

</defs>

{* generate shapes with pre-assigned colours *}

{$w = $svg->w|intval}
{$h = $svg->h|intval}

{foreach from=$svgdata item='svg' name='loop'}
  {strip}
    {if $w >= 1}
      {math assign="_w" format='%.0f' equation=((1000 - $w) / 2) + (($w * 0) / 2)}
    {else}
      {$w=0}
    {/if}
    {if $h >= 1}
      {math assign="_h" format='%.0f' equation=((1000 - $h) / 2) + (($h * 0) / 2)}
    {else}
      {$h=0}
    {/if}
  {/strip}
  {foreach from=$colors item='color' name='sub_loop'}
    <g id="shape-{$svg->id}-{$color['name']}">
      <use class="{$color['name']}" transform="translate({$_w} {$_h}) scale(1)" preserveAspectRation="xMidYMid meet" xlink:href="#shape-{$svg->id}"/>
    </g>
  {/foreach}
{/foreach}

{capture}
{* you can also generate combined shapes *}
<g id="square-round-{$svg->id}-{$color['name']}">
<use class="black" xlink:href="#custom-square-round"/>
<use class="{$color['name']}" transform="translate({*$_w*} {*$_h*}) scale(1)" preserveAspectRation="xMidYMid meet" xlink:href="#{$svg->id}"/>
</g>
<g id="circle-{$svg->id}-{$color['name']}">
<use class="white" xlink:href="#custom-circle"/>
<use class="{$color['name']}" transform="translate({*$_w*} {*$_h*}) scale(1)" preserveAspectRation="xMidYMid meet" xlink:href="#{$svg->id}"/>
</g>
{/capture}

</svg>