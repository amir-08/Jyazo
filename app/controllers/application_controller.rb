class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :name,:email,:password, :password_confirmation, :date_of_birth,:address,:is_female, roles: []) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(  :name,:email,:password, :password_confirmation, :date_of_birth,:address) }
end

rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied."
  redirect_to root_url
end

end
