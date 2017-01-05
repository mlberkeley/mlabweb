class AccountActivationsController < ApplicationController

  def edit
    member = Member.find_by(email: params[:email])
    if member && !member.activated? && member.authenticated?(:activation, params[:id])
      member.activate
      log_in member
      flash[:success] = "ACTIVATED"
      redirect_to member
    else
      flash[:danger] = "Invalid activation link"
      redirect_to login_url
    end
  end
end
