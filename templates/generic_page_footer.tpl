{strip}
    {block name='body_footer'}
        <footer class="page-footer pt-4 mt-4 text-center text-md-left" data-background-color="grijs" data-visible="on" id="js_footer">
            {*Footer Left*}
            <div class="container-fluid">
                <div class="row">
                    {*Left column*}
                    <div class="col-md-3">
                    <p class="indigo-text darken-4">Op dit moment&nbsp;{visitors}.</p> {* Deze pagina is { HitCounter } keer bekeken.  *}
                    {*cge_cache_block key='YoutubeFooter' expires="3600"}
                        <div class="embed-responsive embed-responsive-16by9">
                        <iframe title="YoutubeFooter" class="embed-responsive-item lozad" data-src="https://www.youtube.com/embed/rY0Rd0C3OQ0"></iframe>
                        </div>
                    {/cge_cache_block*}
                    {cge_cache_block key='YoutubeFooter' expires="3600"}
                        <div class="youtube-player lozad" data-id="rY0Rd0C3OQ0"></div>
                    {/cge_cache_block}
                    <hr>
                    {include|strip file='cms_template:Ads_Google'}
                    </div>
                    {*/.Left column*}
                    <hr class="w-100 clearfix d-md-none">
                    {*Center column*}
                    <div class="col-md-5">
                        <a href='{root_url}#AIS'><h3 class="h3-responsive font-weight-bold text-center indigo-text">Waar bevindt Uisge Beatha zich?</h3></a>
                        {cgsi_convert}
                            {cge_cache_block key='ais' expires='60'}
                                <div id="mapContent" class="lozad"></div>
                            {/cge_cache_block}
                        {/cgsi_convert}
                    </div>
                    {*/.Center column*}
                    <hr class="w-100 clearfix d-md-none">
                    {*Right column*}
                    <div class="col-md-4">
                        <a href='{root_url}#mailing'><h3 class="h3-responsive font-weight-bold text-center indigo-text">Blijf op de hoogte!</h3></a>
                        <section id="mailing" class="form-elegant">
                            {CGBetterForms form="mailingForm"}
                        </section>
                    </div>
                    {* /.Right column*}
                </div>
            </div>
            {* /.Footer Links*}

            <hr>
            <div class="container-fluid" data-footer-background-color="blue_gradient">
                <div class="row">
                    {*Social buttons*}
                    <div class="col-md-7 col-lg-8">
                    </div>
                    <div class="col-md-5 col-lg-4 ml-lg-0 pt-3 float-right">
                        {global_content name='socialFollowButtons' shape='neutral' link='1'}
                    </div>
                    {*/.Social buttons*}
                </div>
            </div>
            {*Copyright*}
            <div class="footer-copyright py-3 text-center font-small indigo darken-3">
                <div class="container-fluid">
                &copy; {custom_copyright} Uisge Beatha (&nbsp;Sitemap {global_content name='Sitemap Pages'})- Made with <a href="https://www.cmsmadesimple.org/">CMS Made Simple</a>
                </div>
            </div>
            {*/.Copyright*}
        </footer>
        {*<div class="scroll" data-visible="off" id="js_scroll">
            { *$svg_file = '/svg.svg'}
            {$svg_file = ''}
            {svgdata assetsbase=1 file='svg/shape.svg' assign='svgdata'* }
            {$key = 'angle-up2'}

            {math assign="_w" format='%.0f' equation=((1000 - $svgdata[$key]->w) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
            {math assign="_h" format='%.0f' equation=((1000 - $svgdata[$key]->h) / 2) + (($svgdata[$key]->w * 0.30) / 2)}
            <a href="{get_current_url}#a-content" title="Scroll naar boven" aria-label="Scroll naar boven">
                <svg class="icon" viewBox="0 0 1000 1000" preserveAspectRatio="xMidYMid meet">
                    <use class="shape-{$key}" transform="translate({$_w} {$_h}) scale(0.70)" xlink:href="{$svg_file}#shape-{$key}"/>
                </svg>
            </a>
        </div>*}
    {/block}
{/strip}