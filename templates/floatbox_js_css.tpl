{* plugin for photo's. Can only work as a module and not as part of es6 *}
<!-- floatboxgebruik -->
<script src="https://static.uisge-beatha.eu/_Javascripts/floatbox_813/floatbox/floatbox.js"></script>
<!-- link rel="stylesheet" href="https://static.uisge-beatha.eu/_Javascripts/floatbox_811/floatbox.css" -->
<script>
{jsmin}
    var cb = function() {
    var l = document.createElement('link'); l.rel = 'stylesheet';
    l.href = 'https://static.uisge-beatha.eu/_Javascripts/floatbox_813/floatbox/floatbox.css';
    var h = document.getElementsByTagName('head')[0]; h.parentNode.insertBefore(l, h);
    };
    var raf = requestAnimationFrame || mozRequestAnimationFrame ||
    webkitRequestAnimationFrame || msRequestAnimationFrame;
    if (raf) raf(cb);
    else window.addEventListener('load', cb);
{/jsmin}
</script>
