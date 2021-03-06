// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require swiper.min
//= require swiper
//= require custom-radio-min
//= require custom-radio
//= require owl.carousel.min
//= require jquery-confirm
//= require jquery-confirm.min
//= require data-confirm-modal
//= require jquery-ui
//= require jquery-ui/widgets/dialog
//= require cocoon
//= require activestorage
//= require turbolinks
//= require_tree .
var dataTable = null
document.addEventListener("turbolinks:before-cache", function() {
  if (dataTable !== null) {
   dataTable.destroy()
   dataTable = null

  }
})
