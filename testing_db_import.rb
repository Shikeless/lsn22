require 'sqlite3'

db = SQLite3::Database.new 'Customers.sqlite'

cust = {}

db.execute "SELECT * FROM Customers" do |n1, n2, n3, n4, n5, n6|
	cust[:number] = n1
	cust[:name] = n2
	cust[:phone] = n3
	cust[:time] = n4
	cust[:specialist] = n5
	cust[:color] = n6
end

puts cust
gets