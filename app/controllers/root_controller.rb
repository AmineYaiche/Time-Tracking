class RootController < ApplicationController

  def index
    if (user = current_user)
      if user.admin?
        redirect_to users_path
      else
        redirect_to pages_path
      end
    else
      redirect_to login_path
    end
  end
end