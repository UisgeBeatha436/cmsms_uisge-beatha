// Lazy load 20feb19: Obsolete
    // var myLazyLoad = new LazyLoad({
    //     elements_selector: ".lazy"
    // });

    // lazyload used in the Bootstrap carousel
    // $(function() {
    //     return $(".carousel.lazy").on("slide.bs.carousel", function(ev) {
    //     var lazy;
    //     lazy = $(ev.relatedTarget).find("img[data-src]");
    //     lazy.attr("src", lazy.data('src'));
    //     lazy.removeAttr("data-src");
    //     });
    // });

// noptimize  |  https://gulshankumar.net/setup-lazy-loading-google-adsense-ad-units/
    //  function downloadJSAtOnload() {
    //     var element = document.createElement("script");
    //     element.src = "https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js";
    //     document.body.appendChild(element);
    //     }
    //     if (window.addEventListener)
    //       window.addEventListener("load", downloadJSAtOnload, false);
    //     else if (window.attachEvent)
    //       window.attachEvent("onload", downloadJSAtOnload);
    //     else window.onload = downloadJSAtOnload;
    //  /noptimize

// Content with blockquotes is missing a class. Script to add it otherwise Bootstrap wouldn't understand it
    $( "blockquote" ).last().addClass( "blockquote" );

// CookiesEuBanner
    //new CookiesEuBanner(function(){
        // Your code to launch when user accept cookies
    //    console.log('Cookies accepted and loaded');
    //    }, true);

// Material Select Initialization
// Material Select Initialization
    $(document).ready(function() {
        $('.mdb-select').materialSelect();
        $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
            $(this).closest('.select-outline').find('label').toggleClass('active');
            $(this).closest('.select-outline').find('.caret').toggleClass('active');
        });
    });

// init dyscrollup -->
    dyscrollup.init({
        showafter : 600,
        scrolldelay : 500,
        position : "right",
        image : "./uploads/images/cms/image-dyscrollup/32.png",
        shape : "circle",
        width : 30,
        height : 30
    });

// Youtube
    document.addEventListener("DOMContentLoaded",
    function() {
        var div, n,
            v = document.getElementsByClassName("youtube-player");
        for (n = 0; n < v.length; n++) {
            div = document.createElement("div");
            div.setAttribute("data-id", v[n].dataset.id);
            div.innerHTML = labnolThumb(v[n].dataset.id);
            div.onclick = labnolIframe;
            v[n].appendChild(div);
        }
    });

    function labnolThumb(id) {
    var thumb = '<img src="https://i.ytimg.com/vi/ID/hqdefault.jpg" alt="Youtube Uisge Beatha">',
        play = '<div class="play"></div>';
    return thumb.replace("ID", id) + play;
    }

    function labnolIframe() {
    var iframe = document.createElement("iframe");
    var embed = "https://www.youtube.com/embed/ID?autoplay=1";
    iframe.setAttribute("src", embed.replace("ID", this.dataset.id));
    iframe.setAttribute("frameborder", "0");
    iframe.setAttribute("allowfullscreen", "1");
    this.parentNode.replaceChild(iframe, this);
    }
//
// EOF
//
