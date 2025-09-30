set :environment, "production"
set :output, "log/cron.log"

every 1.day, at: '6:00 pm' do
  runner "EodProcessingJob.perform_later"
end
