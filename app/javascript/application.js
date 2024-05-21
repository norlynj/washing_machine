// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require Chart.min
//= require jquery
//= require popper
//= require bootstrap

$(document).on('shown.bs.modal', '.modal', function () {
  $('.modal-backdrop').before($(this));
});