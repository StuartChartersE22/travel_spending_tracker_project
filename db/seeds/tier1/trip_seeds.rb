require_relative("../../../models/trip.rb")
require("pry")

# Trip.delete_all()
class TripSeeds

  def self.plant()

    trip1 = Trip.new({
      "name" => "Family holiday",
      "budget" => "500.00",
      "current" => "true",
      "business" => "false",
      "timelog" => "2018-10-13"
    })

    trip2 = Trip.new({
      "name" => "Business trip",
      "budget" => "200.00",
      "business" => "true",
      "timelog" => "2018-05-06"
    })

    trip1.save_initial()
    trip2.save()
    return [trip1, trip2]
  end

end
