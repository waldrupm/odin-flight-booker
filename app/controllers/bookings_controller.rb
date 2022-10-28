class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    params[:num_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    # create the new booking and the associated passengers
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new', notice: 'Booking failed', status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[name email])
  end
  
end