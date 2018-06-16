require_relative("./tier1/trip_seeds.rb")
require_relative("./tier1/tag_seeds.rb")
require_relative("./tier1/person_seeds.rb")

require_relative("./tier2/transaction_seeds.rb")

require_relative("./tier3/item_seeds.rb")
require_relative("./tier3/person_trans_seeds.rb")
require_relative("./tier3/trans_tag_seeds.rb")

#Tier 3
Item.delete_all()
PersonTrans.delete_all()
TransTag.delete_all()

#Tier 2
Transaction.delete_all()

#Tier 1
Trip.delete_all()
Person.delete_all()
Tag.delete_all()

#Tier 1 -------------------------------------------------------------

trips = TripSeeds.plant()
# binding.pry
# nil

people = PersonSeeds.plant()
# binding.pry
# nil

tags = TagSeeds.plant()
# binding.pry
# nil

#Tier 2 -------------------------------------------------------------

transactions = TransactionSeeds.plant(trips)
# binding.pry
# nil

#Tier 3 -------------------------------------------------------------

items = ItemSeeds.plant(transactions)
# binding.pry
# nil

people_trans = PersonTransSeeds.plant(people, transactions)
# binding.pry
# nil

trans_tags = TransTagSeeds.plant(transactions, tags)
# binding.pry
# nil

binding.pry
nil
