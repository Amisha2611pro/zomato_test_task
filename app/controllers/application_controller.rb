class ApplicationController < ActionController::Base
	require 'csv'
	protect_from_forgery with: :exception
	respond_to :html, :json

  def after_sign_in_path_for(resource)
    welcome_index_path
  	# if params[:controller] == "users/sessions"
  	# 	user_path(resource)
   #  elsif 
   #    welcome_index_path
   #    edit_user_path(resource)
   #  end  	
  end

end
