# encoding: cp866

			#fill tablet from public/Customers.txt
#def rewrite_tablet
#x = File.open './public/clients.txt', 'r:UTF-8'
#@xx = []
#loop do
#	@aa = []
#	5.times do
#		@line = x.gets
#		break if @line == nil
#		if @line != nil 
#			@line = @line.chomp
#			@aa << @line
#		end
#	end
#	break if @line == nil
#	@xx << @aa
#end
#x.close

#f = File.open './views/tablet.erb', 'w'
#f.write "<table class=\"table table-dark\">\n" 
#f.write	"\t<thead>\n"
#f.write "\t\t<tr>\n"
#f.write "\t\t\t<th scope=\"col\">No</th>\n"
#f.write "\t\t\t<th scope=\"col\">Name</th>\n"
#f.write "\t\t\t<th scope=\"col\">Time</th>\n"
#f.write	"\t\t\t<th scope=\"col\">Phone</th>\n"
#f.write "\t\t\t<th scope=\"col\">Specialist</th>\n"
#f.write "\t\t\t<th scope=\"col\">Color</th>\n"
#f.write "\t\t</tr>\n"
#f.write "\t</thead>\n"
#f.write "\t<tbody>\n"
#n = 1
#@xx.each do |i|	
#	f.write "\t\t<tr>\n"
#	f.write "\t\t\t<th scope=\"row\">#{n}</th>\n"
#	f.write "\t\t\t<td>#{i[0]}</td>\n"
#   f.write "\t\t\t<td>#{i[1]}</td>\n"
#	f.write "\t\t\t<td>#{i[2]}</td>\n"
#	f.write "\t\t\t<td>#{i[3]}</td>\n"
#	f.write "\t\t\t<td>#{i[4]}</td>\n"
#	f.write "\t\t</tr>\n"
#	n += 1
#end
#f.write "\t</tbody>\n"
#f.write "</table>\n"
#f.close
#end
#rewrite_tablet



			#fill tablet with dp
def rewrite_tablet

	db = SQLite3::Database.new 'Customers.sqlite'

	@f = File.open './views/tablet.erb', 'w'
	@f.write "<table class=\"table table-dark\">\n" 
	@f.write	"\t<thead>\n"
	@f.write "\t\t<tr>\n"
	@f.write "\t\t\t<th scope=\"col\">No</th>\n"
	@f.write "\t\t\t<th scope=\"col\">Name</th>\n"
	@f.write "\t\t\t<th scope=\"col\">Time</th>\n"
	@f.write "\t\t\t<th scope=\"col\">Phone</th>\n"
	@f.write "\t\t\t<th scope=\"col\">Specialist</th>\n"
	@f.write "\t\t\t<th scope=\"col\">Color</th>\n"
	@f.write "\t\t</tr>\n"
	@f.write "\t</thead>\n"
	@f.write "\t<tbody>\n"


	db.execute "SELECT * FROM Customers" do |n1, n2, n3, n4, n5, n6|
		@f.write "\t\t<tr>\n"
		@f.write "\t\t\t<th scope=\"row\">#{n1}</th>\n"
		@f.write "\t\t\t<td>#{n2}</td>\n"
	    @f.write "\t\t\t<td>#{n3}</td>\n"
		@f.write "\t\t\t<td>#{n4}</td>\n"
		@f.write "\t\t\t<td>#{n5}</td>\n"
		@f.write "\t\t\t<td>#{n6}</td>\n"
		@f.write "\t\t</tr>\n"
	end

	db.close

	@f.write "\t</tbody>\n"
	@f.write "</table>\n"

	@f.close

end

rewrite_tablet

	
#$f.write "\t\t<tr>\n"
#		$f.write "\t\t\t<th scope=\"row\">#{n1}</th>\n"
#		$f.write "\t\t\t<td>#{n2}</td>\n"
#	    $f.write "\t\t\t<td>#{n3}</td>\n"
#		$f.write "\t\t\t<td>#{n4}</td>\n"
#		$f.write "\t\t\t<td>#{n5}</td>\n"
#		$f.write "\t\t\t<td>#{n6}</td>\n"
#		$f.write "\t\t</tr>\n"