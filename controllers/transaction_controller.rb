require( 'sinatra' )
require( 'sinatra/contrib/all' )
require("pry")
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/transaction.rb")

#INDEX
get "/trip/:id" do
  @trip = Trip.find(params["id"].to_i())
  @transactions = @trip.find_transactions()
  @remaining_budget = @trip.remaining_budget()
  @expenditure_total = @trip.expenditure_total
  # binding.pry
  if @transactions
    @transactions = @transactions.map {|transaction| [transaction, transaction.find_people()] }
  end
  erb(:"transaction/index")
end

#NEW
get "/trip/:id/new" do
  @trip = Trip.find(params["id"].to_i())
  erb(:"/transaction/new")
end

#CREATE
post "/trip/:trip_id/create" do
  params["amount"] += ".00" unless params["amount"].include?(".")
  params["company"] = nil if params["company"] == ""
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to("/trip/#{@transaction.trip_id()}")
end

#SHOW
get "/transaction/:id" do
  @transaction = Transaction.find(params["id"].to_i())
  @people = @transaction.find_people()
  @tags = @transaction.find_tags()
  @items = @transaction.find_items()
  erb(:"transaction/show")
end

#EDIT
get "/transaction/:id/edit" do
  @trips = Trip.all()
  @transaction = Transaction.find(params["id"].to_i())
  erb(:"transaction/edit")
end

#UPDATE
post "/transaction/:id/update" do
  params["amount"] += ".00" if params["amount"].count(".") == 0
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
