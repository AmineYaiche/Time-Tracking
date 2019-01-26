class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        log_in user
        if params[:session][:remember_me] == '1'
          remember user
        else
          forget user
        end
        redirect_user user
      else
        flash.now[:danger] = 'Invalid username/password'
        render 'new'
      end
    end
  
    def destroy
      log_out if current_user
      redirect_to root_url
    end
  end
  