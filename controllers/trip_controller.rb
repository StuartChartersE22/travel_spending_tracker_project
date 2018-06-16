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
  erb(:"trip/create")
end

#SHOW

#EDIT

#UPDATE

#DELETE
