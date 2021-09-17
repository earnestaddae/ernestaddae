// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "popper.js"
import "bootstrap"

Rails.start()
Turbolinks.start()
document.addEventListener("DOMContentLoaded", () => {
  // The default of 500ms is too long and
  // users can lose the causal link between clicking
  // a link and seeing the browser respond
  Turbolinks.setProgressBarDelay(100)
})
ActiveStorage.start()
