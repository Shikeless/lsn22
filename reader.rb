# encoding: cp866
x = File.open './public/clients.txt', 'r:UTF-8'
@xx = []
loop do
	@aa = []
	4.times do
		@line = x.gets
		break if @line == nil
		if @line != nil 
			@line = @line.chomp
			@aa << @line
		end
	end
	break if @line == nil
	@xx << @aa
end
x.close

f = File.open './views/tablet.erb', 'w'
f.write "<table class=\"table table-dark\">\n" 
f.write	"\t<thead>\n"
f.write "\t\t<tr>\n"
f.write "\t\t\t<th scope=\"col\">No</th>\n"
f.write "\t\t\t<th scope=\"col\">Name</th>\n"
f.write "\t\t\t<th scope=\"col\">Time</th>\n"
f.write	"\t\t\t<th scope=\"col\">Phone</th>\n"
f.write "\t\t\t<th scope=\"col\">Specialist</th>\n"
f.write "\t\t</tr>\n"
f.write "\t</thead>\n"
f.write "\t<tbody>\n"
n = 1
@xx.each do |i|	
	f.write "\t\t<tr>\n"
	f.write "\t\t\t<th scope=\"row\">#{n}</th>\n"
	f.write "\t\t\t<td>#{i[0]}</td>\n"
        f.write "\t\t\t<td>#{i[1]}</td>\n"
	f.write "\t\t\t<td>#{i[2]}</td>\n"
	f.write "\t\t\t<td>#{i[3]}</td>\n"
	f.write "\t\t</tr>\n"
	n += 1
end
f.write "\t</tbody>\n"
f.write "</table>\n"
f.close
gets


	
