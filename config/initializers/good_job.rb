# Rails.application.configure do
#   config.good_job.preserve_job_records = true
#   config.good_job.logger = ActiveSupport::Logger.new('log/good_job.log')
#   config.good_job.retry_on_unhandled_error = false
#   config.good_job.enable_cron = true
#   config.good_job.cron = {
#     a: {
#       cron: '5 0 * * *',
#       class: 'Factory::ProducePlanJob'
#     },
#     b: {
#       cron: '15 0 * * *',
#       class: 'Factory::ProducePlanPruneJob'
#     }
#   }
# end
