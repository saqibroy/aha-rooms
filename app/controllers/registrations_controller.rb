class RegistrationsController < Devise::RegistrationsController
	 prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
	
	def create
    super do |resource|
      verify_recaptcha(model: resource, message: 'reCAPTCHA verification response is incorrect, please try again.')
    end
  end




	private
	def sign_up_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation,:user_type,:coupon)
	end
	def account_update_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation, :current_password,:coupon)
	end
	def check_captcha
      if verify_recaptcha
        true
      else
        self.resource = resource_class.new sign_up_params
        respond_with_navigational(resource) { render :new }
      end 
    end




	protected

  def sign_up(resource_name, resource)
    true
  end

end