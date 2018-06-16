require_relative("../db/sql_runner_money_tracker.rb")
require("pry")

class TransTag

  attr_reader(:id, :transaction_id, :tag_id)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @transaction_id = details["transaction_id"].to_i()
    @tag_id = details["tag_id"].to_i()
  end

end
