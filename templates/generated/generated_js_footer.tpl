{*
only edit the src/nunjucks/js_footer.njk file
NOT the templates/es/generated_js_footer.tpl (it is overwritten durring the webpack build)
*}

<script>
  
  (function() {
    var check = document.createElement('script');
    if (!('noModule' in check) && 'onbeforeload' in check) {
      var support = false;
      document.addEventListener('beforeload', function(e) {
        if (e.target === check) {
          support = true;
        } else if (!e.target.hasAttribute('nomodule') || !support) {
          return;
        }
        e.preventDefault();
      }, true);

      check.type = 'module';
      check.src = '.';
      document.head.appendChild(check);
      check.remove();
    }
  }());
</script>
<script nomodule src="{$theme_relative_url}/js/es6/runtime-36111c3d38.es5.js"></script>
<script nomodule src="{$theme_relative_url}/js/es6/main-legacy-5c05d8c7c6.es5.js"></script>