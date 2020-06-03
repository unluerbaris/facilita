// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import flatpickr from "flatpickr";

// Internal imports, e.g:
import { initEventCable } from '../channels/event_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initEventCable();
  flatpickr(".datepicker", { enableTime: true,
                             defaultDate: new Date(),
                             minDate: "today",
                             time_24hr: true });

  const gray = document.querySelectorAll(".graycolor");
    gray.forEach( e => {
    e.addEventListener("click", (event) => {
    event.currentTarget.classList.add("greencolor");
  })
  });

  const btn = document.querySelector('.btn-join');
  const login = document.querySelector('.login');
  btn.addEventListener('click', (event) => {
    const display = x => login.classList.remove('none');
  setTimeout(display, 500)
  });
});

