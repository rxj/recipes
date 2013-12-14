
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 
  helper_method :admin?    
  protected  
  def admin?
    session[:password] == "geheim"  
  end
 
  def authorize  
    unless admin?  
      flash[:notice] = "Zugriff auf die Administration erfordert Berechtigung!"
      redirect_to root_path  
      false  
    end  
  end
end
