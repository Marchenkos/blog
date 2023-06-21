# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout 'auth'

    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    def set_flash_message(key, kind, options = {})
      return if %i[signed_in signed_out].include?(kind)

      super
    end
  end
end
