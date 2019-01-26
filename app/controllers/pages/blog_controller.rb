class Pages::BlogController < ApplicationController
	layout "layouts/pages"
	before_action :require_login
	
	def index
		@current_page = 'blog'
		render 'pages/blog'
	end

end