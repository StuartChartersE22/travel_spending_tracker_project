require_relative("../db/sql_runner_money_tracker.rb")
require_relative("./money.rb")
require("pry")

class Transaction

  attr_reader(:id, :trip_id)
  attr_accessor(:name, :amount, :timelog, :business, :company)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @trip_id = details["trip_id"].to_i()
    @amount = Money.convert_to_integer(details["amount"])
    @timelog = details["timelog"]
    @business = details["business"].downcase() == "t" || details["business"].downcase() == "true"
    @company = details["company"]
  end

  #Pure Ruby instance methods
    def show_decimal_amount()
      return Money.convert_to_decimal_string(@amount)
    end

  #Pure Ruby class methods
    def self.map_transactions(array_of_details)
      return array_of_details.map {|dets| self.new(dets)}
    end

  #SQL instance methods
    def save()
      sql = "INSERT INTO transactions
      (name, trip_id, amount, timelog, business, company)
      VALUES
      ($1, $2, $3, $4, $5, $6)
      RETURNING id"
      values = [@name, @trip_id, @amount, @timelog, @business, @company]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

    def delete()
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

  #SQL class methods
    def self.delete_all()
      sql = "DELETE FROM transactions"
      return SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM transactions"
      array_of_details = SqlRunner.run(sql)
      return self.map_transactions(array_of_details)
    end

    def self.find(id)
      sql = "SELECT * FROM transactions WHERE id = $1"
      values = [id]
      details = SqlRunner.run(sql, values)[0]
      return self.new(details)
    end

end
