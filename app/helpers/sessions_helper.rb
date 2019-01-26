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

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
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
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
      end
    end
  end
end