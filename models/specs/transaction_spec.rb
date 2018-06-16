require("minitest/autorun")
require_relative("../transaction.rb")

class TransactionTest < MiniTest::Test

  def setup
    @transaction1 = Transaction.new({
      "name" => "Lunch with family",
      "trip_id" => "1",
      "amount" => "15.75",
      "timelog" => "2018-10-18 12:30:02",
      "business" => "false",
      "company" => "Subway"
      })
  end

  def test_has_name
    assert_equal("Lunch with family", @transaction1.name())
  end

end
