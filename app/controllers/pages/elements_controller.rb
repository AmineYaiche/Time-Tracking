class Pages::ElementsController < ApplicationController
  layout "layouts/pages"
  before_action :require_login
  
  def index
    @current_page = 'elements'
    render 'pages/elements'
  end
end