require_relative("../db/sql_runner_money_tracker.rb")
require("pry")

class PersonTrans

  attr_reader(:id, :transaction_id, :person_id)
  attr_accessor(:owe)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @transaction_id = details["transaction_id"].to_i()
    @person_id = details["person_id"].to_i()
    @owe = details["owe"].to_i()
  end

end
