import Rails from "@rails/ujs"
Rails.start()

import "bootstrap/dist/js/bootstrap"

import "./listener"

const images = require.context("../images", true)
