class RegistrationsController < Devise::RegistrationsController
	
	def create
    super #Nothing special here.
  end




	private
	def sign_up_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation,:user_type,:coupon)
	end
	def account_update_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation, :current_password,:coupon)
	end




	protected

  def sign_up(resource_name, resource)
    true
  end

end