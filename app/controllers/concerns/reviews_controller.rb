class ReviewsController < ApplicationController
before_action :set_dog

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.dog = @dog
    if @review.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  private

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
