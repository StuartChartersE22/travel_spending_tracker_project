require_relative("../../../models/tag.rb")
require("pry")

class TagSeeds

  def self.plant()
    tag1 = Tag.new({
      "name" => "Lunch"
    })

    tag1.save()
    return [tag1]
  end

end
