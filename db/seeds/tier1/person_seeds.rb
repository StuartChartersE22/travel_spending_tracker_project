require_relative("../../../models/person.rb")
require("pry")

class PersonSeeds

  def self.plant()
    person1 = Person.new({
      "name" => "Jane"
    })

    person1.save()
    return [person1]
  end

end
