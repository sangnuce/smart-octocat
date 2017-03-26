import ReactDOM from "react-dom";
import router from "./router";

import injectTapEventPlugin from "react-tap-event-plugin";
injectTapEventPlugin();

import App from "./app";
import Room from "./Room";
global.API = require("./CallAPI");



$(document).on("ready page:load", function() {
  ReactDOM.render(router, document.getElementById("react-wrapper"));
});
