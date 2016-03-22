class RegistrationsController < Devise::RegistrationsController
	private
	def sign_up_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation,:user_type)
	end
	def account_update_params
		params.require(:user).permit(:name,:email,:image,:password,:password_confirmation, :current_password)
	end

end