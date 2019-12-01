class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    devise_group :user, contains: [:customer, :host]

    rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
    
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :phone, :birthday])
    end
end
