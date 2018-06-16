require_relative('controllers/item_controller')
require_relative('controllers/person_controller')
require_relative('controllers/person_trans_controller')
require_relative('controllers/tag_controller')
require_relative('controllers/trans_tag_controller')
require_relative('controllers/transaction_controller')
require_relative('controllers/trip_controller')

#INDEX
get '/' do
  erb( :index )
end
