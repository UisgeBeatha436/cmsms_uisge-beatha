{* Template for SCRIBD.COM shared documents 
Parameters: 
id = id given by Scribd
key = key related to Scribd document
text = text to be shown as link

Call: 
{global_content name='scribd' id="278002851" key="a6mnQV8GLOOlVbktB3UY" text="Volvo Penta MD2020d"}

Gives:
<a class="floatbox" href="https://www.scribd.com/embeds/278002851/content?start_page=1&amp;view_mode=scroll&amp;access_key=key-a6mnQV8GLOOlVbktB3UY&amp;show_recommendations=true">Volvo Penta MD2020d</a>
*}


{* $id = isset($params['id']) ? $params['id'] : ''; *}
{assign var="id" value={$gcb_params.id}}
{assign var="key" value={$gcb_params.key}}
{assign var="text" value={$gcb_params.text}}

{if !isset($key)}
    <a class="floatbox" href="//www.scribd.com/embeds/{$id}/content?start_page=1&amp;view_mode=scroll&amp;show_recommendations=true">{$text}</a>
{else}
    <a class="floatbox" href="//www.scribd.com/embeds/{$id}/content?start_page=1&amp;view_mode=scroll&amp;access_key=key-{$key}&amp;show_recommendations=true">{$text}</a>
{/if}