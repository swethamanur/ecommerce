class ProductsController < ApplicationController
	#is used to list resources
	def index
		#@products = Product.order('name')
		@products = Product.all
	end

	# is used to instantiate an object and setup a form
	def new
	 	@product = Product.new
	 end	
end
