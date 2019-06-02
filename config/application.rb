# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

ENV['RANSACK_FORM_BUILDER'] = '::SimpleForm::FormBuilder'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Estofado
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'America/Fortaleza'
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.enforce_available_locales = false
    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]
    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = ['pt-BR']

    config.action_controller.include_all_helpers = true

    config.action_mailer.default_url_options = if Rails.env.development?
                                                 { host: 'http://127.0.0.1', port: 3000 }
                                               else
                                                 { host: 'https://nacionalservicos.com.br' }
                                               end
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_deliveries = true
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address: "smtp.nacionalservicos.com.br",
      port: 587,
      domain: 'nacionalservicos.com.br',
      user_name: 'sistema@nacionalservicos.com.br',
      password: '3rf454y65her',
      authentication: 'plain',
      enable_starttls_auto: true
    }

    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns/**"]

    config.generators do |g|
      g.test_framework :rspec,
                       routing_specs: false,
                       view_specs: true,
                       helper_specs: false,
                       controller_specs: false
    end
  end
end
