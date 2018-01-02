class Category < ActiveRecord::Base
	validates_presence_of :name
	validates_length_of :name, minimum: 5
	validates_uniqueness_of :name

	has_many :items #fetches all the items associated with the category 
	has_many :sub_categories
end
