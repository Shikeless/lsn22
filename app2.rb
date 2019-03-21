require 'sqlite3'
require 'rubygems'
require 'sinatra'
require 'pony'
require 'sinatra/reloader'
require "./reader.rb"

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
	colors = {"#7bd148" => "Green",
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

		validator = { 'visit_name' => "Заполните поле: \"Ваше имя\"",
						'visit_phone' => "Заполните поле: \"Номер телефона\"",
						'visit_time' => "Заполните поле: \"Время визита\""}
		
		#validator.each do |key, value|
		#	if params[key] == ''
		#		@error += validator[key]
		#	end
		#end

		@error = validator.select {|key,_| params[key] == ''}.values.join(", ")

		if @error != ''
			return erb :visit
		end

		#Pony.mail({
		#	:subject => "Barbershop запись подтверждена",
  		#	:body => "Уважаемый #{@visit_name}, вас будет ждать #{@visit_specialist}, в #{@visit_time}, до скорого.",
  		#	:to => 'example@gmail.com',
  		#	:from =>  'example@yandex.ru',
  		#	:via => :smtp,
  		#	:via_options => {
    	#		:address        		=> 'smtp.yandex.ru',
    	#		:port           		=> '25',
    	#		:user_name     		 	=> 'example@yandex.ru',
    	#		:password       		=> '12345',
    	#		:enable_starttls_auto 	=> true,
 		#	}
		#})

		#через cmd с mailsend1.19.exe
		#system ("mailsend1.19.exe -to example@gmail.com -from example@yandex.ru -ssl -port 465 -auth -smtp smtp.yandex.ru -subject \"Barbershop booking confirmed\" -M \"Уважаемый #{@visit_name}, вас будет ждать #{@visit_specialist}, в #{@visit_time}, до скорого.\" -user example@yandex.ru -pass example")

    #Запись в файл
	#f = File.open './public/clients.txt', 'a'
	#f.write "#{@visit_name}\n#{@visit_phone}\n#{@visit_time}\n#{@visit_specialist}\n#{colors[@visit_color]}"
	#f.close

	#Запись в БД
	db = SQLite3::Database.new 'Customers.sqlite'

	db.execute "INSERT INTO Customers (Name, Phone, Time, Specialist, Color) Values ('#{@visit_name}', '#{@visit_phone}', '#{@visit_time}', '#{@visit_specialist}', '#{colors[@visit_color]}')"

	db.close



    erb "Уважаемый #{@visit_name}, вас будет ждать #{@visit_specialist}, в #{@visit_time}, до скорого."
end
