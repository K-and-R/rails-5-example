require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Require some initializers that might be needed by other initializers
# ...in this specific order
%w(
  inflections
).each do |filename|
  require File.expand_path("../initializers/#{filename}.rb", __FILE__)
end

module ExampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.from_file 'settings.yml'
    config.encoding = 'utf-8'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    def name
      Rails.configuration.app.name
    end

    config.action_mailer.delivery_method = (Rails.configuration.email.delivery_method || 'test').to_sym
    config.action_mailer.default_options = {
      from: Rails.configuration.email.sender_address
    }

    host_options = { host: Rails.configuration.app.fqdn }
    config.action_mailer.default_url_options = host_options
    Rails.application.routes.default_url_options.merge!(host_options)
  end
end

# Require some initializers, which are dependant on the Rails.application, that might be needed by other initializers
# ...in this specific order
%w(
  errors
).each do |filename|
  require File.expand_path("../initializers/#{filename}.rb", __FILE__)
end
