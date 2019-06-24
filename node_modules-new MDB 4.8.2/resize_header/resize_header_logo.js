    window.onscroll = function() {
    growShrinkLogo()
  };

  var Logo = document.getElementById("header_logo");
  var endOfDocumentTop = 150;
  var size = 0;

  function growShrinkLogo() {
  var scroll = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

    if (size == 0 && scroll > endOfDocumentTop) {
      Logo.className = 'small-logo';
      size = 1;
    } else if(size == 1 && scroll <= endOfDocumentTop){
      Logo.className = 'large-logo';
    size = 0;
    }
  }