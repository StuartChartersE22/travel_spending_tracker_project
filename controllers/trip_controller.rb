require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*.rb")
require_relative("../models/trip.rb")

#INDEX
get "/trips" do
  erb(:"/trip/index")
end

#NEW
get "/trips/new" do
  erb(:"/trip/new")
end

#CREATE
# post "/trips" do
#
# end

#SHOW

#EDIT

#UPDATE

#DELETE
