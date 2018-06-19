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
  params["amount"] += ".00" unless params["amount"].include?(".")
  @item = Item.new(params)
  @item.save()
  redirect to("/transaction/#{params["transaction_id"]}")
end

#EDIT
get "/item/:transaction_id/edit" do

end

#UPDATE

#DELETE
