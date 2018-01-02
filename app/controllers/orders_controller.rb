class OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@orders = current_user.orders
	end

	def create
		@order = Order.new
		@order.user_id = current_user.id
		if @order.save
			redirect_to orders_path, notice: "Your order has been successfully placed"
		end
	end

end
