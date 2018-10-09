require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/gymclass.rb' )
require_relative( '../models/booking.rb' )
require_relative( '../models/timetable.rb' )
also_reload( '../models/*' )

get '/timetable' do
  @timetable = Timetable.all
  erb ( :"timetable/index" )
end
