class DashboardController < ApplicationController
  before_action :authenticate_member!
  before_action :exec_member, only: [:options]

  def home
    @member = current_member
  end

  def options
  end
end
