class Pages::ElementsController < ApplicationController
    layout "layouts/pages"
    
    def index
        @current_page = 'elements'
        render 'pages/elements'
    end
end