require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/person.rb")

#INDEX
get "/people" do
  @people = Person.all()
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
  @relationships = @person.find_relationships_and_transactions()
  erb(:"person/show")
end

#EDIT
get "/person/:id/edit" do
  @person = Person.find(params["id"])
  erb(:"person/edit")
end

#UPDATE
post "/person/:id/update" do
  @person = Person.new(params)
  @person.update()
  redirect to("/person/#{@person.id()}")
end

#DELETE
post "/person/:id/delete" do
  @person = Person.find(params["id"])
  @person.delete()
  redirect to("/people")
end
