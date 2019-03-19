env :PATH, ENV['PATH']
set :output, {:standard => 'log/cron_log.log', :error => 'log/cron_error_log.log'}

every 5.minutes do
    rake "db:update_prices"
end
