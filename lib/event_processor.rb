# frozen_string_literal: true

require_relative "event_processor/version"

module EventProcessor
  class Error < StandardError; end
  
  # this is the outbound event processor to send events to a global event bus. it takes an event_payload and sends it to the event bus
  class OutboundEventProcessor
    def initialize(event_payload)
      @event_payload = event_payload
      process
    end

    def process
      # send event to global event bus
      puts "sending event to global event bus"
      # publish event to Vue.js global event bus running locally
      `node ./lib/event_processor/publish_event.js #{@event_payload}`
    end
  end

  # this is the inbound processor that listens for events from the global event bus. it takes an event_payload and sends it to the rails app
  class InboundEventProcessor
    def initialize(event_payload)
      @event_payload = event_payload
      process
    end

    def process
      # send event to rails app
      puts "sending event to rails"
      # send event to REST API
      # TODO: update this to hit local-dev, stageing, or production based on ENV
      `curl -X POST -H "Content-Type: application/json" -d '{"event": "#{@event_payload}"}' http://localhost:3000/api/v1/inbound_events`
    end
  end
end
