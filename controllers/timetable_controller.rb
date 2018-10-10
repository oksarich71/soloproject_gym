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

get '/timetable/:id' do
    @timetable = Timetable.find(params[:id].to_i)
    @members = @timetable.list_members
    erb( :"timetable/show" )
  end

  get('/timetable/new') do
    erb(:"timetable/new")
  end
