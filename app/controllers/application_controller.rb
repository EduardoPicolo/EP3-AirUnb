class ApplicationController < ActionController::Base
    protect_from_forgery

    %w(Customer Host).each do |k| 
    define_method "current_#{k.underscore}" do 
        current_account if current_account.is_a?(k.constantize)
    end 

    define_method "authenticate_#{k.underscore}!" do 
    |opts={}| send("current_#{k.underscore}") || not_authorized 
    end 
  end
# Overriding the Devise current_user method
#   alias_method :devise_current_user, :current_user
#   def current_user
#     # It will now return either a Tenant or a Customer, instead of the plain User.
#     super.rolable
#   end
end
