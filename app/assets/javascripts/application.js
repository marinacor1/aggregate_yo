// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */


$(document).ready(function(){
  myFunction();
});

function myFunction() {
  $('.dropbtn').keyup(function(event){
    var searchWords = $(this).val().toLowerCase();
    loadSelectWords(searchWords);
  });
}

function loadSelectWords(searchWords){
  var $currentLocations = $('#myDropdown').children();
  var notRightLocation = $currentLocations.each(function(index, city){
  var locationName = city.innerText.toLowerCase();
  if (locationName.includes(searchWords)){
      $(city).removeClass('invisible');
      dropSearch(locationName);
    }
    else{
      $(city).addClass('invisible');
    }
  });
}

// Close the dropdown menu if the user clicks outside of it
function dropSearch (locationName) {
    var $dropdowns = $('#myDropdown').children();
    var i;
    for (i = 0; i < $dropdowns.length; i++) {
      var openDropdown = $dropdowns[i];
      var city = openDropdown.innerText.toLowerCase();
      if (city.includes(locationName)){
        document.getElementById('myDropdown').classList.toggle('show');
        openDropdown.classList.contains('show');
      }
    }
};
