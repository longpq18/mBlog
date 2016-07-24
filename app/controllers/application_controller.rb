class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_filter :link_return

  private
  	def current_user
  		User.where(:id => session[:user_id]).first
  	end

  	helper_method :current_user

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

	def after_sign_in_path_for(resource)
	  	blacklist = [new_user_session_path, new_user_registration_path] # etc...
	  	last_url = session["user_return_to"]
	  	if blacklist.include?(last_url)
	    	root_path
	  	else
	    	last_url
	  	end
	end

	# def link_return
	#   	if params[:return_uri]
	#     	session[:original_uri] = params[:return_uri]
	#   	end
	# end
end
