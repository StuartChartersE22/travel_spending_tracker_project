require_relative("../../../models/person.rb")
require("pry")

Person.delete_all()

person1 = Person.new({
  "name" => "Jane"
  })

  person1.save()

  binding.pry
  nil
