class Pages::PriceController < ApplicationController
    layout "layouts/pages"
    
    def index
        @current_page = 'price'
        render 'pages/price'
    end
end