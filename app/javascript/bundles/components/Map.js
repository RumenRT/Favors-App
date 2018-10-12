import React, { Component } from 'react';
import mapboxgl from 'mapbox-gl';
import axios from 'axios';
import ReactDOMServer from 'react-dom/server'
import Popup from './Popup'

export default class Map extends Component {
  constructor() {
    super()
    this.state = {
      myFavors: []
    }
    window.map = this
  }
  async componentDidMount() {
    let data;
    let favors;
    const geolocationOptions = {
      enableHighAccuracy: true,
      maximumAge: 30000,
      timeout: 27000
    }
    // options for mapbox comp
    const mapOptions = {
      container: this.mapContainer,
      style: `mapbox://styles/mapbox/streets-v9`,
      pitch: 43, // pitch in degrees
      bearing: -1, // bearing in degrees
      zoom: 14,
      minZoom: 5,
      maxZoom: 25,
      center: [-80.2044, 25.8028]
    }

    data = await axios.get('/favors.json')
    favors = data.data
    this.setState({ myFavors: favors })
    mapboxgl.accessToken = 'pk.eyJ1IjoiYW5keXdlaXNzMTk4MiIsImEiOiJIeHpkYVBrIn0.3N03oecxx5TaQz7YLg2HqA'
    await this.createMap(mapOptions, geolocationOptions);
  }

  // initializes maps
  createMap = (mapOptions, geolocationOptions) => {
    this.map = new mapboxgl.Map(mapOptions);
    const map = this.map;

    // appends geolocator button
    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: geolocationOptions,
        trackUserLocation: true
      })
    );

    //appends zoom in/out control
    map.addControl(
      new mapboxgl.NavigationControl({
        positionOptions: geolocationOptions,
        trackUserLocation: true
      })
    );

    // on map load fetches favors
    map.on('load', (event) => {
      this.fetchFavors();
      this.addCircle();
    });
  }

  fetchFavors = async () => {
    const map = this.map;
    const self = this;
    await axios.get(`/favors.json`)
      .then((res) => {
        let newMarkers = res.data
        newMarkers.features.forEach((favor, i) => {
          var elm = document.createElement('div')
          elm.className = `${favor.properties.category}`
          let popup = new mapboxgl.Popup({ offset: 25 })
            .setHTML(ReactDOMServer.renderToStaticMarkup(
              <Popup favor={favor.properties}></Popup>
            ))
          let marker = new mapboxgl.Marker(elm)
            .setLngLat(favor.geometry.coordinates)
            .setPopup(popup);
          marker.addTo(map)
        })
      })
  }

  addCircle = () => {
    var points = 64;
    var coords = this.map.getCenter();
    var km = 1;

    var ret = [];
    var distanceX = km/(111.320*Math.cos(coords.lat*Math.PI/180));
    var distanceY = km/110.574;

    var theta, x, y;
    for(var i=0; i<points; i++) {
        theta = (i/points)*(2*Math.PI);
        x = distanceX*Math.cos(theta);
        y = distanceY*Math.sin(theta);

        ret.push([coords.lng+x, coords.lat+y]);
    }
    ret.push(ret[0]);

    console.log(ret);

    this.map.addSource("polygon",
      {
        "type": "geojson",
        "data": {
            "type": "FeatureCollection",
            "features": [{
                "type": "Feature",
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [ret]
                }
            }]
        }
      } 
    );
    this.map.addLayer({
        "id": "polygon",
        "type": "fill",
        "source": "polygon",
        "layout": {},
        "paint": {
            "fill-color": "teal",
            "fill-opacity": 0.2
        }
    });
  }

  render() {
    const style = {
      width: '100%',
      height: '650px',
      backgroundColor: 'azure'
    };
    return <div style={
      style
    }
      ref={
        el => this.mapContainer = el
      }
    />;
  }

  componentWillUnmount() {
    this.map.remove();
  }
}