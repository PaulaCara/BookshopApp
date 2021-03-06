require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookshopApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile += %w( *.jpg *.gif *.css *.erb *.js)

    config.assets.paths << "#{Rails.root}/app/assets/images/login"
    config.assets.paths << "#{Rails.root}/app/assets/images/widgets"
    config.assets.paths << "#{Rails.root}/app/assets/images/products"
    config.assets.paths << "#{Rails.root}/app/assets/images/admin/nav"
    config.assets.paths << "#{Rails.root}/app/assets/images/admin/table"
    config.assets.paths << "#{Rails.root}/app/assets/images/admin/forms"
    config.assets.paths << "#{Rails.root}/app/assets/images/admin"
    config.assets.paths << "#{Rails.root}/app/assets/images"
    config.assets.paths << "#{Rails.root}/public/assets/image/filename"

    config.serve_static_assets = true
  end
end
