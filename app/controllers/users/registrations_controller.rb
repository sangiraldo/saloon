class Users::RegistrationsController < Devise::RegistrationsController

  # Callbacks

  before_action :configure_account_update_params

  # Methods

  def create
    super
  end

  protected

    def after_update_path_for(resource)
      stored_location_for(:user) || edit_user_registration_path
    end

    def update_resource(resource, configure_account_update_params)
      if(!configure_account_update_params[:password].blank?)
        resource.password = configure_account_update_params[:password]
        resource.password_confirmation = configure_account_update_params[:password_confirmation]
        resource.update(configure_account_update_params)
      else
        resource.update_without_password(configure_account_update_params)
      end
    end

    private

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update,
                                        keys: [:id, :full_name, :email,
                                               :cellphone, :address, :gender])
    end
end
