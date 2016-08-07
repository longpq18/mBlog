class UserMailer < ApplicationMailer

    default from: "longpq18@gmail.com"

	# def password_reset(user)
	#     @user = user
	#     mail :to => user.email, :subject => "Password Reset"
	# end

	def password_reset(user)
	 	@user = user
	  	# @url  = edit_password_reset_url(@user.password_reset_token)
	  	mail :to => @user.email, :subject => "Your password has been reset"
	end

	def active_accout(user)
	    @user = user
	    mail 	to: @user.email , 
	    		subject: 'Welcome to My WebSite'
  	end
end
