class Madmin::AdminController < ApplicationController
	before_action :authorize

	layout 'layouts/admin/admin'

	def check_login
		if session[:user_id] 
			if ( session[:user_name] && session[:user_name] == "admin" ) then
				redirect_to madmin_dashboards_path
			else
				redirect_to root_path
			end
		else
			redirect_to '/login'
		end
		
	end

	private

		def not_authenticated
			redirect_to '/login', alert: "Please login first"
		end
end
