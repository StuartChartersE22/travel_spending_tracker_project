require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/transaction.rb")

#INDEX
get "/trip/:id" do
  @trip = Trip.find(params["id"].to_i())
  erb(:"transaction/index")
end

#NEW
get "/trip/:id/new" do
  @trip = Trip.find(params["id"].to_i())
  erb(:"/transaction/new")
end

#CREATE
post "/trip/:id/create" do

end

#SHOW

#EDIT

#UPDATE

#DELETE
