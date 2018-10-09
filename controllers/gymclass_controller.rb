require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclasses' do
  @gymclasses = Gymclass.all()
  erb ( :"gymclasses/index" )
end

get '/gymclasses/:id' do
  @gymclass = Gymclass.find(params['id'].to_i)
  erb(:"gymclasses/show")
end
