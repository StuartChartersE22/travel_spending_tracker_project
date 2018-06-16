require("minitest/autorun")
require_relative("../trip.rb")

class TripTest < MiniTest::Test

  def setup
    @trip1 = Trip.new({
      "name" => "Family holiday",
      "budget" => "500.00",
      "current" => "true",
      "timelog" => "2018-10-13"
      })
  end

  def test_has_name
    assert_equal("Family holiday", @trip1.name())
  end

  def test_has_budget_in_pence
    assert_equal(50_000, @trip1.budget())
  end

end
