class DogsController < ApplicationController
  # The index logic is for the search form
  def index
    if params[:query].present?
      @dogs = Dog.geocoded.where(location: params[:query])
    else
      @dogs = Dog.all.reverse
    end

    @markers = @dogs.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        image_url: helpers.asset_url('paw.svg')
      }
    end
  end

  def show
    @dog = Dog.find(params[:id])
    @dog_bookings = @dog.bookings
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
    redirect_to dog_path(@dog), notice: "Dog profile updated"
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path, notice: "Dog profile deleted"
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :bio, :location, :photo, :user)
  end
end
