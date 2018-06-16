require_relative("../../../models/trip.rb")
require("pry")

Trip.delete_all()

trip1 = Trip.new({
  "name" => "Family holiday",
  "budget" => "500.00",
  "current" => "true",
  "timelog" => "2018-10-13"
  })

trip2 = Trip.new({
  "name" => "Business trip",
  "budget" => "200.00",
  "current" => "false",
  "timelog" => "2018-05-06"
  })

  trip1.save()
  trip2.save()

  binding.pry
  nil
