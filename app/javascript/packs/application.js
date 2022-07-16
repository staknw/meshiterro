// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


// Bootstrapの導入方法 ここから 4
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
// ここまで

// FontAwesomeの導入  1
import '@fortawesome/fontawesome-free/js/all'
// ここまで

Rails.start()
Turbolinks.start()
ActiveStorage.start()
