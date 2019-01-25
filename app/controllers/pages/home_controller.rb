class Pages::HomeController < ApplicationController
    layout "layouts/pages"
    
    def index
        @current_page = 'home'
        render 'pages/home', :locals => {:aaa => "YESS"}
    end
end