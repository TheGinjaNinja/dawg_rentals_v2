class DogsController < ApplicationController
  # The index logic is for the search form
  def index
    @dogs = Dog.all.reverse

    @dogs_w_loc = Dog.geocoded
    @markers = @dogs_w_loc.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    @dog.save
    redirect_to dog_path(@dog)
  end

  def new
    @dog = Dog.new
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog)
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :bio, :location, :photo)
  end
end
