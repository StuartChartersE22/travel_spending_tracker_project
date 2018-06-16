require( 'sinatra' )
require( 'sinatra/contrib/all' )
#tier 1
require_relative('controllers/trip_controller')
require_relative('controllers/tag_controller')
require_relative('controllers/person_controller')
#tier 2
require_relative('controllers/transaction_controller')
#tier 3
require_relative('controllers/item_controller')
require_relative('controllers/person_trans_controller')
require_relative('controllers/trans_tag_controller')



#INDEX
get '/' do
  erb( :index )
end
