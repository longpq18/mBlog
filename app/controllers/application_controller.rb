class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  	def current_user
  		User.where(:id => session[:user_id]).first
  	end

  	def authorize
	  	if session[:user_name] 
	  		if session[:user_name] == 'admin'
	    		redirect_to login_url, alert: "Not authorized" if current_user.nil?	 
	    	else 
		    	redirect_to root_path
		    end		
	  	else
	    	redirect_to '/login'
	    end

	end
end
