require_relative("../../../models/transaction.rb")
require_relative("../tier1/trip_seeds.rb")
require("pry")

class TransactionSeeds

  def self.plant(trips)

    transaction1 = Transaction.new({
      "name" => "Lunch with family",
      "trip_id" => trips[0].id(),
      "amount" => "1575",
      "timelog" => "2018-10-18 12:30:02",
      "business" => "false",
      "company" => "Subway"
    })

    transaction2 = Transaction.new({
      "name" => "Business lunch",
      "trip_id" => trips[1].id(),
      "amount" => "3600",
      "timelog" => "2018-10-18 12:30:02",
      "business" => "true",
      "company" => "The Kitchin"
    })

    transaction1.save()
    transaction2.save()
    return [transaction1, transaction2]
  end

end
