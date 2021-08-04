require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wellbe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    #
    locale_path = Rails.root.join('config', 'locales')
    config.i18n.load_path += locale_path.glob('*.{rb,yml}').map(&:to_s)
    %w[defaults components models views inputs etl].map do |folder|
      config.i18n.load_path += Dir[locale_path.join(
          folder, '**', '*.{rb,yml}'
      )]
    end

    # Permitted locales available for the application
    I18n.available_locales = [:en]

    # Set default locale to something other than :en
    I18n.default_locale = :en
  end
end
