require("minitest/autorun")
require_relative("../person.rb")

class PersonTest < MiniTest::Test

  def setup
    @person1 = Person.new({
      "name" => "Jane"
      })
  end

  def test_has_name
    assert_equal("Jane", @person1.name())
  end

end
