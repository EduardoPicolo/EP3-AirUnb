# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create 

    rolable_type = params[:user][:user_type]
    rolable_type_params = params[:user][rolable_type]

    params[:user].delete(:user_type)
    params[:user].delete(rolable_type)

    build_resource(sign_up_params)

    child_class = rolable_type.camelize.constantize
    child_class.new(params[child_class.to_s.underscore.to_sym])
    resource.rolable = child_class.new(rolable_type_params)

    # first check if child intance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once
    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    # customized code end
    if valid && resource.save    # customized code
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

protected

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      resource.meta? ? another_path : root_path
    else
      super
    end
  end
#  def create
#     # user_type = params[:user][:user_type]
#     # params[:user].delete(:user_type)
#     build_resource(sign_up_params)

#     # customized code begin

#     # crate a new child instance depending on the given user type
#     child_class = params[:user][:user_type].camelize.constantize
#     resource.rolable = child_class.new(params[child_class.to_s.underscore.to_sym])

#     # first check if child instance is valid
#     # cause if so and the parent instance is valid as well
#     # it's all being saved at once
#     valid = resource.valid?
#     valid = resource.rolable.valid? && valid

#     # customized code end

#     if valid && resource.save    # customized code
#       if resource.active_for_authentication?
#         set_flash_message :notice, :signed_up if is_navigational_format?
#         sign_in(resource_name, resource)
#         respond_with resource, location: after_sign_up_path_for(resource)
#       else
#         set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
#         expire_session_data_after_sign_in!
#         respond_with resource, :location => after_inactive_sign_up_path_for(resource)
#       end
#     else
#       clean_up_passwords(resource)
#       respond_with_navigational(resource) { render :new }
#       # respond_with resource
#     end
#   end
end
