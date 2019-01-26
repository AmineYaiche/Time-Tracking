class Pages::FeaturesController < ApplicationController
  layout "layouts/pages"
  before_action :require_login
  
  def index
    @current_page = 'features'
    render 'pages/features'
  end
end