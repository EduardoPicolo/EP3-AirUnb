class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    devise_group :user, contains: [:customer, :host]
    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :phone, :birthday])
    end
end
