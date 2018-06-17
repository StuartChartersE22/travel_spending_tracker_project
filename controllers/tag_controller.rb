require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/tag.rb")

#INDEX
get "/tags" do
  erb(:"tag/index")
end

#CREATE

#NEW

#SHOW

#EDIT

#UPDATE

#DELETE
