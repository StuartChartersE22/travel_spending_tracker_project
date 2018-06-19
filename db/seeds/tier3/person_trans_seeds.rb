require_relative("../../../models/person_trans.rb")
require("pry")

class PersonTransSeeds

  def self.plant(people, transactions)
    person_trans1 = PersonTrans.new({
      "transaction_id" => transactions[0].id(),
      "person_id" => people[0].id(),
      "owe" => "1363",
      "timelog" => "2018-10-18 12:30:02"
      })

    person_trans1.save()
    return [person_trans1]
  end

end
