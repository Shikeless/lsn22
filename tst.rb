require 'sqlite3'

db = SQLite3::Database.new 'Customers.sqlite'
barbers = ['Пьер', 'Жан', 'Лепоольд', 'Мустафа', 'Геннадий']
@aa = []   
db.execute 'SELECT Name FROM Barbers' do |row|
	row = row.to_s.delete("[\"")
	row = row.delete("]")
	@aa << row 
end

barbers.each do |bar|
	if @aa.include?(bar) == false
		db.execute 'INSERT INTO Barbers (Name) VALUES (?)', [bar]
	end
end
gets