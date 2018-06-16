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
      return array_of_details.map {|dets| Person.new(dets)}
    end

  #SQL instance methods
    def save()
      sql = "INSERT INTO people
      (name) VALUES ($1)
      RETURNING id"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
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
end
