class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @service = Service.find(params[:service_id])
    @reviews = @service.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to service_reviews_path(@review.service)
    else
      @service = Service.find(params[:id])
      render 'service/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:service_id, :score, :content)
  end
end
