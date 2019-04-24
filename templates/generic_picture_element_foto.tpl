{if isset($picture_element)}
    {if $picture_element|@count >= 2}
        <picture>
            {foreach from=$picture_element item='item' key='key' name='loop'}
                {if $smarty.foreach.loop.first}
                    {* <!--[if IE 9]><video style="display: none;"><![endif]--> *}
                {/if}
                <source {if $params_in['custom_01'] eq 'off'}data-srcset{else}srcset{/if}="{$item.output}"{if $item.media != ''} media="{$item.media}"{/if}>
                {if $smarty.foreach.loop.last}
                    {* <!--[if IE 9]></video><![endif]--> *}
                    {$foto_file = $item.src|pathinfo: 2}
                    {$foto_file = str_replace(' ', '_', $foto_file)}
                    {$foto_file = str_replace('-', '_', $foto_file)}
                    <div id="div_{$foto_file|substr:0:-4}" {if $item.class !=''} class="floatbox {$item.class}"{/if} data-fb-options="group:cgblog-123 caption:`{$item.title}` type:image">
                        <a id="a_{$foto_file|substr:0:-4}" data-rel="foto_blog" class="floatbox" href="{$item.src}" aria-label="Photo">
                            <img{if $item.style !=''} style="{$item.style}"{/if}{if $item.class !=''} class="{$item.class} rounded z-depth-1"{/if} {if $params_in['custom_01'] eq 'off'}data-src{else}src{/if}="{$item.output}" alt="{$item.alt}">
                        </a>
                        <p class="text-wrap" style="width: 10rem;"><mark>{$item.title}</mark><br/>
                        <small>(klik voor grote foto)</small></p>
                    </div>
                {/if}
            {/foreach}
        </picture>
    {else}
        <img data-image="0"{if $picture_element[0].style !=''} style="{$picture_element[0].style}"{/if}{if $picture_element[0].class !=''} class="{$class} {$picture_element[0].class}"{/if} data-src="{$picture_element[0].src}" alt="{$picture_element[0].alt}">
    {/if}
{/if}