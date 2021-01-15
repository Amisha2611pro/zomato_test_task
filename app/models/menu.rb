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
    CSV.foreach(file.path, headers: true) do |row|
      menu = Menu.find_by_name(row[1])
      if menu.present?
        menu.update_attributes(name: row[1], price: row[2], category_id: row[3])
        menu.save!
      else
        Menu.create(name: row[1], price: row[2], category_id: row[3])
      end
    end
  end

end
