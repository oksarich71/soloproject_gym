require_relative( "../models/member.rb" )
require_relative( "../models/gymclass.rb" )
require_relative( "../models/timetable.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Member.delete_all()
Gymclass.delete_all()
Timetable.delete_all()
Booking.delete_all()

member1 = Member.new({
  "name" => "Daisy White",
  "membership" => "Premium"
})
member2 = Member.new({
  "name" => "Rose Red",
  "membership" => "Premium"
})
member3 = Member.new({
  "name" => "Aaron Green",
  "membership" => "Regular"
})
member4 = Member.new({
  "name" => "Sam Martin",
  "membership" => "Premium"
})
member5 = Member.new({
  "name" => "Adam Finn",
  "membership" => "Regular"
})

member1.save()
member2.save()
member3.save()
member4.save()
member5.save()

gymclass1 = Gymclass.new({
  "type" => 'Bodybalance'
  })
gymclass2 = Gymclass.new({
  "type" => 'Bodypump'
  })
gymclass3 = Gymclass.new({
  "type" => 'Bodystep'
  })
gymclass4 = Gymclass.new({
  "type" => 'Bodyattack'
  })
gymclass5 = Gymclass.new({
  "type" => 'Piyo'
  })
gymclass1.save
gymclass2.save
gymclass3.save
gymclass4.save
gymclass5.save

timetable1 = Timetable.new({
  "gymclass_id" => gymclass1.id,
  "time" => "09:15",
  "day" => 'Monday',
  "capacity" => 25
  })
timetable2 = Timetable.new({
  "gymclass_id" => gymclass1.id,
  "time" => "19:30",
  "day" => 'Thursday',
  "capacity" => 20
  })
timetable3 = Timetable.new({
  "gymclass_id" => gymclass2.id,
  "time" => "11:00",
  "day" => 'Tuesday',
  "capacity" => 15
  })
timetable4 = Timetable.new({
  "gymclass_id" => gymclass4.id,
  "time" => "17:30",
  "day" => 'Saturday',
  "capacity" => 25
  })
timetable5 = Timetable.new({
  "gymclass_id" => gymclass5.id,
  "time" => "18:30",
  "day" => 'Sunday',
  "capacity" => 20
  })
timetable1.save
timetable2.save
timetable3.save
timetable4.save
timetable5.save

booking1 = Booking.new({
  "member_id" => member2.id,
  "timetable_id" => timetable2.id
  })
booking2 = Booking.new({
  "member_id" => member3.id,
  "timetable_id" => timetable2.id
  })
booking3 = Booking.new({
  "member_id" => member1.id,
  "timetable_id" => timetable3.id
  })
booking4 = Booking.new({
  "member_id" => member4.id,
  "timetable_id" => timetable4.id
  })
booking1.save
booking2.save
booking3.save
booking4.save
# gymclass4.type = "Omnia"
# gymclass4.update
binding.pry
nil
