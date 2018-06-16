require("minitest/autorun")
require_relative("../item.rb")

class ItemTest < MiniTest::Test

  def setup
    @item1 = Item.new({
      "name" => "beer",
      "amount" => "5.00",
      "transaction_id" => "1"
      })
  end

  def test_has_name
    assert_equal("beer", @item1.name())
  end

end
