require_relative("../../../models/tag.rb")
require("pry")

Tag.delete_all()

tag1 = Tag.new({
  "name" => "Lunch"
  })

  tag1.save()

  binding.pry
  nil
