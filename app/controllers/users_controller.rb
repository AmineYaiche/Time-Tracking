class UsersController < ApplicationController
  before_action :require_admin, except: [:new, :create]

  # Only for admin, this view display the list of the regular users
  def index
    @users = User.where(user_type: 'regular').paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  # Create a new regular user. Used in the signup view
  def create
    @user = User.new(user_params)
    @user.user_type = 'regular'
    if @user.save
      flash[:info] = "User account created successfully."
      redirect_to root_url
    else
      flash[:danger] = @user.save!
      render 'new'
    end
  end

  def show
    @user =  User.find_by(id: params[:id])
    @data = []
    @user.time_track.each do |t|
      @data << [t.page, t.time]
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end