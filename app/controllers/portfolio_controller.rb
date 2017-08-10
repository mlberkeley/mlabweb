class PortfolioController < ApplicationController
  def home
    @projects = Project.all
  end
end
