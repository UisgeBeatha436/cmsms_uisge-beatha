{strip}
{if $inline == 1}
<div class="d-none">
<svg xmlns="http://www.w3.org/2000/svg">
{else}
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0" y="0" viewBox="0 0 1000 1000" style="width: 0; height: 0">
{/if}
{/strip}
{strip}
<defs>
{foreach from=$svgdata item='svg' name='loop'}
  <symbol viewBox="{*$svg->viewBox*}0 0 1000 1000" id="shape-{$svg->id}">
    <path d="{$svg->d}"></path>
  </symbol>
{/foreach}
</defs>
{$w = $svg->w|intval}
{$h = $svg->h|intval}
{foreach from=$svgdata item='svg' name='loop'}
  {strip}
    {if $w >= 1}
      {math assign="_w" format='%.0f' equation="((1000 - $w) / 2) + (($w * 0) / 2)"}
    {else}
      {$_w=0}
    {/if}
    {if $h >= 1}
      {math assign="_h" format='%.0f' equation="((1000 - $h) / 2) + (($h * 0) / 2)"}
    {else}
      {$_h=0}
    {/if}
  {/strip}
{/foreach}
</svg>
{if $inline == 1}
</div>
{/if}
{/strip}
