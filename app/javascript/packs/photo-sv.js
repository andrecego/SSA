import PhotoSphereViewer from "photo-sphere-viewer"
import galaxy from '../images/360/galaxy.jpg'

$(document).on('turbolinks:load', function () {
  var constellations = [{
    // id: "pegasus",
    // image: '../images/placeholders/cosmo-placeholder.png',
    // tooltip: 'Constelação de Pegasus',
    // width: 256,
    // height: 256,
    // latitude: -0.55770,
    // longitude: 0.5
  }]

  function summon() {
    locate(1000)
    setTimeout(locate(900), 1000)
    setTimeout(locate(900), 1800)

    // setTimeout(function () {
    //   viewer.animate({
    //     longitude: chance.floating({ min: 0, max: 6.28, fixed: 5 }),
    //     latitude: chance.floating({ min: -1.57, max: 1.57, fixed: 5 })
    //   }, 900);
    // }, 1000);

    // setTimeout(function () {
    //   viewer.animate({
    //     longitude: rand["longitude"],
    //     latitude: rand["latitude"]
    //   }, 900);
    // }, 1800);

  };

  function locate(speed) {
    var rand = constellations[chance.floating({ min: 0, max: constellations.length - 1, fixed: 0 })]
    viewer.animate({
      longitude: rand["longitude"],
      latitude: rand["latitude"]
    }, speed);
  }


  var viewer = new PhotoSphereViewer({
    container: 'viewer',
    panorama: galaxy,
    navbar: [
      'markers',
      // {
      //   id: 'cross',
      //   title: 'Cross',
      //   className: 'cross',
      //   content: '+'
      // },
      {
        id: 'summon',
        title: 'Summon',
        className: 'summon',
        onClick: summon
      },
    ],
    time_anim: false,
    min_fov: 89.99,
    mousewheel: false,
    // markers: constellations,
    lang: {
      autorotate: 'Rotação Automática',
      zoom: 'Zoom',
      zoomOut: 'Zoom out',
      zoomIn: 'Zoom in',
      download: 'Download',
      fullscreen: 'Tela Cheia',
      markers: 'Marcadores',
      gyroscope: 'Giroscópio',
      stereo: 'Stereo view',
      stereo_notification: 'Click anywhere to exit stereo view.',
      please_rotate: ['Por favor vire seu dispositivo', '(ou toque para continuar)'],
      two_fingers: ['Use dois dedos para navegar']
    }
  });

  viewer.on("position-updated", function () {
    var lat = viewer.getPosition()["latitude"].toFixed(4)
    var lon = viewer.getPosition()["longitude"].toFixed(4)
    $('.latitude').html(lat);
    $('.longitude').html(lon);
  });

});