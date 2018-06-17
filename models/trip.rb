require_relative("../db/sql_runner_money_tracker.rb")
require_relative("./transaction.rb")
require_relative("./money.rb")
require_relative("./date_time.rb")
require("pry")

class Trip

  attr_reader(:id, :budget, :current, :business, :date)
  attr_accessor(:name)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @budget = Money.convert_to_integer(details["budget"])
    @current = details["current"] ? true : nil
    @business = details["business"]=="true" || details["business"]=="t" ? true : false
    @date = (details["timelog"])
  end

#Pure Ruby instance methods
  def show_decimal_budget()
    return Money.convert_to_decimal_string(@budget)
  end

  def change_budget(decimal_string)
    @budget = Money.convert_to_integer(decimal_string)
  end

  def make_business()
    @bussines = true
  end

  def make_not_business()
    @bussiness = false
  end

  def make_current()
    @current = true
  end

  def make_not_current()
    @current = nil
  end

#Pure Ruby class methods
  def self.map_trips(array_of_details)
    return array_of_details.map {|dets| self.new(dets)}
  end

#SQL instance methods
  def save_initial()
    sql = "INSERT INTO trips
    (name, budget, current, business, timelog)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @budget, @current, @business, @date]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def save()
    unique_current if @current
    sql = "INSERT INTO trips
    (name, budget, current, business, timelog)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@name, @budget, @current, @business, @date]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def delete()
    sql = "DELETE FROM trips
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    unique_current if @current
    sql = "UPDATE trips
    SET (name, budget, current, business, timelog) = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@name, @budget, @current, @business, @date, @id]
    SqlRunner.run(sql, values)
  end

  def expenditure_total()
    sql = "SELECT SUM(transactions.amount) FROM trips
    INNER JOIN transactions ON trips.id = transactions.trip_id
    WHERE trips.id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).values()[0][0].to_i()
  end

  def remaining_budget()
    return amount_left = @budget - expenditure_total
  end

  def unique_current()
    if Trip.find_current()
      old_current = Trip.find_current()
      old_current.make_not_current()
      old_current.update
    end
  end

  def find_transactions()
    sql = "SELECT * FROM transactions WHERE transactions.trip_id = $1"
    values = [@id]
    details = SqlRunner.run(sql,values)
    return nil if details.values().length() == 0
    return Transaction.map_transactions(details)
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

  def self.find_current()
    sql = "SELECT * FROM trips WHERE current = true"
    details = SqlRunner.run(sql)
    if details.values().length() != 0
      return self.new(details[0])
    else
      return nil
    end
  end

  def self.all_but_current()
    sql = "SELECT * FROM trips EXCEPT (SELECT * FROM trips WHERE current = true)"
    array_of_details = SqlRunner.run(sql)
    return self.map_trips(array_of_details)
  end

end
