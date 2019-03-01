require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb ''
end

get '/about' do
	erb :about
end

post '/' do
	@admin_login = params['username']
	@admin_password = params['password']

	if @admin_login == 'admin' && @admin_password == 'secret'
		erb :tablet	
	end	
end
