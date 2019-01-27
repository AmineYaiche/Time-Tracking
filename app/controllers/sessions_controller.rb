class SessionsController < ApplicationController
    def new
    end
  
    # Create a new session. Used when a new user log in
    def create
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_user user
      else
        flash.now[:danger] = 'Invalid username/password'
        render 'new'
      end
    end
  
    # Destroy a sesson. Used when a user log out
    def destroy
      log_out if current_user
      redirect_to root_url
    end
  end
  