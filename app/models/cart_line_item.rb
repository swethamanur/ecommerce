class CartLineItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :item
	
	validates_presence_of :user_id, :item_id, :quantity

	def save_or_update
		line_item = CartLineItem.find_by(user_id: self.user_id, item_id: self.item_id)
		if line_item.nil?
			self.save
		else
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
		end
	end
end
