class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def after_sign_up_path_for(resource_or_scope)
    new_user_session
  end
  
  protect_from_forgery with: :exception
end
