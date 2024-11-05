class HomesController < ApplicationController
  protect_from_forgery
  
  def top
  end
  
  def about
  end
  
  def create
  end
  
  def destroy
    log_out
    flash.now[:notice] = "Signed out successfully."
    redirect_to root_url
  end
  
end