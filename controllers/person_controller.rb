require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/person.rb")

#INDEX
get "/people" do
  erb(:"person/index")
end

#NEW
get "/people/new" do
  erb(:"person/new")
end

#CREATE


#SHOW

#EDIT

#UPDATE

#DELETE
