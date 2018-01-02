class Item < ActiveRecord::Base

	before_create :generate_code
	after_create :net_price_update
	#id, name, description, price, stock, category_id, cod_available, created_at, updated_at
	has_many :reviews
	has_many :taxes
	has_many :cart_line_items
	belongs_to :category
	has_many :order_line_items
	belongs_to :sub_category

	validates_presence_of :name, :description, :price, :net_price, :stock 

	validates_numericality_of  :price, greater_than: 0
	validates_numericality_of :stock, greater_than_or_equal_to: 0
	validates_length_of :name, minimum: 5
	validates_length_of :description, within: 5..250
	validates_uniqueness_of :name

	#provided for custom validations
	validate :check_release_datetime
	validate :check_cod_availability

	private

	# def net_price_update
	# 	if !self.price.nil? && !self.tax.percent.nil?
	# 		self.net_price = self.price + (self.price * self.tax.percent /100)
	# 	end	
	# end

	def check_release_datetime
		if self.release_datetime > Date.today + 3.months
			self.errors.add(:release_datetime, "Cannot be greater than 3 months")
		end	
	end 

	def check_cod_availability
		if !self.price.nil? && self.price > 25000 && self.cod_available
			self.errors.add(:cod_available, "COD not available if price is greater than 25000 INR")
		end
	end

	def generate_code
		self.code = "DCT-#{SecureRandom.hex[0...4]}"
	end
end
