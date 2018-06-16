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
    @current = details["current"].downcase() == "t" || details["current"].downcase() == "true"
    @timelog = details["timelog"]
  end

#Pure Ruby instance methods
  def show_decimal_budget()
    return Money.convert_to_decimal_string(@budget)
  end

#Pure Ruby class methods
  def self.map_trips(array_of_details)
    return array_of_details.map {|dets| self.new(dets)}
  end

#SQL instance methods
  def save()
    sql = "INSERT INTO trips
    (name, budget, current, timelog)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@name, @budget, @current, @timelog]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def delete()
    sql = "DELETE FROM trips
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#SQL class methods
  def self.delete_all()
    sql = "DELETE FROM trips"
    return SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM trips"
    array_of_details = SqlRunner.run(sql)
    return self.map_trips(array_of_details)
  end

  def self.find(id)
    sql = "SELECT * FROM trips WHERE id = $1"
    values = [id]
    details = SqlRunner.run(sql, values)[0]
    return self.new(details)
  end

end
