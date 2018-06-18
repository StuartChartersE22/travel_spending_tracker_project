require_relative("../db/sql_runner_money_tracker.rb")
require_relative("./money.rb")
require_relative("./date_time.rb")
require_relative("./tag.rb")
require_relative("./trip.rb")
require("pry")

class Transaction

  attr_reader(:id, :trip_id, :date, :business, :person_id)
  attr_accessor(:name, :company, :amount)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @trip_id = details["trip_id"].to_i()
    @amount = Money.convert_to_integer(details["amount"])
    @date = details["timelog"]
    @business = details["business"]=="true" || details["business"]=="t" ? true : false
    @company = details["company"] if details["company"]
    @person_id = details["person_id"].to_i() if details["person_id"]
  end

  #Pure Ruby instance methods
    def show_decimal_amount()
      return Money.convert_to_decimal_string(@amount)
    end

    def change_amount(decimal_string)
      @amount = Money.convert_to_integer(decimal_string)
    end

  #Pure Ruby class methods
    def self.map_transactions(array_of_details)
      return array_of_details.map {|dets| self.new(dets)}
    end

  #SQL instance methods
    def save()
      sql = "INSERT INTO transactions
      (name, trip_id, amount, timelog, business, company, person_id)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id"
      values = [@name, @trip_id, @amount, @date, @business, @company, @person_id]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

    def delete()
      sql = "DELETE FROM transactions
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE transactions
      SET (name, trip_id, amount, timelog, business, company, person_id) = ($1, $2, $3, $4, $5, $6, $7)
      WHERE id = $8"
      values = [@name, @trip_id, @amount, @date, @business, @company, @person_id, @id]
      SqlRunner.run(sql, values)
    end

    def find_tags()
      sql = "SELECT tags.* FROM tags
      INNER JOIN trans_tags ON trans_tags.tag_id = tags.id
      INNER JOIN transactions ON trans_tags.transaction_id = transactions.id
      WHERE transaction_id = $1"
      values = [@id]
      tag_details = SqlRunner.run(sql,values)
      return Tag.map_tags(tag_details)
    end

    def find_trip()
      sql = "SELECT trips.* FROM trips WHERE trips.id = $1"
      values = [@trip_id]
      details = SqlRunner.run(sql, values)[0]
      return Trip.new(details)
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
