require_relative("../../../models/item.rb")
require("pry")

class ItemSeeds

  def self.plant(transactions)
    item1 = Item.new({
      "name" => "beer",
      "amount" => "500",
      "transaction_id" => transactions[0].id()
      })

    item1.save()
    return [item1]
  end

end
