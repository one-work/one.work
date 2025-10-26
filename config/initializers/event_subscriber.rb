# frozen_string_literal: true
subscriber = EventJsonSubscriber.new
Rails.event.subscribe(subscriber) do |event|
  event[:name].start_with?('controller.')
end
