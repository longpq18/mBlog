class SessionsController < ApplicationController

	def create
	    user = User.authenticate(params[:uname], params[:pword])
	    if user
	      	session[:user_id] = user.id
	      	session[:user_name] = user.uname
	      	redirect_to (:back)
    	else
      		flash[:notice] = "User or password not correct"
      		redirect_to '/login'
   		end
  	end

  	def destroy
    	session.delete(:user_id)
    	session.delete(:user_name)
    	redirect_to root_path, alert: "User logged out"
  	end

 	private
	    def check_on_login
	      	if session[:user_name]
	        	redirect_to (:back)
	      	end
	    end

end
