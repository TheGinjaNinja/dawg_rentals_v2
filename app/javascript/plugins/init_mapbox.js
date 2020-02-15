import mapboxgl from 'mapbox-gl';

// Fit map to markers
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 120, maxZoom: 15, duration: 0.5 });
};

// Add info windows to map
const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {

    // Create a HTML element for your custom marker
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '30px';
    element.style.height = '30px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    // Create map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/jonasvanbuel/ck6jtqqzo04zg1ilp1ffedagx'
    });

    // Add markers
    const markers = JSON.parse(mapElement.dataset.markers);

    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  };
};

export { initMapbox };
