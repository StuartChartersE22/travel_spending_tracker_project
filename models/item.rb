require("../db/sql_runner_money_tracker.rb")
require("pry")

class Item

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @amount = details["amount"].to_i()
    @transaction_id = details["transaction_id"].to_i()
  end

end
