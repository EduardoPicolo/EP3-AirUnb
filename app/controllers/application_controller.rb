class ApplicationController < ActionController::Base
    protect_from_forgery

    devise_group :user, contains: [:customer, :host]
end
