# frozen_string_literal: true
subscriber = EventJsonSubscriber.new

Rails.event.debug_mode = true
Rails.event.raise_on_error = true
Rails.event.subscribe(subscriber) do |event|
  Rails.logger.debug "------------------------------------------#{event}--"
  event[:name].start_with?('controller.')
end
