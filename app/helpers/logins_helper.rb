module LoginsHelper
    
  # Logs in the given user.
  def log_in(cliente)
    session[:user_id] = cliente.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Cliente.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
   # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
