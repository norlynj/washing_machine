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

document.addEventListener('turbo:load', () => {
  setTimeout(() => {
    const alerts = document.querySelectorAll('.alert-dismissible');
    alerts.forEach(alert => {
      if (!alert.classList.contains('fade-out')) {
        alert.classList.add('fade-out');
        setTimeout(() => {
          alert.remove();
        }, 1000); // matches the CSS transition duration
      }
    });
  }, 5000); // 5 seconds delay
});
