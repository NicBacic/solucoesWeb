// Generated by CoffeeScript 1.9.3

  var handleLocationError, initMap, map;

  handleLocationError = void 0;

  initMap = void 0;

  map = void 0;

  //Function called once app is started. It creates Google Map with GeoLocation
  initMap = function() {
    var infoWindow;
    infoWindow = void 0;

    //Create map with 17 zoom centered in São Paulo
    map = new google.maps.Map(document.getElementById('map'), {
      center: {
        lat: -23.5489,
        lng: -46.6388
      },
      zoom: 17
    }); //end map creation

    //InfoWindow is used to popup a message in a marker
    infoWindow = new google.maps.InfoWindow({
      map: map
    });

    //If browser has a Geolocator, than we set the center of the map in its location
    if (navigator.geolocation) {

      //Get Current position
      navigator.geolocation.getCurrentPosition((function(position) {
        var marker, pos;
        marker = void 0;
        pos = void 0;
        pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        //Change maps center position
        infoWindow.setPosition(pos);
        infoWindow.setContent('Localização encontrada');
        map.setCenter(pos);

        //Set a marker in it position
        marker = new google.maps.Marker({
          position: pos,
          map: map
        });

        //Then we call handleLocationError if the browser doesn't support geolocation. This function shows the user this information.
      }), function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      handleLocationError(false, infoWindow, map.getCenter());
    }

    

  }; //end initMap


  handleLocationError = function(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ? 'Erro: O serviço de Geolocalização falhou.' : 'Erro: Seu browser ou dispositivo não suportam essa funcionalidade');
  };

//Now, if bus options is selected, then, for each bus stop in determined ratio, we add a marker in the map.
  function busOptions(str){
      if (str == "") {
        clearOverlays(); //clear marks
        return;
      } else { 
        
        

        //console.log("Stops length = " + stops.length)


        if (str == "1"){
        
          var stops = $('#stops').data('stops');
          var markersArray = new Array(stops.length);

          for(var i = 0; i < stops.length; i++){
              markersArray[i] = 
                {
                  coords:{lat:stops[i].stop_lat,lng:stops[i].stop_long},
                  content:'<h2>Bus Stop 1</h2>'
                };
              
              console.log(i)
          }

          // Loop through markers
          for(var i = 0;i < markersArray.length;i++){
            // Add marker
            addMarker(markersArray[i]);
          }

          // Add Marker Function
          function addMarker(props){
            var marker = new google.maps.Marker({
              position:props.coords,
              map:map,
              //icon:props.iconImage
            });

            // Check for customicon
            if(props.iconImage){
              // Set icon image
              marker.setIcon(props.iconImage);
            }

            // Check content
            if(props.content){
              var infoWindow = new google.maps.InfoWindow({
                content:props.content
              });

              marker.addListener('click', function(){
                infoWindow.open(map, marker);
              });
            } // end if props
          } //end function add marker
        }// end if
      } // end else
    } //end function busOptions


  /*Clear all Marks (NOT CURRENT WORKING)
  function clearOverlays() {
    for (var i = 0; i < markersArray.length; i++ ) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }*/

