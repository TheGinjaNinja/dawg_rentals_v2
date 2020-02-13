class BookingsController < ApplicationController
  before_action :make_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user: current_user)
    # if admin show all bookings
    # if user show personal bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @dog = @booking.dog
  end

  def new
    @dog = Dog.find(params["dog_id"])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @dog = Dog.find(params[:dog_id])
    @booking.dog = Dog.find(params[:dog_id])
    if @booking.save
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dog = @booking.dog

    if @booking.update(booking_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @dog = @booking.dog

    if @booking.user == current_user
      @booking.destroy
      redirect_to dog_path(@dog), notice: "Booking deleted"
    else
      redirect_to dog_path(@dog), notice: "You cannot delete this booking"
    end
  end

  private

  def make_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:booked_until, :booked_from, :price, :status, :dog_id, :user_id)
  end
end
