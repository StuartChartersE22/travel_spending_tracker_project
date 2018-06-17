require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/transaction.rb")

#INDEX
get "/trip/:trip_id" do
  erb(:"transaction/index")
end

#CREATE

#NEW

#SHOW

#EDIT

#UPDATE

#DELETE
