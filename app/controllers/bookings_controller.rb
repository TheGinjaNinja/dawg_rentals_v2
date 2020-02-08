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
    @dog = Dog.find(params[:dog_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = @dog = Dog.find(params[:dog_id])
    if @booking.save
      redirect_to dog_booking_path(@dog, @booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end


  private

  def make_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
   params.require(:booking).permit(:booked_until, :booked_from, :price, :status, :dog_id, :user_id)
  end
end


