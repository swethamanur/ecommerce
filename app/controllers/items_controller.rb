class ItemsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	before_action :check_is_admin, except: [:index, :show]

	def index
		@items = Item.all
		@posts = Item.paginate(:page => params[:page], :per_page => 30)
	end

	def new
	 	@item = Item.new
	 end

	 #used to validate the information coming in from the form, if the validations pass, it inserts the record to the database and redirect the user to another page, else display the error messages telling the user why the form failed. 

	 def create
	 	@item = Item.new(item_params)
	 	if @item.save
	 		redirect_to items_path
	 	else
	 		render action: "new"
	 	end
	 end

	 #is used to display a specific resource(data) along with the associated resources(data)
	 def show
	 	@item = Item.find(params[:id])
	 	@category = Category.find(@item.category_id)
	 	@review = Review.new
	 	@cart_line_item = CartLineItem.new
	 end

	 def edit
	 	@item = Item.find(params[:id])
	 end

	 def update
	 	@item = Item.find(params[:id])
	 	if @item.update_attributes(item_params)
	 		redirect_to item_path(@item.id)
	 	else
	 		render action: "edit"
	 	end
	 end

	 def destroy
	 	@item = Item.find(params[:id])
	 	@item.destroy
	 	redirect_to items_path		
	 end

	 private

	 #strong parameters - used to prevent from mass assignment web attack
	 def item_params
	 	params[:item].permit(:name,:price,:stock,:description,:category_id,:cod_available, :release_datetime, :image_url)
	 end
	 			
end
