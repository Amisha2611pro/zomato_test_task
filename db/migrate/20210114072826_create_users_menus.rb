class CreateUsersMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :users_menus do |t|
    	t.belongs_to :user
      t.belongs_to :menu
    end
  end
end
