require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/tag.rb")

#INDEX
get "/tags" do
  erb(:"tag/index")
end

#NEW
get "/tags/new" do
  erb(:"tag/new")
end

#CREATE


#SHOW

#EDIT

#UPDATE

#DELETE
