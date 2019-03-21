{* 
Default styling used with the foto-udt

Variables:
photo: {$foto->photo}
thumb: {$foto->thumb}
float: {$foto->side}
alt: {foto->alt}
title: {$foto->title} 
*}

{$cgblog_id = 436}
{if $foto->side|lower == 'right'}
    {$space_side = 'ml-2'}
{else}
    {$space_side = 'mr-2'}
{/if}
<div id="div_{$foto->fotofile}" class="float-{$foto->side} $space_side floatbox lozad" data-fb-options="group:cgblog-{$cgblog_id} caption:`{$foto->title}` type:image">
    <a id="a_{$foto->fotofile}" data-rel="foto_blog" class="floatbox" href="{$foto->photo}" aria-label="Photo">
        <img class="lozad img-fluid rounded z-depth-1" alt="{$foto->alt}" src="{$foto->thumb}">
    </a>
    <p class="text-wrap" style="width: 10rem;"><mark>{$foto->title}</mark><br/>
    <small>(klik voor grote foto)</small></p>
</div><p>