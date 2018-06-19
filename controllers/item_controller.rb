require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/item.rb")

#NEW
get "/item/:transaction_id/new" do
  @transaction = Transaction.find(params["transaction_id"])
  erb(:"item/new")
end

#CREATE
post "/item/:transaction_id/create" do
  params["amount"] = Money.convert_to_integer(params["amount"]).to_s
  @item = Item.new(params)
  @item.save()
  redirect to("/transaction/#{params["transaction_id"]}")
end

#EDIT
get "/item/:id/edit" do
  @item = Item.find(params["id"])
  erb(:"item/edit")
end

#UPDATE

#DELETE
