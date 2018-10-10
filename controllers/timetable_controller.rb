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

get('/timetable/:id/delete_booking') do
  @timetable = Timetable.find(params[:id].to_i)
  @members = Member.all
  erb(:"/timetable/destroy")
end

post('/timetable/:timetable_id') do
  id = params[:id]
  Booking.find(id).delete
  redirect to ("/timetable")
end

get('/timetable/:id/new_booking') do
  @timetable = Timetable.find(params[:id].to_i)
  @members = Member.all
  erb(:"timetable/new")
end

post ('/timetable/:timetable_id') do
  booking = Booking.new(params).save()
  redirect to ("/timetable")
end



get '/timetable/:id' do
    @timetable = Timetable.find(params[:id].to_i)
    @members = @timetable.list_members
    erb( :"timetable/show" )
  end
