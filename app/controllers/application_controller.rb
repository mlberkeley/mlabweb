class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  include MembersHelper

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname])
    end

    def officer_member
      unless officer_or_higher?
        flash[:danger] = "Action restricted to OFFICER members"
        redirect_to request.referrer || current_member
      end
    end

    def exec_member
      unless exec_or_higher?
        flash[:danger] = "Action restricted to EXEC members"
        redirect_to request.referrer || current_member
      end
    end

    def admin_member
      unless current_member.admin?
        flash[:danger] = "You do not have permission to perform this action"
        redirect_to request.referrer || current_member
      end
    end
end
