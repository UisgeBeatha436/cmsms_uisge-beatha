/* 24jul17 +++++ Facebook Share / like button +++++ */
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.async=true;
  js.src = "https://www.connect.facebook.net/nl_NL/sdk.js#version=v3.2&xfbml=1"; /* &appID=175931732519501"; */
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
/* +++++ End of Facebook Share / like button +++++ */

/* +++++ Facebook Reply Box +++++ */
(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.async=true;
        /* js.src = "//connect.facebook.net/nl_NL/all.js#xfbml=1&appId=175931732519501"; */
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));
/* +++++ End Facebook Reply Box +++++ */

/* +++++ Code for Twitter +++++ */
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0],
    t = window.twttr || {};
  if (d.getElementById(id)) return t;
  js = d.createElement(s);
  js.id = id;
  js.async=true;
  js.src = "https://platform.twitter.com/widgets.js";
  fjs.parentNode.insertBefore(js, fjs);
  t._e = [];
  t.ready = function(f) {
    t._e.push(f);
  };
  return t;
}(document, "script", "twitter-wjs"));
/* +++++ End code for Twitter +++++ */

/* +++++ Google Plus share button +++++ */
// (function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'https://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })(); 

/* <script type="text/javascript">
  window.___gcfg = {lang: 'nl'};
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/platform.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script> */
/* +++++ End Google Plus share button +++++ */