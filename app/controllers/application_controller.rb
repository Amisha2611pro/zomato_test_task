class ApplicationController < ActionController::Base
	require 'csv'
	protect_from_forgery with: :exception
	respond_to :html, :json

  def after_sign_in_path_for(resource)
  	if params[:controller] == "users/sessions"
  		user_path(resource)
    elsif 
      edit_user_path(resource)
    end  	
  end

end
