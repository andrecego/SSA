import PhotoSphereViewer from "photo-sphere-viewer"
import galaxy from '../images/360/galaxy.jpg'

$(document).on('turbolinks:load', function () {

  // Only runs on specific pages
  var psvContainer = document.getElementById('viewer');
  if (psvContainer !== null) {

    var viewer; // Needed for 'position-updated' listener

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
        var lat = viewer.getPosition()["latitude"];
        var lon = viewer.getPosition()["longitude"];
        $('.latitude').html(radConvertor(lat));
        $('.longitude').html(hourConvertor(lon));
      });
    });
  } // If end

  const summon = async function () {
    $("#viewer").get(0).scrollIntoView(); // scroll to top of the element

    var i;
    var numberTimes = Math.floor(Math.random() * 3); // Random 1-3

    // Dibre
    for (i = 0; i <= numberTimes; i++) {
      await move(1500);
    }

    // Summon
    await $.ajax({
      type: 'GET',
      dataType: 'json',
      url: '/api/v1/summon/random',
      success: getCharacter
    });

  };

  const move = async function (speed, latitude, longitude) {
    // optional params
    latitude = latitude || Math.random() * 1.57;
    longitude = longitude || Math.random() * 6.28;

    await viewer.animate({
      latitude: latitude,
      longitude: longitude,
      easing: 'cubic-bezier(0.22, 1, 0.36, 1)'
    }, speed);
  }

  function getCharacter(character) {
    move(1500, character["constellation"]["latitude"], character["constellation"]["longitude"])
      .then(function () {
        modal.style.display = "block";
        $('#character .char-modal').html('<img src=' + character.image + ' style="width:300px"></img>' +
          '<p><a class="modal-link" href="/characters/' + character.id + '">' + character.name + '</a></p>')
      });
  }



  var modal = document.getElementById("character");
  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
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
