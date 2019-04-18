{jsmin}
    <script type="text/javascript">
        var elm=document.getElementsByTagName("html")[0];
        elm.style.display="none";
        document.addEventListener("DOMContentLoaded",function(event) { elm.style.display="block"; });
        </script>
        <script>
        var mst_width="100%";var mst_height="450px";var mst_border="0";var mst_map_style="terrain";var mst_mmsi="244770624";var mst_show_track="";var mst_show_info="";var mst_fleet="";var mst_lat="";var mst_lng="";var mst_zoom="";var mst_show_names="0";var mst_scroll_wheel="true";var mst_show_menu="true";
        function loadMap() {
        var element = document.createElement("script");
        element.setAttribute("id", "myshiptrackingscript");
        element.setAttribute("async", "");
        element.setAttribute("defer", "");
        element.src = "https://www.myshiptracking.com/js/widgetApi.js";
        document.getElementById("mapContent").appendChild(element );
        }      
            window.onload = loadMap
        console.log('MyShipTracking loaded')
    </script>
{/jsmin}