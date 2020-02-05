class DogsController < ApplicationController
  # The index logic is for the search form
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def create
    @dog = Dog.new(params[:dog])
    @dog.save
  end

  def new
    @dog = Dog.new
  end

  def update
    @dog = Dog.find(params[dog_params])
    @dog.update(params[:dog])
  end

  def edit
    @dog = Dog.find(params[dog_params])
  end

  private

  def dog_params
    params.require(:dog).permit(:id, :name, :breed, :bio)
  end
end
