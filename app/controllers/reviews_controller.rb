class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(valid_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

    def valid_params
      params.require(:review).permit(:content, :rating)
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

end
