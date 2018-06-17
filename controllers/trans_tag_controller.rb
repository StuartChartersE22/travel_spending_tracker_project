require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/trans_tag.rb")

#INDEX

#CREATE
get "/trans-tag/:id" do
  @transaction = Transaction.find(params["id"])
  erb(:"trans_tag/create")
end

#NEW
post "/trans_tag/:transaction_id" do
  @trans_tag = TransTag.new(params)
  @trans_tag.save()
  redirect to("/transaction/#{@trans_tag.transaction_id()}")
end

#SHOW

#EDIT

#UPDATE

#DELETE
