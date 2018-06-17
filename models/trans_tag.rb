require_relative("../db/sql_runner_money_tracker.rb")
require("pry")

class TransTag

  attr_reader(:id, :transaction_id, :tag_id)

  def initialize(details)
    @id = details["id"].to_i() if details["id"]
    @transaction_id = details["transaction_id"].to_i()
    @tag_id = details["tag_id"].to_i()
  end

  #Pure Ruby class methods
    def self.map_relationships(array_of_details)
      return array_of_details.map {|dets| self.new(dets)}
    end

  #SQL instance methods
    def save()
      sql = "INSERT INTO trans_tags
      (transaction_id, tag_id) VALUES ($1, $2)
      RETURNING id"
      values = [@transaction_id, @tag_id]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

    def delete()
      sql = "DELETE FROM trans_tags
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

  #SQL class methods
    def self.delete_all()
      sql = "DELETE FROM trans_tags"
      return SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM trans_tags"
      array_of_details = SqlRunner.run(sql)
      return self.map_relationships(array_of_details)
    end

    def self.find(id)
      sql = "SELECT * FROM trans_tags WHERE id = $1"
      values = [id]
      details = SqlRunner.run(sql, values)[0]
      return self.new(details)
    end

    def self.find_by_relationship(relationship)
      sql = "SELECT * FROM trans_tags WHERE trans_tag.transaction_id = $1 AND trans_tag.tag_id = $2"
      values = [relationship["transaction_id"], releationship["tag_id"]]
      details = SqlRunner.run(sql, values)[0]
      return self.new(details)
    end

end
