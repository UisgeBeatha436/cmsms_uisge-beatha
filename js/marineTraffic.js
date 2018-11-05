 
    width='100%';	// the width of the embedded map in pixels or percentage 
    height='300';	// the height of the embedded map in pixels or percentage 
    border='1';	// the width of the border around the map (zero means no border) 
    shownames='true';	// to display ship names on the map (true or false) 
    latitude='51.7143';	// the latitude of the center of the map, in decimal degrees 
    longitude='04.0889';	// the longitude of the center of the map, in decimal degrees 
    zoom='11';	// the zoom level of the map (values between 2 and 17) 
    maptype='0';	// use 0 for Normal Map, 1 for Satellite, 2 for OpenStreetMap 
    trackvessel='' //244770624';	 MMSI of a vessel (note: vessel will be displayed only if within range of the system) - overrides "zoom" option 
    fleet='';	// the registered email address of a user-defined fleet (user's default fleet is used) 
    // Read more at http://www.marinetraffic.com/en/p/embed-map#6YXCVvOUaBxYHgoT.99
    // <script type="text/javascript" src="https://www.marinetraffic.com/js/embed.js"></script>
    includeJs("https://www.marinetraffic.com/js/embed.js");

    function includeJs(jsFilePath) {
        var js = document.createElement("script");
    
        js.type = "text/javascript";
        js.src = jsFilePath;
    
        document.body.appendChild(js);
    }
    
   

    //
    // EOF
    //
    