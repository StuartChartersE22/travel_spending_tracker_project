require("minitest/autorun")
require_relative("../tag.rb")

class TagTest < MiniTest::Test

  def setup
    @tag1 = Tag.new({
      "name" => "Lunch"
      })
  end

  def test_has_name
    assert_equal("lunch", @tag1.name())
  end

end
