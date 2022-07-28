import Rails from "@rails/ujs"
Rails.start()

import "bootstrap/dist/js/bootstrap"

import "../styles/application.scss"
import "../styles/application.css"
import "../styles/specialists.scss"
import "../styles/order_lists.scss"
import "../styles/orders.scss"
import "../styles/services.scss"
import "../styles/specialists.scss"

import "./listener"

const images = require.context("../images", true)
