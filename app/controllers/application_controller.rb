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
      redirect_to(root_url) unless (current_member.exec? or current_member.admin?)
    end

    def admin_member
      redirect_to(root_url) unless current_member.admin?
    end
end
