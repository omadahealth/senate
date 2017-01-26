require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

Apohypaton.configure do |config|
  config.app_name  = 'senate'
  config.token     = ENV['APOHYPATON_CONSUL_TOKEN'] || ENV['SENATE_CONSUL_TOKEN']
  config.enabled   = !Rails.env.development? && !Rails.env.test?
end

Diplomat.configuration.url = "http://localhost:8500"

module Senate
  class Application < Rails::Application
    config.autoload_paths += %W[
      #{config.root}/lib
    ]
    end
end
