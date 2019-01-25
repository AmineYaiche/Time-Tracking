class Pages::BlogController < ApplicationController
    layout "layouts/pages"
    
    def index
        @current_page = 'blog'
        render 'pages/blog'
    end
end