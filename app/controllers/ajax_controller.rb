class AjaxController < ApplicationController
  def find_by_categories
  	if params[:category_ids] != ""
  		@items = Item.where(category_id: params[:category_ids].split(","))
  	else
  		@items = Item.all
  	end
  	render json: @items		
  end

  def autocomplete
  	if params[:search] != ""
      @items = Item.where('name LIKE ?', "%#{params[:search]}%")
    else
      @items = Item.all
    end
    render json: @items
  end

  def cod_available
  	@items = params[:cod] ? Item.where('cod_available = ?', true ) : Item.where('cod_available = ?', false)
    render json: @items
  end	

  def by_price
  	binding.pry
  	if params[:price_range] != ""
  		@items = Item.where(price: params[:price_range])
  	else
  		@items = Item.all
  	end
  	render json: @items	
  end
end
