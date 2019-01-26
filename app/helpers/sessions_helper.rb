module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def redirect_user(user)
    if user.admin?
      redirect_to users_path
    else
      redirect_to pages_path
    end
  end

  def log_out
    session.delete(:user_id)
  end

  def require_login
		if current_user.nil?
			redirect_to login_path
		end
  end
  
  def require_admin
    if (user = current_user) && user.admin?
      return true
    else
      redirect_to root_path
    end
  end

  def current_user
    if (user_id = user_id = session[:user_id])
      return User.find_by(id: user_id)
    end
  end
end