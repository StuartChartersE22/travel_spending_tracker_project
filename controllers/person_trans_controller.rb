require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
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
  params["timelog"] = @transaction.date()
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

#EDIT FROM PERSON FOR TRANSACTION
get "/person_trans/:id/edit" do
  @transactions = Transaction.find_not_lendings()
  @person_trans = PersonTrans.find(params["id"])
  erb(:"person_trans/edit_from_person_for_trans")
end

#UPDATE FROM PERSON FOR TRANSACTION
post "/person_trans/:person_trans_id/:person_id/update" do
  params["owe"] += ".00" if params["owe"].count(".") == 0
  @transaction = Transaction.find(params["transaction_id"].to_i())
  params["timelog"] = @transaction.date()
  @person_trans = PersonTrans.new(params)
  @person_trans.update()
  redirect to("/person/#{params["person_id"]}")
end

#EDIT FROM PERSON FOR TRIP
get "/person_trans/:id/edit/trip" do
  @person_trans = PersonTrans.find(params["id"])
  @trips = Trip.all()
  @transaction = Transaction.find(@person_trans.transaction_id())
  erb(:"person_trans/edit_from_person_for_trip")
end

#UPDATE FROM PERSON FOR TRIP
post "/person_trans/:person_trans_id/update/trip" do
  @original_p_t = PersonTrans.find(params["person_trans_id"])
  params["owe"] += ".00" if params["owe"].count(".") == 0
  @trip = Trip.find(params["trip_id"].to_i())
  params["name"] = "Lent"
  params["timelog"] = @trip.date() if params["timelog"] == ""
  params["amount"] = params["owe"]
  params["id"] = @original_p_t.transaction_id
  params["identity"] = params["person_trans_id"]
  @transaction = Transaction.new(params)
  # binding.pry
  @transaction.update()
  params["transaction_id"] = @transaction.id()
  params["person_id"] = @original_p_t.person_id
  @person_trans = PersonTrans.new(params)
  @person_trans.update()
  redirect to("/person/#{params["person_id"]}")
end

#DELETE FROM PERSON FOR TRANSACTION
post "/person_trans/:id/delete" do
  @person_trans = PersonTrans.find(params["id"])
  person_id = @person_trans.person_id()
  @person_trans.delete()
  redirect to("/person/#{person_id}")
end

#DELETE FROM PERSON FOR TRIP
post "/person_trans/:id/delete/trip" do
  @person_trans = PersonTrans.find(params["id"])
  person_id = @person_trans.person_id()
  @transaction = Transaction.find(@person_trans.transaction_id().to_i())
  @person_trans.delete()
  @transaction.delete()
  redirect to("/person/#{person_id}")
end
