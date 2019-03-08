require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require "./reader"

get '/' do
	@error = "something wrong!"
	erb ''
end

get '/visit' do
	erb :visit
end

get '/about' do
	erb :about
end

get '/tablet' do
	rewrite_tablet
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
	hh = {"#7bd148" => "Green",
		"#5484ed" => "Bold blue",
		"#a4bdfc" => "Blue",
		"#46d6db" => "Turquoise",
		"#7ae7bf" => "Light green",
		"#51b749" => "Bold green",
		"#fbd75b" => "Yellow",
		"#ffb878" => "Orange",
		"#ff887c" => "Red",
		"#dc2127" => "Bold red",
		"#dbadff" => "Purple",
		"#e1e1e1" => "Gray"}

		@visit_name = params['visit_name']
		@visit_phone = params['visit_phone']
		@visit_time = params['visit_time']
		@visit_specialist = params['visit_specialist']
		@visit_color = params['visit_color']

		if @visit_name == ''
			@error = "Заполните поле \"Ваше имя\""
			return erb :visit
		elsif @visit_phone == ''
			@error = "Заполните поле \"Номер телефона\""
			return erb :visit
		elsif @visit_time == ''
			@error = "Заполните поле \"Время визита\""
			return erb :visit
		end
		
	f = File.open './public/clients.txt', 'a'
	f.write "#{@visit_name}\n#{@visit_phone}\n#{@visit_time}\n#{@visit_specialist}\n#{hh[@visit_color]}"
	f.close

    erb "Уважаемый #{@visit_name}, вас будет ждать #{@visit_specialist}, в #{@visit_time}, до скорого."
end
