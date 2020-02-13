import mapboxgl from 'mapbox-gl';

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
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });

    // Fit map to markers
    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 120, maxZoom: 15, duration: 0.5 });
    };

    fitMapToMarkers(map, markers);
  };
};

export { initMapbox };
