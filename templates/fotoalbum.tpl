{* uploads_url} https://www.uisge-beatha.eu/uploads 
https://www.uisge-beatha.eu/uploads/images/Gallery/Winter1617/Kajuitramen
{global_content name='fotoalbum' album="Winter1617/Kajuitramen" foto="Kajuitramen - 01"}
*}
{* 11jun18 for testing purposes Google adsense activated *}
{include file='cms_template:Advertentie'}
<div style="clear:both"></div> {* make sure heading is aligned to the left *}
{assign var='album_no_spaces' value=str_replace(' ', ' ', "uploads/images/Gallery/{$gcb_params.album}")}
{assign var="tmp_alt" value={$gcb_params.album}|strpos:"/"}
{assign var="alt" value="{$gcb_params.album|substr:{$tmp_alt+1}}"}
{assign var="alt_id" value=str_replace(' ','_',"{$alt}")}
{assign var="x" value=314}
{assign var="first_photo" value="uploads/images/Gallery/{$gcb_params.album}/{$gcb_params.foto}.jpg"}
<section class="text-center my-5">
    <div class="row">
        <div class="col-12">
            <h3 class="h3-responsive font-weight-bold">{svg use="camera"}&nbsp;Meer foto's in het album</h3>
        </div>
    </div>
    <p> {* view source code shows a missing p-tag *}
    {assign var='files' value="{$album_no_spaces}/*.jpg"|glob}
    {if count($files)}
        <div id="div_{$alt_id}-{$x}" class="floatbox" data-fb-options="doSlideshow:`true` group:`cgblog` caption:`{$alt}` header:`#socialmediashare1-20` type:`image`">
            <a id="{$alt_id}-{$x}" data-rel="fotoalbum" title="{$alt}" href="{$first_photo|cms_escape:'urlpathinfo'}">{CGSmartImage src="{$first_photo}" width="250" alt="Uisge Beatha, Zeilen, {$alt}" title="{$alt}" notag=0 noembed={$noembed} noresponsive=1}</a>
            {foreach from=$files item='file'}
                {if !$file|contains:"thumb_"}
                    {$x = {$x+1}}
                    {assign var='fotos' value="{root_url}/{$file|cms_escape:'urlpathinfo'}"}
                    {* <a id="{$alt_id}-{$x}" data-rel="fotoalbum" title="{$alt}" href="{CGSmartImage src={$file} alt="Uisge Beatha, Zeilen, {$alt}" title="{$alt}" noresponsive=1 notag=1 noembed={$noembed}}"></a> *}
                    <a id="a_{$alt_id}-{$x}" data-rel="fotoalbum" class="lozad" title="{$alt}" href="{CGSmartImage src={$file} alt="Uisge Beatha, Zeilen, {$alt}" title="{$alt}" noresponsive=1 notag=1 noembed={$noembed}}"></a>
                    {* <a id="{$alt_id}-{$x}" data-rel="fotoalbum" title="{$alt}" href="{$file|cms_escape:'urlpathinfo'}">
                        <img class="lozad img-fluid" data-src="{CGSmartImage src="{$fotos}" noresponsive='1' alt='{$alt}' title="Uisge Beatha, Zeilen, {$alt}" notag=1 noembed={$noembed}}"/> 
                    </a> *}
                    {* href="{$file|cms_escape:'urlpathinfo'} *}
                {/if}
            {/foreach}
        </div><p> {* needed to for come a warning on W3C validation *}
    {/if}
<section>