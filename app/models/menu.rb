class Menu < ApplicationRecord
	require 'csv'

	has_and_belongs_to_many :users
	belongs_to :category

	def self.to_csv
    attributes = %w{id name price category_id}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |menu|
      	# csv << menu.attributes.values_at(*attributes)
        csv << attributes.map{ |attr| menu.send(attr) }
      end
    end
  end

  def self.import(file)
    @menu_list = []
    CSV.foreach(file.path, headers: true) do |row|
      menu = Menu.where(id: row.to_hash['id'].to_i).first
      if menu.present?
        m = row.to_hash
        # menu.update_attributes(category_id: m['category_id'], name: m['name'], price: m['price'])
       
        menu.category_id = m['category_id']
        menu.name = m['name']
        menu.price = m['price']
        menu.save
        @menu_list <<  { menu: menu } 
      else
        Menu.create to_hash
      end 
    end
   
    return @menu_list
  end

end
