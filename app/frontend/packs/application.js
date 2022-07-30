import Rails from "@rails/ujs"

import "bootstrap/dist/js/bootstrap"

import "./listener"

import "bootstrap"

import "../styles/app"

Rails.start()

const images = require.context("../images", true)
