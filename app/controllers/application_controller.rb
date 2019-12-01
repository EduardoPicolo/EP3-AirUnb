class ApplicationController < ActionController::Base
    protect_from_forgery
    devise_group :user, contains: [:customer, :host]

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone, :birthday])
        # devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :birthday])
    end
end
