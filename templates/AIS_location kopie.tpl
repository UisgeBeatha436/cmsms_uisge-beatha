{* jsmin}
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
{/jsmin *}

{jsmin}
   {*<script type="text/javascript">
        // Map appearance
        var width="100%";         // width in pixels or percentage
        var height="300";         // height in pixels
        var names=true;           // always show ship names (defaults to false)

        // Single ship tracking
        var mmsi="244770624";        // display latest position (by IMO, overrides MMSI)
        var show_track=true;      // display track line (last 24 hours)
    </script>
    <script type="text/javascript" src="https://www.vesselfinder.com/aismap.js"></script>

    <script type="text/javascript">
        var elm=document.getElementsByTagName("html")[0];
        elm.style.display="none";
        document.addEventListener("DOMContentLoaded",function(event) { elm.style.display="block"; });
    </script>
*}

    {*<script>
        var width="100%"; var height="300"; var names=true; mmsi="244770624"; var show_track=true;
        function loadMap() {
            var element = document.createElement("script");
            element.setAttribute("id", "vesselfinderscript");
            // element.setAttribute("async", "");
            // element.setAttribute("defer", "");
            element.src = "https://www.vesselfinder.com/aismap.js";
            document.getElementById("mapContent").appendChild(element );
        }
            window.onload = loadMap; // (); needed????
        console.log('Vesselfinder loaded')
    </script>*}

    <script>
        function loadMap(){

            var map = '<iframe name="vesselfinder" id="vesselfinder" class="lozad" ' +
            'src="https://www.vesselfinder.com/aismap?zoom=undefined&amp;lat=undefined&amp;lon=undefined&amp;width=100%&amp;height=400&amp;' +
            'names=true&amp;mmsi=244770624&amp;track=true&amp;fleet=false&amp;fleet_name=false&amp;fleet_hide_old_positions=false&amp;' +
            'clicktoact=false&amp;store_pos=true&amp;ra=http://localhost" width="100%" height="400" frameborder="0">Sorry, this browser does not support embedded objects.<br/>' +
            'Visit directly <a href="https://www.vesselfinder.com" target="_blank">www.vesselfinder.com</a></iframe>';
            document.getElementById("mapContent").innerHTML = map;
        }

        window.onload = loadMap();
         console.log('Vesselfinder loaded')
    </script>

{/jsmin}