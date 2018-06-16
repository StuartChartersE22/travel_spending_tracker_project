require("minitest/autorun")
require_relative("../person_trans.rb")

class PersonTransTest < MiniTest::Test

  def setup
    @person_trans1 = PersonTrans.new({
      "transaction_id" => "1",
      "person_id" => "2",
      "owe" => "13.63",
      "timelog" => "2018-10-18 12:30:02"
      })
  end

  def test_has_transaction_id
    assert_equal(1, @person_trans1.transaction_id())
  end

end
