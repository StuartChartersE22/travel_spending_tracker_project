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
  redirect to("/trip/#{@transaction.trip_id()}")
end

#SHOW
get "/transaction/:id" do
  @transaction = Transaction.find(params["id"].to_i())
  erb(:"transaction/show")
end

#EDIT
get "/transaction/:id/edit" do
  @transaction = Transaction.find(params["id"].to_i())
  erb(:"transaction/edit")
end

#UPDATE
post "/transaction/:id/update" do
  params["amount"] += ".00" if params["amount"].count(".") == 0
  params["name"] = params["date"] unless params["name"]
  params["company"] = nil if params["company"] == ""
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect to("/transaction/#{@transaction.id()}")
end

#DELETE
post "/transaction/:id/delete" do
  @transaction = Transaction.find(params["id"].to_i())
  trip_id = @transaction.trip_id()
  @transaction.delete()
  redirect to("/trip/#{trip_id}")
end
