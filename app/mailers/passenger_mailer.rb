class PassengerMailer < ApplicationMailer
  def passenger_booked_email
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail(to: @passenger.email, subject: 'You have booked a flight')
  end
end
