require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/person_trans.rb")

#NEW FROM PERSON FOR Transaction
get "/person_trans/:id/person" do
  @transactions = Transaction.find_not_lendings()
  @person = Person.find(params["id"])
  erb(:"person_trans/new_from_person_for_trans")
end

#CREATE FROM PERSON FOR TRANSACTION
post "/person_trans/create/:person_id/person" do
  params["owe"] += ".00" if params["owe"].count(".") == 0
  @transaction = Transaction.find(params["transaction_id"].to_i())
  params["date"] = @transaction.date()
  @person_trans = PersonTrans.new(params)
  @person_trans.save()
  redirect to("/person/#{params["person_id"]}")
end

#NEW FROM PERSON FOR TRIP
get "/person_trans/:id/person/trip" do
  @person = Person.find(params["id"].to_i())
  @trips = Trip.all()
  erb(:"person_trans/new_from_person_for_trip")
end

#CREATE FROM PERSON FOR TRIP
post "/person_trans/create/:person_id/person/trip" do
  params["owe"] += ".00" if params["owe"].count(".") == 0
  @person = Person.find(params["person_id"].to_i())
  @trip = Trip.find(params["trip_id"].to_i())
  params["name"] = "Lent"
  params["timelog"] = @trip.date() if params["timelog"] == ""
  params["amount"] = params["owe"]
  @transaction = Transaction.new(params)
  @transaction.save()
  params["transaction_id"] = @transaction.id()
  @person_trans = PersonTrans.new(params)
  @person_trans.save()
  redirect to("/transaction/#{@transaction.id()}")
end

#SHOW

#EDIT

#UPDATE

#DELETE
post "/person_trans/:id" do
  @person_trans = PersonTrans.find(params["id"])
  person_id = @person_trans.person_id()
  @person_trans.delete()
  redirect to("/person/#{person_id}")
end
