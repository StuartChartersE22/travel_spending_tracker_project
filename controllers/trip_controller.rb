require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*.rb")
require_relative("../models/trip.rb")
require_relative("../models/money.rb")

#INDEX
get "/trips" do
  @current = Trip.find_current()
  @other_trips = Trip.all_but_current()
  erb(:"/trip/index")
end

#NEW
get "/trips/new" do
  erb(:"/trip/new")
end

#CREATE
post "/trips/create" do
  params["budget"] += ".00" unless params["budget"].include?(".")
  @trip = Trip.new(params)
  if Trip.all().length() != 0
    @trip.save()
  else
    @trip.save_initial()
  end
  redirect to ("/trips")
end

#SHOW
#goes to /trip/:id which is the transaction index

#EDIT
get "/trips/:id/edit" do
  @trip = Trip.find(params["id"].to_i())
  erb(:"trip/edit")
end

#UPDATE
post "/trips/:id" do
  params["budget"] += ".00" unless params["budget"].include?(".")
  @trip = Trip.new(params)
  @trip.update()
  redirect to ("/trips")
end

#DELETE conformation

#DELETE
post "/trips/:id/delete" do
  @trip = Trip.find(params["id"].to_i())
  @trip.delete()
  redirect to ("/trips")
end
