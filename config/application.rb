require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# если нужна эта штука раньше, чем внутри самого приложения (по-умолчанию)
# Dotenv::Railtie.load unless Rails.env.production?

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    config.time_zone = "St. Petersburg"
    config.i18n.default_locale = :ru
    config.i18n.fallbacks = true
    config.i18n.enforce_available_locales = false

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
