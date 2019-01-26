class UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.where(user_type: 'regular').paginate(page: params[:page])
  end

  def show
    @user =  User.find_by(id: params[:id])
    @data = []
    @user.time_track.each do |t|
      @data << [t.page, t.time]
    end
  end
end