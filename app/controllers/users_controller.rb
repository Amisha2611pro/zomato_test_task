class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

	def update
		@user = User.find_by_id(params[:id])
	 	if @user.update(user_params.merge(gender: params[:gender].downcase))
	 		redirect_to welcome_index_path
	 	else
	 		render 'edit'
	  end
	end

	private
	  def user_params
	    params.require(:user).permit(:first_name, :last_name, :phone_number, :address)
	  end
end


