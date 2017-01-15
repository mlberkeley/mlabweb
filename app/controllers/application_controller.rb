class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def get_mlab_graph
    oauth = Koala::Facebook::OAuth.new(Rails.application.secrets.fb_app_id, Rails.application.secrets.fb_app_secret)
    graph = Koala::Facebook::API.new(Rails.application.secrets.fb_user_access_token)
    token = graph.get_object("me/accounts")[1]['access_token']
    return Koala::Facebook::API.new(token)
  end

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

    def officer_member
      unless officer_or_higher?
        flash[:danger] = "Action restricted to OFFICER members"
        redirect_to request.referrer || about_path
      end
    end

    def exec_member
      unless admin_or_exec?
        flash[:danger] = "Action restricted to EXEC members"
        redirect_to request.referrer || about_path
      end
    end

    def admin_member
      unless current_member.admin?
        flash[:danger] = "You do not have permission to perform this action"
        redirect_to request.referrer || about_path
      end
    end
end
