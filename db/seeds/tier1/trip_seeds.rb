require_relative("../../../models/trip.rb")
require("pry")

# Trip.delete_all()
class TripSeeds

  def self.plant()

    trip1 = Trip.new({
      "name" => "Family holiday",
      "budget" => "50000",
      "current" => "true",
      "business" => nil,
      "timelog" => "2018-10-13"
    })

    trip2 = Trip.new({
      "name" => "Business trip",
      "budget" => "20000",
      "current" => nil,
      "business" => "true",
      "timelog" => "2018-05-06"
    })

    trip1.save_initial()
    trip2.save()
    return [trip1, trip2]
  end

end
