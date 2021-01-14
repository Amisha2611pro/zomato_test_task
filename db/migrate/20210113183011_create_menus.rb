class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
    	t.integer :category_id
      t.string :name
      t.float :price
      t.timestamps
    end
  end
end
