require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/gymclass_controller')
require_relative('controllers/member_controller')
require_relative('controllers/timetable_controller')

get '/' do
  erb( :index )
end
