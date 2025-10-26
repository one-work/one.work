# frozen_string_literal: true


Rails.application.config.after_initialize do
  subscriber = EventJsonSubscriber.new
  subscriber.task.execute

  Rails.event.subscribe(subscriber) do |event|
    event[:name].start_with?('controller.')
  end
end
