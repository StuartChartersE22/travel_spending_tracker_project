require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*.rb")
require_relative("../models/trip.rb")
require_relative("../models/money.rb")

#INDEX
get "/trips" do
  erb(:"/trip/index")
end

#NEW
get "/trips/new" do
  erb(:"/trip/new")
end

#CREATE
post "/trips" do
  @trip = Trip.new(params)
  if Trip.all().length() != 0
    @trip.save()
  else
    @trip.save_initial()
  end
  redirect to("/trips/<%= @trip.id() %>")
end

#SHOW
#goes to /:id which is the transaction index

#EDIT
get "/trips/:id/edit" do
  @trip = Trip.find(params["id"].to_i())
  erb(:"trip/edit")
end

#UPDATE
post "/trips/:id" do
  @trip = Trip.new(params)
  @trip.update()
  redirect to ("/trips")
end

#DELETE
