{if isset($items)}{$now = $smarty.now}
  {foreach from=$items item='entry' name='loop'}<url>
  <loc>{$entry->moreurl}</loc>
  <lastmod>{$entry->modified_date|date_format:'%Y-%m-%d'}</lastmod>
  <changefreq>{strip}
    {$mod_ts = "{strtotime str=$entry->modified_date}" }
    {math assign='age' equation="(n-m)/86400" n=$now m=$mod_ts}

    {if $age < 2}
      hourly
    {elseif $age< 14}
      daily
    {elseif $age < 30}
      weekly
    {else}
      monthly
    {/if}

  {/strip}</changefreq>
  <priority>0.6</priority>
</url>
{/foreach}
{/if}