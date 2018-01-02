class ReviewsController < ApplicationController
	 before_action :authenticate_user!


	 
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		if @review.save
			respond_to do |format|
				format.html {redirect_to item_path(@review.item_id)}
				format.js #if it is a js format, it searches for a create.js.erb file 
			end	
		end	
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to item_path(params[:id])
	end

	def review_params
		params[:review].permit(:title, :description, :rating, :item_id)
	end
end
