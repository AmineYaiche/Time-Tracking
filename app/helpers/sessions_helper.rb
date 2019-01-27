module SessionsHelper

  # Create a new session
  def log_in(user)
    session[:user_id] = user.id
  end

  # Redirect a user to it's home page depending on it's type
  def redirect_user(user)
    if user.admin?
      redirect_to users_path
    else
      redirect_to pages_path
    end
  end

  # Delete the session
  def log_out
    session.delete(:user_id)
  end

  # Used in the controller to protect views that require a logged in user
  def require_login
		if current_user.nil?
			redirect_to login_path
		end
  end
  
  # Used in the controller to protect views that require an admin in user
  def require_admin
    if (user = current_user) && user.admin?
      return true
    else
      puts user
      redirect_to root_path
    end
  end

  # Extract the current user from the session
  def current_user
    if (user_id = session[:user_id])
      return User.find_by(id: user_id)
    end
  end
end