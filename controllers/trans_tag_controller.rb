require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/trans_tag.rb")

#INDEX

#NEW
get "/trans-tag/:id" do
  @transaction = Transaction.find(params["id"])
  erb(:"trans_tag/new")
end


#CREATE
post "/trans_tag/create/:transaction_id" do
  @trans_tag = TransTag.new(params)
  @trans_tag.save()
  redirect to("/transaction/#{@trans_tag.transaction_id()}")
end

#EDIT

#UPDATE

#DELETE
