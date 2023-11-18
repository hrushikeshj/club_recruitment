require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ClubRecruitment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # _club_oauth_provider
    config.session_store :cookie_store, key: ENV.fetch("COOKIE_SESSION") { "_club_recruitment_session" }
    if File.file?('/.dockerenv') == true
      host_ip = `/sbin/ip route|awk '/default/ { print $3 }'`.strip
      config.web_console.whitelisted_ips = [ host_ip ]
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
