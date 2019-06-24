// Google Plus
// (function() { var po = document.createElement('script'); 
// po.type = 'text/javascript'; 
// po.async = true; po.src = 'https://apis.google.com/js/platform.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })();
//
// Twitter
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
//
// <script async defer crossorigin="anonymous" src="https://connect.facebook.net/nl_NL/sdk.js#xfbml=1&version=v3.2&appId=175931732519501&autoLogAppEvents=1"></script>
// Facebook
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.async=true;
    js.src = "https://connect.facebook.net/nl_NL/sdk.js#xfbml=1&version=v3.2";  //xfbml changed from 1 -> 0 (stackoverflow)
    fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
window.fbAsyncInit = function () {
    FB.init({
        appId   : '175931732519501',
        xfbml   : true,
        version : 'v3.2'
    });
};
    // *** here is my code ***
    if (typeof facebookInit == 'function') {
        facebookInit();
    }
//
// Pinterest
// $(document).ready(function() {
//     $.getScript('https://assets.pinterest.com/js/pinit.js', function(){});
// });
(function(d){
    var f = d.getElementsByTagName('SCRIPT')[0], p = d.createElement('SCRIPT');
    // p.type = 'text/javascript';
    p.async = true;
    p.src = 'https://assets.pinterest.com/js/pinit.js';
    f.parentNode.insertBefore(p, f);
}(document));
//
// Google translate
function googleTranslateElementInit() {
    new google.translate.TranslateElement({pageLanguage: 'nl',
      includedLanguages: 'en,fr,de,da,sv',
      layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
      gaTrack: true, gaId: 'UA-3361592-1'}, 'google_translate_element');
  }
  
  var googleTranslateScript = document.createElement('script');
  // googleTranslateScript.type = 'text/javascript';
  googleTranslateScript.async = true;
  googleTranslateScript.src = 'https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit';
  ( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild(googleTranslateScript);