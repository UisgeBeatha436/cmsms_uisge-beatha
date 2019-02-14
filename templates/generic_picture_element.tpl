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
        <img{if $item.style !=''} style="{$item.style}"{/if}{if $item.class !=''} class="{$item.class}"{/if} {if $params_in['custom_01'] eq 'off'}data-src{else}src{/if}="{$item.output}" alt="{$item.alt}">
        {/if}
    {/foreach}
    </picture>
    {else}
        <img data-image="0"{if $picture_element[0].style !=''} style="{$picture_element[0].style}"{/if}{if $picture_element[0].class !=''} class="{$picture_element[0].class}"{/if} src="{$picture_element[0].src}" } alt="{$picture_element[0].alt}">
    {/if}
{/if}