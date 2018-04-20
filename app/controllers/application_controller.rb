class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  Bundler.require(*Rails.groups)

Dotenv::Railtie.load

HOSTNAME = ENV['HOSTNAME']
end
