class FlightsController < ApplicationController
  def index
    # TODO: pass search params into the view so they can be prepopulated in the search form rather than query in a view
    if [params[:from_airport_id], params[:to_airport_id], params[:date]].any? 
      # build a query where all three params are optional
      query = Flight.where(nil)
      query = query.where(departure_airport_id: params[:from_airport_id]) if params[:from_airport_id].present?
      query = query.where(arrival_airport_id: params[:to_airport_id]) if params[:to_airport_id].present?
      query = query.where("DATE(departure_time) = ?", params[:date]) if params[:date].present?
      @flights = query.includes(:departure_airport, :arrival_airport)
   else
    @flights = Flight.all.includes(:departure_airport, :arrival_airport)
   end
  end
end