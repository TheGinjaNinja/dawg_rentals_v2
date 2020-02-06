class BookingsController < ApplicationController
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
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  private

  def booking_params
    params.require(:booking).permit(:price, :status, :dog_id, :user_id))
  end
end


