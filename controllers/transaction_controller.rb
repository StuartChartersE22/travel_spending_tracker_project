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
post "/trip/:trip_id/create" do
  params["amount"] += ".00" if params["amount"].count(".") == 0
  params["name"] = params["date"] unless params["name"]
  params["company"] = nil if params["company"] == ""
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:"transaction/create")
end

#SHOW

#EDIT

#UPDATE

#DELETE
