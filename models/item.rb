require_relative("../db/sql_runner_money_tracker.rb")
require("pry")

class Item

  attr_reader(:id, :transaction_id)
  attr_accessor(:name)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
    @amount = details["amount"].to_i()
    @transaction_id = details["transaction_id"].to_i()
  end

  #Pure Ruby class methods
    def self.map_items(array_of_details)
      return array_of_details.map {|dets| self.new(dets)}
    end

  #SQL instance methods
    def save()
      sql = "INSERT INTO items
      (name, amount, transaction_id) VALUES ($1, $2, $3)
      RETURNING id"
      values = [@name, @amount, @transaction_id]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

  #SQL class methods
    def self.delete_all()
      sql = "DELETE FROM items"
      return SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM items"
      array_of_details = SqlRunner.run(sql)
      return self.map_items(array_of_details)
    end

    def self.find(id)
      sql = "SELECT * FROM items WHERE id = $1"
      values = [id]
      details = SqlRunner.run(sql, values)[0]
      return self.new(details)
    end

end
