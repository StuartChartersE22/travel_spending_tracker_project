require_relative("../db/sql_runner_money_tracker.rb")
require_relative("./money.rb")
require("pry")

class Trip

  attr_reader(:id, :budget)
  attr_accessor(:name, :current, :timelog)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @budget = Money.convert_to_integer(details["budget"])
    @current = details["current"]=="true"
    @timelog = details["timelog"]
  end

#Pure Ruby
  def show_decimal_budget()
    return Money.convert_to_decimal_string(@budget)
  end

end
