require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
require_relative("../models/trip.rb")

#INDEX
get "/trips" do
  erb(:"/trip/index")
end

#CREATE

#NEW

#SHOW

#EDIT

#UPDATE

#DELETE
