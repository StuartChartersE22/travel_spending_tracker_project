require_relative("../../../models/trans_tag.rb")
require("pry")

class TransTagSeeds

  def self.plant(transactions, tags)
    trans_tag1 = TransTag.new({
      "transaction_id" => transactions[0].id(),
      "tag_id" => tags[0].id(),
      })

    trans_tag1.save()
    return [trans_tag1]
  end

end
