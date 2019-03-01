require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb ''
end

get '/tablet' do
	erb :tablet
end

post '/' do
	@admin_login = params['username']
	@admin_password = params['password']

	if @admin_login == 'admin' && @admin_password == 'secret'
		redirect '/tablet'	
	end	
end
