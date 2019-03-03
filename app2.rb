require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb ''
end

get '/visit' do
	erb :visit
end

get '/about' do
	erb :about
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

post '/visit' do
	@visit_name = params['visit_name']
	@visit_phone = params['visit_phone']
	@visit_time = params['visit_time']
	@visit_specialist = params['visit_specialist']
	@visit_color = params['visit_color']

	f = File.open './public/clients.txt', 'a'
	f.write "#{@visit_name}\n#{@visit_phone}\n#{@visit_time}\n#{@visit_specialist}\n#{@visit_color}"
	f.close

    erb "Уважаемый #{@visit_name}, вас будет ждать #{@visit_specialist}, в #{@visit_time}, до скорого."
end
