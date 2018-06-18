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
post "/people/create" do
  @person = Person.new(params)
  @person.save()
  redirect to("/people")
end

#SHOW
get "/person/:id" do
  @person = Person.find(params["id"])
  erb(:"person/show")
end

#EDIT
get "/person/:id/edit"
  @person = Person.find(params["id"])
end

#UPDATE

#DELETE
