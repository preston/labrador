class ApplicationController < ActionController::Base

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	
	def require_admin
		if(current_user && current_user.admin?)
			# Sweet.
		else
			flash[:error] = "Please log in as an administrator first."
			# redirect_to(new_user_session_path)
			render :file => "public/401.html", :status => :unauthorized
		end
	end

end
