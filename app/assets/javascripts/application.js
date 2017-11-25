//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require font-awesome
//= require select2
//= require jquery-validate
//= require materialize-sprockets
//= require Chart.bundle
//= require chartkick
//= require_tree

document.addEventListener("turbolinks:load", function() {
  Materialize.updateTextFields();

  $('.parallax').parallax();
  $('.button-collapse').sideNav();

  $(".flash_message").fadeOut(6000);

  $('.tooltipped').tooltip();

  $(".select2").select2({
    tokenSeparators: [','],
    placeholder: "Seleccione o escriba un servicio"
  });

 })
