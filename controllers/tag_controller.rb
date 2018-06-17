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
post "/tags/create" do
  @tag = Tag.new(params)
  @tag.save()
  redirect to("/tags")
end

#SHOW
get "/tag/:id" do
  @tag = Tag.find(params["id"])
  erb(:"tag/show")
end

#EDIT
get "/tag/:id/edit" do
  @tag = Tag.find(params["id"])
  erb(:"tag/edit")
end

#UPDATE
post "/tag/:id/update" do
  @tag = Tag.new(params)
  @tag.update()
  redirect to("/tag/#{@tag.id()}")
end

#DELETE
