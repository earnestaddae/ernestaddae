class Users::SessionsController < Devise::SessionsController
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.



   private

    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_in_params
        respond_with_navigational(resource) { render :new }
      end
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end
end
