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


import React from 'react';
import ReactDOM from 'react-dom';
import Geosuggest from '../../src/Geosuggest';

var App = React.createClass({
  render: function(){
    var fixtures = [
      {label: 'New York', location: {lat: 40.7033127, lng: -73.979681}},
      {label: 'Rio', location: {lat: -22.066452, lng: -42.9232368}},
      {label: 'Tokyo', location: {lat: 35.673343, lng: 139.710388}}
    ];

    return (
      <div>
      <Geosuggest
      fixtures={fixtures}
      onFocus={this.onFocus}
      onBlur={this.onBlur}
      onChange={this.onChange}
      onSuggestSelect={this.onSuggestSelect}
      onSuggestNoResults={this.onSuggestNoResults}
      location={new google.maps.LatLng(53.558572, 9.9278215)}
      radius="20" />
      </div>
    );
  }

})

ReactDOM.render(<App />, document.getElementById('app'));


function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
};


var Geosuggest = require('react-geosuggest').default;
// <Geosuggest />
