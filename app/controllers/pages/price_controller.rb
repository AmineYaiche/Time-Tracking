class Pages::PriceController < ApplicationController
  layout "layouts/pages"
  before_action :require_login
  
  def index
    @current_page = 'price'
    render 'pages/price'
  end
end