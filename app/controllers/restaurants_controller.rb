class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all 
	end	

	def new
		@restaurant = Restaurant.new
	end	

	def create
		@restaurant = Restaurant.new(params[:restaurant].permit(:name))
		
		if @restaurant.save
			redirect_to '/restaurants'
		else
			render 'new'
		end		
	end	

	def edit
		@restaurant = Restaurant.find(params[:id])
	end	

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update(params[:restaurant].permit(:name))
		redirect_to '/restaurants'
	end	

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy

		flash[:notice] = 'Restaurant deleted successfully'
		redirect_to '/restaurants'
	end	
end
