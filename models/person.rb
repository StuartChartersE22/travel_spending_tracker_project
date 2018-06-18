require_relative("../db/sql_runner_money_tracker.rb")
require("pry")

class Person

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @name = details["name"]
  end

  #Pure Ruby class methods
    def self.map_people(array_of_details)
      return array_of_details.map {|dets| self.new(dets)}
    end

  #SQL instance methods
    def save()
      sql = "INSERT INTO people
      (name) VALUES ($1)
      RETURNING id"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

    def delete()
      sql = "DELETE FROM people
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def update()
      sql = "UPDATE people
      SET name = $1
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def find_transactions()
      sql = "SELECT transactions.* FROM people
      INNER JOIN people_trans ON people_trans.person_id = people.id
      INNER JOIN transactions ON people_trans.transaction_id = transactions.id
      WHERE people_trans.person_id = $1"
      values = [@id]
      trans_details = SqlRunner.run(sql,values)
      return Transaction.map_transactions(trans_details)
    end

  #SQL class methods
    def self.delete_all()
      sql = "DELETE FROM people"
      return SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM people"
      array_of_details = SqlRunner.run(sql)
      return self.map_people(array_of_details)
    end

    def self.find(id)
      sql = "SELECT * FROM people WHERE id = $1"
      values = [id]
      details = SqlRunner.run(sql, values)[0]
      return self.new(details)
    end

end
