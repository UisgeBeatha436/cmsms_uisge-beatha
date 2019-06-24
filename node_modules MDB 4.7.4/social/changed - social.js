/* +++++ Code for Facebook Like button +++++ */
 (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.async=true;
      js.src = 'https://connect.facebook.net/nl_NL/sdk.js#xfbml=0&version=v3.2&appId=175931732519501&autoLogAppEvents=1';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
/* +++++ End Code Facebook Like +++++ */

(function () {
        FB.init({appId: '175931732519501', version: 2.6, xfbml: true});

        // *** here is my code ***
        if (typeof facebookInit == 'function') {
            facebookInit();
        }
    });

    (function () {
        var e = document.createElement('script');
        e.src = document.location.protocol + 'https://connect.facebook.net/en_US/all.js';
        e.async = true;
        document.getElementById('fb-root').appendChild(e);
    }());


    (function facebookInit() {
        console.log('Found FB: Loading comments.');
        FB.XFBML.parse();
    });
/* +++++ Facebook comments plugin +++++ * /
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.async=true;
  js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=0&version=v2.6";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
/ * +++++ End Facebook comments plugin +++++ */

/* +++++ Code for Twitter +++++ */
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0],
    t = window.twttr || {};
  if (d.getElementById(id)) return t;
  js = d.createElement(s);
  js.id = id;
  js.async=true;
  js.src = "http://platform.twitter.com/widgets.js"; /* https */
  fjs.parentNode.insertBefore(js, fjs);
  t._e = [];
  t.ready = function(f) {
    t._e.push(f);
  };
  return t;
}(document, "script", "twitter-wjs"));
/* +++++ End code for Twitter +++++ */

/* +++++ Google Plus share button +++++ */
(function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'http://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })(); 
/* https */

/* <script type="text/javascript">
  window.___gcfg = {lang: 'nl'};
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/platform.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script> */
/* +++++ End Google Plus share button +++++ */