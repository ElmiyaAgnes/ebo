class ApplicationController < ActionController::Base
 before_action :authenticate_user!
before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_permitted_parameters
      #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:user_name, :email, :password) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :middle_name, :last_name, :email, :login_id, :password, :password_confirmation,:employee_id, :date_of_birth, :gender, :time_zone, :designation_id, :date_of_joining, :education, :comments, :is_active, :deactivated_on, :reason, :work_phone) }
      #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :first_name, :middle_name, :last_name, :email, :password, :password_confirmation, :current_password) }
    end

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied!"
  redirect_to user_url(:id => current_user.id)
end

  # def after_sign_in_path_for(resource)
 	# user_path(resource)
  #  end
  #protected

 
end
