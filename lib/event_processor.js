// gets event_detail and publishes event to the global Vue.js event bus running locally

import Vue from 'vue'

export default {
    publishEvent: function (event_detail) {
        Vue.bus.emit('event', event_detail)
    }
}