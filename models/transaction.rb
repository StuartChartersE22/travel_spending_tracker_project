require("../db/sql_runner_money_tracker.rb")
require("pry")

class Transaction

  attr_reader(:id, :trip_id)
  attr_accessor(:name, :amount, :timelog, :business, :company)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @trip_id = details["trip_id"].to_i()
    @amount = details["amount"].to_i()
    @timelog = details["timelog"]
    @business = details["business"]=="true"
    @company = details["company"] if details["company"]
  end

end
