class DashboardController < ApplicationController
  def index
  	redirect_to root_path unless current_user
  end
  
  def new
  end

  def create
  end
end
