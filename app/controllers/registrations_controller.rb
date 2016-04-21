class RegistrationsController < Devise::RegistrationsController
	 
	 after_action :sign_notice, only: [:create]
	def create
    if verify_recaptcha
        super
      else
        build_resource
        clean_up_passwords(resource)
        flash[:alert] = "There was an error with the recaptcha code below. Please re-enter the code and click submit."
        #render_with_scope :new    #dld one 
        render :new
      end
    
  end




	private
	def sign_up_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation,:user_type,:coupon)
	end
	def account_update_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation, :current_password,:coupon)
	end
	

    def sign_notice
    	flash[:notice]= "Successfully Signed Up."
    end




	protected

  def sign_up(resource_name, resource)
    true
  end

  def after_sign_up_path_for(resource)
    new_user_session_path # Or :prefix_to_your_route
  end

end