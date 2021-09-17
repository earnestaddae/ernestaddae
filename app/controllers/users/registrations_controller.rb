class Users::RegistrationsController < Devise::RegistrationsController
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  # before_action :select_user_type, only: [:new]
  # include DeviseAccessible
  # skip_before_action :check_user, except: [:new, :create]

  # def create
  #   super
  #   # super do |resource|
  #   #   if params[:user_type]
  #   #     resource.user_type_id = params[:user_type]
  #   #     if resource.user_type_id == 2
  #   #       resource.save
  #   #     elsif resource.user_type_id == 1
  #   #       resource.save
  #   #     end
  #   #   end
  #   # end
  # end



  private
    # uses reCAPTCHA
   def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new sign_up_params
        resource.validate # Look for any other validation errors besides reCAPTCHA
        set_minimum_password_length
        respond_with_navigational(resource) { render :new }
      end
    end

    def after_sign_up_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end

  #   def select_user_type
  #     unless params[:user_type] && (params[:user_type] == "1" || params[:user_type] == "2")
  #       flash[:alert] = "The user type you selected doesn't exist"
  #       redirect_to root_url
  #     end
  #   end

   # def after_sign_in_path_for(resource)
   #  return accounts_path
   #  # return new_user_customer_profile_path(current_user)
   #    # signed_in_root_path(resource)
   #  end



    # def after_update_path_for(resource)
    #   signed_in_root_path(resource)
    # end
end
