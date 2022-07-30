import Rails from "@rails/ujs"

import "bootstrap/dist/js/bootstrap"

import "./listener"

import "bootstrap"

import "../styles/app.scss"

Rails.start()

const images = require.context("../images", true)
