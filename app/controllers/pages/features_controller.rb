class Pages::FeaturesController < ApplicationController
    layout "layouts/pages"
    
    def index
        @current_page = 'features'
        render 'pages/features'
    end
end