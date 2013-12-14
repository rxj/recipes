
class SessionsController < ApplicationController  
  def new  
  end  
 
  def create  
    session[:password] = params[:password]  
    flash[:notice] = "Erfolgreich als Administrator angemeldet." if admin?
    redirect_to root_path  
  end  
 
  def destroy  
    reset_session  
    flash[:notice] = "Erfolgreich abgemeldet."
    redirect_to root_path  
  end  
end
