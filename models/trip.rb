require("../db/sql_runner_money_tracker.rb")
require("pry")

class Trip

  attr_reader(:id)
  attr_accessor(:name, :budget, :current, :timelog)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @budget = details["budget"].to_i()
    @current = details["current"]=="true"
    @timelog = details["timelog"]
  end

end
