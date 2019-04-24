{* plugin for photo's. Can only work as a module and not as part of es5 / es6 *}
<!-- floatboxgebruik -->
{if $page_alias == 'logboekpagina' OR
		$page_alias == 'youtube' OR
		$page_alias == 'fotoalbums' OR
		$page_alias == 'afkomst-naam' OR
		$page_alias == 'gps-tracks' OR
		$page_alias == 'testpagina' OR
		$page_alias == 'dehler-36-jv'}
    <!-- link rel="stylesheet" href="https://static.uisge-beatha.eu/uploads/_Javascripts/floatbox_811/floatbox.css" -->

		<script>
			var cb = function() {
			var l = document.createElement('link'); l.rel = 'stylesheet';
			l.href = 'https://statisch.uisge-beatha.eu/uploads/_Javascripts/floatbox_823/floatbox/floatbox.css';
			var h = document.getElementsByTagName('head')[0]; h.parentNode.insertBefore(l, h);
			};
			var raf = requestAnimationFrame || mozRequestAnimationFrame ||
			webkitRequestAnimationFrame || msRequestAnimationFrame;
			if (raf) raf(cb);
			else window.addEventListener('load', cb);
		</script>
		{jsmin}
			<script defer src="{$static_url}/uploads/_Javascripts/floatbox_823/floatbox_merged.js" type="text/javascript"></script>
		{/jsmin}
{/if}