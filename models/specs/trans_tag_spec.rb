require("minitest/autorun")
require_relative("../trans_tag.rb")

class TransTagTest < MiniTest::Test

  def setup
    @trans_tag1 = TransTag.new({
      "transaction_id" => "1",
      "tag_id" => "2",
      })
  end

  def test_has_transaction_id
    assert_equal(1, @trans_tag1.transaction_id())
  end

end
