# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([{ code: "SFO", city: "San Francisco, CA" }, { code: "NYC", city: "New York, NY" }, { code: "LAX", city: "Los Angeles, CA" }, { code: "ATL", city: "Atlanta, GA" }, { code: "ORD", city: "Chicago, IL" }, { code: "DFW", city: "Dallas, TX" }, { code: "DEN", city: "Denver, CO" }, { code: "SEA", city: "Seattle, WA" }, { code: "MIA", city: "Miami, FL" }, { code: "BOS", city: "Boston, MA" }])

# Create 100 flights with random departure and arrival airports with departure times after today

100.times do
  departure_airport = airports.sample
  arrival_airport = airports.sample
  while departure_airport == arrival_airport
    arrival_airport = airports.sample
  end
  Flight.create(departure_airport: departure_airport, arrival_airport: arrival_airport, duration: rand(1..5) * 60, departure_time: rand(1..60).days.from_now)
end