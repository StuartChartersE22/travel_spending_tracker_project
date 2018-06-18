require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/person.rb")

#INDEX
get "/people" do
  erb(:"person/index")
end 

#CREATE

#NEW

#SHOW

#EDIT

#UPDATE

#DELETE
