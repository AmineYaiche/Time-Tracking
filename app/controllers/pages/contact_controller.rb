class Pages::ContactController < ApplicationController
    layout "layouts/pages"
    
    def index
        @current_page = 'contact'
        render 'pages/contact'
    end
end