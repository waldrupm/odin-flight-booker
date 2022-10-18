# README

## What is the goal of this project?

The project is completed inline with the [Odin Flight Booker](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker) project.

The goal of this project is to build a flight booking app using Ruby on Rails, specifically building up skills around the use of advanced forms and associations.
This will use join tables and nested forms, as well as the use of scopes, validations, and search functionality.

Some of the Rails features I believe I'll be using (I'm writing this before starting) are:
 - accepts_nested_attributes_for
 - has_many through
 - collection_select
 - A bit of Turbo or Stimulus to handle the dynamic form elements (maybe, time permitting)
 - TailwindCSS for styling
 - Turbo Streams to push updated flight times to the user (maybe, time permitting)
 - Search functionality for flights, maybe getting as far as a query builder (maybe, time permitting)

## Notes During Development:


## Basic Project Spec from Odin Project

### Setup
 1. Think through the data architecture required to bring this to life.
 2. Create a new Rails app, e.g. odin-flight-booker, and a new Git repo
 3. Modify the README to explain what you’re doing and link back to the project here.

### Screen 1: Search

For the first screen, you will be creating 4 dropdown menus that will allow users to search for available flights - departure airport, arrival airport, date, and number of passengers. This requires relatively vanilla forms that happen to be prepopulated with collections of data. Working with dates will cover a bit of new ground for you.

 1. Create an Airport model (which basically just needs an airport code like “SFO” or “NYC”) and use the db/seeds.rb file to create several airports.
 2. Create a Flight model (with the departure and arrival airport ids, start datetime and flight duration).
 3. Set up associations so you can ask Flight.first.departure_airport, Flight.first.arrival_airport and get back Airport objects. Same for Airport.first.departing_flights and Airport.first.arriving_flights, which should return a list of Flight objects.
 4. Seed your database with flights.
 5. You will search and view results in the same page. Set up your FlightsController and routes to make the Index page (/flights) the root route.
 6. Create your search form on the /flights index page to submit using a GET (not POST) request back to the same URL.
 7. Add the four dropdown menus – a list of departure airports, arrival airports, number of passengers (1-4), and a date dropdown for the flight date. The date dropdown should only include dates that have existing flights. Don’t worry about restricting the contents of the airport dropdowns – you’d normally use JavaScript – so just allow the user to select any airport. See this SO post on formatting date in dropdown lists, this quickie SO post on selecting months/years and the Rails DateHelper API Docs for some help with creating Date selects.

### Screen 2: Pick a Flight

Once search results are returned, the user just needs to choose from among the available flights.

 1. Once the user has submitted the form, your controller should detect the additional query parameters (e.g. from /flights?departure_code=SFO&arrival_code=NYC&date=20131215&num_tickets=2) and should pull the flights which match that criteria from your database through smart querying model methods.
 2. Send those flights back to your app/views/flights/index.html.erb view. Make it so that the view will display the results below (if present).
 3. Don’t get rid of the search dropdowns – keep the search form active at the top so the user can try running a new search.
 4. The search results will need to be in their own form – this time for selecting which of the flights the user would like to choose. Each returned flight should render with a radio button next to it. The user will select which flight to submit and move onto the next step. The form should submit to the #new action of the BookingsController you’re about to create using another GET method. You’ll need to include a hidden field that contains the number of passengers.

### Screen 3: Passenger Information

Once the user has submitted their chosen flight, it’s time to take their booking information. You’ll need a form to submit the Booking and also create a Passenger object for each passenger who needs a ticket. Don’t worry about creating a separate “Ticket” object, we’ll assume the airline will issue those once the booking is verified.

 1. Create and migrate the Booking model.
 2. Create and migrate the Passenger model (just keep the information simple – name and email only).
 3. Set up associations between Bookings, Passengers, and Flights.
 4. Create a BookingsController and appropriate routes.
 5. Set up your #new action, which should have received the flight ID and passenger number parameters, and use it to help render a form for a new booking which displays the currently chosen date, airports, flight ID and a set of fields to enter personal information for each passenger. You’ll want to create a new blank Passenger object in your controller for each passenger, and then use #fields_for in the view to set up the sub-forms.
 6. Try submitting the form and check out the parameters in your server.
 7. You’ll need your #create action to create a new Booking (linking it to the appropriate Flight) but it will also need to accept the nested attributes for each of the Passenger objects and create a new Passenger from them. Be mindful of allowing the nested parameters as well.
 8. Go to the Booking model and implement the #accepts_nested_attributes_for method. See the Rails API for examples and this SO post for another.
 9. Once your form is successfully submitted, render the booking’s #show page which displays the booking information (flight and passenger information).
 10. Make sure your ticketing flow is working properly. Good work!