REDIS_YML_PATH = Rails.root.join 'config', 'redis.yml'
SCHEDULE_FILE  = Rails.root.join 'config', 'schedule.yml'

sidekiq_config = { namespace: 'delete_me' }
sidekiq_config.merge! YAML.load_file(REDIS_YML_PATH)[Rails.env]

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end

if Rails.env.production? && File.exists?(SCHEDULE_FILE)
  Sidekiq::Cron::Job.destroy_all!
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(SCHEDULE_FILE)
end
