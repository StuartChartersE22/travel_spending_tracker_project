require( 'sinatra' )
require( 'sinatra/contrib/all' )
also_reload("../models/*")
also_reload("../controllers/*")
require_relative("../models/item.rb")

#INDEX
get "/items/:transaction_id" do
  @transaction = Transaction.find(params["transaction_id"])
  @items = Item.all()
  erb(:"item/")
end

#CREATE

#NEW

#SHOW

#EDIT

#UPDATE

#DELETE
