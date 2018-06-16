require_relative("../../../models/transaction.rb")
require_relative("../tier1/trip_seeds.rb")
require("pry")

class TransactionSeeds

  def self.plant(trips)

    transaction1 = Transaction.new({
      "name" => "Lunch with family",
      "trip_id" => trips[0].id(),
      "amount" => "15.75",
      "timelog" => "2018-10-18 12:30:02",
      "business" => "false",
      "company" => "Subway"
    })

    transaction1.save()
    return [transaction1]
  end

end
