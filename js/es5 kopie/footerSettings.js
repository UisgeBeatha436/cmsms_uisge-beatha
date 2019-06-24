/**
 * cmsms_uisge-beatha
 * @version v1.0.0
 * @link https://github.com/UisgeBeatha436/cmsms_uisge-beatha
 * @author Gregor
 * @license GPL-3.0
 */
function labnolThumb(e){return'<img src="https://i.ytimg.com/vi/ID/hqdefault.jpg" alt="Youtube Uisge Beatha">'.replace("ID",e)+'<div class="play"></div>'}function labnolIframe(){var e=document.createElement("iframe");e.setAttribute("src","https://www.youtube.com/embed/ID?autoplay=1".replace("ID",this.dataset.id)),e.setAttribute("frameborder","0"),e.setAttribute("allowfullscreen","1"),this.parentNode.replaceChild(e,this)}$("blockquote").last().addClass("blockquote"),$(document).ready(function(){$(".mdb-select").materialSelect()}),dyscrollup.init({showafter:600,scrolldelay:500,position:"right",image:"./uploads/images/cms/image-dyscrollup/32.png",shape:"circle",width:30,height:30}),document.addEventListener("DOMContentLoaded",function(){var e,t,a=document.getElementsByClassName("youtube-player");for(t=0;t<a.length;t++)(e=document.createElement("div")).setAttribute("data-id",a[t].dataset.id),e.innerHTML=labnolThumb(a[t].dataset.id),e.onclick=labnolIframe,a[t].appendChild(e)});
//# sourceMappingURL=footerSettings.js.map
