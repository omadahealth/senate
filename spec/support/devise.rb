RSpec.configure do |config|

  # Controller specs

  config.include Devise::TestHelpers, type: :controller

  config.before(type: :controller) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  # Feature specs

  config.include Warden::Test::Helpers, type: :feature

  config.before(type: :feature) do
    Warden.test_mode!
  end

  config.after(type: :feature) do
    Warden.test_reset!
  end
end


