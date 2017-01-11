class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Before filters

    # Confirm logged-in member
    def logged_in_member
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def exec_member
      unless (current_member.exec? or current_member.admin?)
        flash[:danger] = "Action restricted to EXEC members"
        redirect_to request.referrer
      end
    end

    def admin_member
      unless current_member.admin?
        flash[:danger] = "You do not have permission to perform this action"
        redirect_to about_path
      end
    end
end
