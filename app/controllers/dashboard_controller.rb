class DashboardController < ApplicationController
  before_action :authenticate_member!

  def home
    @member = current_member
  end

  def options
  end
end
