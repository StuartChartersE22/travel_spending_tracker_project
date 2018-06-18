require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/person_trans.rb")

#NEW FROM PERSON FOR Transaction
get "/person_trans/:id/person" do
  @person = Person.find(params["id"])
  erb(:"person_trans/new")
end

#CREATE FROM PERSON FOR TRANSACTION
post "/person_trans/create/:person_id/person" do
  params["owe"] += ".00" if params["owe"].count(".") == 0
  @transaction = Transaction.find(params["transaction_id"])
  params["date"] = @transaction.date()
  @person_trans = PersonTrans.new(params)
  @person_trans.save()
  redirect to("/person/#{params["person_id"]}")
end

#NEW FROM PERSON FOR TRIP


#CREATE FROM PERSON FOR TRIP

#SHOW

#EDIT

#UPDATE

#DELETE
