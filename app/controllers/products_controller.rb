class ProductsController < ApplicationController
	def index
		@products = Product.includes(:user).all
		respond_to do |format|
			format.html #Show Default View
			format.json {render :json => @products}
		end
	end
	def create
		@product = Product.new(params[:product])

		respond_to do |format|
			if @product.save
				format.html { render :action => "create"}
				format.json { render :json => @product}
			else
				format.html {render :action => "new"}
				format.json {render :json => @product.error}
			end
		end
	end
	def new
		@product = Product.new
	end
end
