class BookingsController < ApplicationController
  before_action :make_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
    # if admin show all bookings
    # if user show personal bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @dog = params[:dog_id]
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user
    @booking.dog_id = params[:dog_id]
    if @booking.save
      redirect_to dog_booking_path(@dog)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to new_dog_booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to new_dog_booking_path
  end


  private

  def make_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
   params.require(:booking).permit(:booked_until, :booked_from, :price, :status, :dog_id, :user_id)
  end
end


