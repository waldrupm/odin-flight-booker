class FlightsController < ApplicationController
  def index
    if [params[:from_airport_id], params[:to_airport_id], params[:date]].any? 
      # build a query where all three params are optional
      query = Flight.where(nil)
      query = query.where(departure_airport_id: params[:from_airport_id]) if params[:from_airport_id].present?
      query = query.where(arrival_airport_id: params[:to_airport_id]) if params[:to_airport_id].present?
      query = query.where("DATE(departure_datetime) = ?", params[:date]) if params[:date].present?
      @flights = query
   else
    @flights = Flight.all
   end
  end
end