class AddressesController < ApplicationController
	before_action :authenticate_user!

	def index
		@addresses = Address.all
	end

	def new
		@address = Address.new
	end
	
	def create
	 	@address = Address.new(address_params)
	 	@address.user_id = current_user.id
	 	if @address.save
	 		redirect_to addresses_path
	 	else
	 		render action: "new"
	 	end
	 end	

	 private

	 #strong parameters - used to prevent from mass assignment web attack
	 def address_params
	 	params[:address].permit(:details, :landmark, :city, :state, :pincode)
	 end


end


