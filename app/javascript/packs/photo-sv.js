import PhotoSphereViewer from "photo-sphere-viewer"
import galaxy from '../images/360/galaxy.jpg'



$(document).on('turbolinks:load', function () {
  // Only runs on specific pages
  var psvContainer = document.getElementById('viewer');
  if (psvContainer !== null) {

    var viewer;

    $.getJSON('/api/v1/summon/markers', function (constellations) {

      viewer = new PhotoSphereViewer({
        container: psvContainer,
        panorama: galaxy,
        navbar: [
          'markers',
          {
            id: 'summon',
            title: 'Summon',
            className: 'summon',
            onClick: summon
          },
        ],
        sphere_correction: { pan: 0, tilt: 0, roll: '30deg' },
        time_anim: false,
        min_fov: 89.99,
        mousewheel: false,
        markers: constellations,
        lang: {
          autorotate: 'Rotação Automática',
          zoom: 'Zoom',
          zoomOut: 'Menos zoom',
          zoomIn: 'Mais zoom',
          download: 'Download',
          fullscreen: 'Tela Cheia',
          markers: 'Marcadores',
          gyroscope: 'Giroscópio',
          stereo: 'Stereo view',
          stereo_notification: 'Click anywhere to exit stereo view.',
          please_rotate: ['Por favor vire seu dispositivo', '(ou toque para continuar)'],
          two_fingers: ['Use dois dedos para navegar']
        }
      })
    }).done(function () {
      viewer.on("position-updated", function () {
        var lat = viewer.getPosition()["latitude"].toFixed(4)
        var lon = viewer.getPosition()["longitude"];
        $('.latitude').html(radConvertor(lat));
        $('.longitude').html(hourConvertor(lon));
      });

    });


  }

  function summon() {
    $("#viewer").get(0).scrollIntoView(); // scroll to top of the element

    locate(500)
    setTimeout(function () {
      console.log('passo');
      viewer.animate({
        longitude: Math.random() * 6.28,
        latitude: Math.random() * 1.57
      }, 500);
    }, 501);






    setTimeout(function () {
      var rand = constellations[Math.floor(Math.random() * constellations.length)]
      viewer.animate({
        longitude: rand["longitude"],
        latitude: rand["latitude"]
      }, 900);
      console.log('passo');
    }, 1001);

  };

  function locate(speed) {
    console.log('passo');
    viewer.animate({
      longitude: Math.random() * 6.28,
      latitude: Math.random() * 1.57
    }, speed);
  }

  function hourConvertor(radians) {
    var remainder = radians * 12 / Math.PI;

    var hours = ~~(remainder);
    remainder -= hours;

    remainder *= 15;
    var minutes = ~~(remainder);
    remainder -= minutes;

    var seconds = ~~(remainder * 60).toFixed(2);

    return hours + 'h' + minutes + 'm' + seconds + 's'
  }

  function radConvertor(radians) {
    var remainder = radians * 180 / Math.PI;

    var hours = ~~(remainder);
    remainder -= hours;

    remainder = Math.abs(remainder);
    remainder *= 60;
    var minutes = ~~(remainder);
    remainder -= minutes;

    var seconds = ~~(remainder * 60).toFixed(2);

    return hours + 'º' + minutes + '\'' + seconds + '\'\''
  }
});

