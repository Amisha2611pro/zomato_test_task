class MenusController < ApplicationController
	# before_action :authenticate_user!
 respond_to :html

  def index
  	@menus = Menu.all
    @updated_record_count = @menus.where('DATE(updated_at) BETWEEN ? AND ?', Date.today.beginning_of_day, Date.today.end_of_day).count
  	respond_to do |format|
      format.html
      format.csv { send_data @menus.to_csv, filename: "menus-#{Date.today}.csv" }
    end
  end

  def edit
    @menu = Menu.find_by_id(params[:id])
  end

	def update
		@menu = Menu.find_by_id(params[:id])
	 	if @menu.update(menu_params)
	 		redirect_to welcome_index_path
	 	else
	 		render 'edit'
	  end
	end

	def import
		@menus = Menu.import(params[:file])
		redirect_to menus_path
	end

	private
	  def menu_params
      params.require(:menu).permit(:category_id, :name, :price)
    end
end
