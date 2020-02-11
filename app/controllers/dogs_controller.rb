class DogsController < ApplicationController
  # The index logic is for the search form
  def index
    @dogs = Dog.all.reverse
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
    if @dog.user == current_user
     @dog = Dog.find(params[:id])
     @dog.update(dog_params)
     redirect_to dog_path(@dog), notice: "Dog profile updated"
    else
     redirect_to dog_path(@dog), notice: "You must be the owner to make changes"
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def destroy
    if @dog.user == current_user
     @dog = Dog.find(params[:id])
     @dog.destroy
     redirect_to dogs_path, notice: "Dog profile deleted"
    else
    redirect_to dogs_path, notice: "You must be the owner to make changes"
    end
  end


  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :bio, :location, :photo)
  end
end
