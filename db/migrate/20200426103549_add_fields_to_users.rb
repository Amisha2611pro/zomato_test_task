class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :username, :string
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :phone_number, :text
  	add_column :users, :age, :float
  	add_column :users, :gender, :string
  	add_column :users, :address, :string
  end
end
