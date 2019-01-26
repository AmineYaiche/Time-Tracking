class Pages::ContactController < ApplicationController
  layout "layouts/pages"
  before_action :require_login
  
  def index
    @current_page = 'contact'
    render 'pages/contact'
  end
end