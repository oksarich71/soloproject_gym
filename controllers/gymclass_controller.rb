require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclasses' do
  @gymclasses = Gymclass.all()
  erb ( :"gymclasses/index" )
end

get('/gymclasses/new') do
  erb(:"gymclasses/new")
end

get '/gymclasses/destroy' do
  @gymclasses = Gymclass.all()
  erb(:"gymclasses/destroy")
end

post '/gymclasses' do
  gymclass = Gymclass.new(params)
  gymclass.save
  redirect to("/gymclasses")
end

post('/gymclasses/:id/delete') do
  id = params[:id]
  Gymclass.find(id).delete
  redirect to ("/gymclasses")
end
