require_relative("../db/sql_runner_money_tracker.rb")
require("pry")

class Person

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
  end

end
