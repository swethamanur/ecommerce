class Product < ActiveRecord::Base
	#id, name, description, price, stock, category_id, cod_available, created_at, updated_at

	validates_presence_of :name, :description, :price, :stock, :cod_available

	validates_numericality_of  :price, greater_than: 0
	validates_numericality_of :stock, greater_than_or_equal_to: 0
	validates_length_of :name, minimum: 5
	validates_length_of :description, within: 5..250
	validates_uniqueness_of :name


end
