dir = ENV['PWD']

port 3000
workers 3
threads 2, 6
environment 'production'
directory dir

bind "unix://#{File.expand_path('tmp/sockets/puma.sock', dir)}"
pidfile "#{File.expand_path('tmp/pids/puma.pid', dir)}"
state_path "#{File.expand_path('tmp/sockets/puma.state', dir)}"
activate_control_app 'tcp://0.0.0.0:9293', { no_token: true }

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

before_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)

  Rails.event.subscribe(EventRequestSubscriber.new) { |event| event[:name].start_with?('controller.') }
  Rails.event.subscribe(EventSqlSubscriber.new) { |event| ['active_record.sql'].include?(event[:name]) }
end

before_restart do
  puts "\n-----> On restart"
  puts "env: #{@options[:environment]}"
  puts "pidfile: #{@options[:pidfile]}"
  puts "binds: #{@options[:binds]}"
  puts "control_url: #{@options[:control_url]}"
end
