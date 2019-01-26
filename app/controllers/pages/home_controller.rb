class Pages::HomeController < ApplicationController
  layout "layouts/pages"
  before_action :require_login
  
  def index
    @current_page = 'home'
    render 'pages/home', :locals => {:aaa => "YESS"}
  end
end