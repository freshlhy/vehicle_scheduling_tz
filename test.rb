#encoding: utf-8
require 'date'



# puts Date.today-(365*rand())


# dt = Date.new(2012,1,1)+(545*rand())
# bt = dt + rand(1..5)

# kdays = rand(0..5)   
# bt = Date.today + kdays
# dt = bt - rand(kdays..(kdays + 5))
# puts dt
# puts bt

# (1..17).each do |k|
# 	puts Date.new(2012,1,1)+(545*rand())
# end
# type = "aadd"
# puts type.eql?("add")



# (1..10).each 

# puts bt.mjd - dt.mjd

# puts Date.today.mjd - Date.new(2013,1,1).mjd

# puts ((Date.today.mjd - Date.new(2013,1,1).mjd)/365.0).round(1)
# puts ((Date.today.mjd - Date.new(2013,1,1).mjd)/365.0)


# puts Date.new(2013,11,8).mjd - Date.new(2013,11,1).mjd

# puts (12/67.to_f).round(1)

arrs = ["月度", "季度", "年度"]
(1..20).each do |k|
	arr = arrs.shuffle.first
	d = Date.new(2012,1,1) + 365*rand()
	t = d
	while true
		if arr.eql?("月度")
			n = t + 30
		elsif arr.eql?("季度")
			n = t + 90
		else
			n = t + 360
		end
		p = t
		t = n 
		break if n.mjd > Date.today.mjd 
	end

	puts arr + "\t" + d.to_s + "\t" + p.to_s + "\t" + n.to_s
 
end

# puts rand(20..30)

# (1..20).each do |item|
# 	puts "#{item} : + #{rand(20..30)}"
# end

# puts 2.3465.round

# puts 2.3465.round(1)

# arr = [ 21, 1,34,112, 212 ]
# len = arr.length

# arr[1..(arr.length-1)].each do |i|
# 	puts i
# end

# puts 1<2? "1<2":"1>2" 

# puts 1>2? "1<2":"1>2" 

# arr = ["w", "c"]

# a = arr.clone

# a[1] = "111"

# arr = []

# arr.each do |a|
#   puts a
# end
# puts a



# def mileage_is_integer?(mileage)
#   if !is_integer(mileage)
#     puts '里程需为整数'
#   end
# end

# def is_integer(str)
#   true if Integer(str) rescue false
# end

# # mileage_is_integer?("qqq")

# mileage_is_integer?(12)

# puts Date.today.mjd - Date.new(2013,11,7).mjd + 1
# (1..17).each do |n|
# 	d = Date.new(2012,1,1) + (365*1.5*rand())
# 	puts d + "\t" + (d+)
# end

# def datapath filename
#   File.expand_path(File.join(File.dirname(__FILE__), filename))
# end

# file = File.open(datapath("./workers.txt"), "r:UTF-8")
# groupname_holder = ""
# group = nil
# file.each_line do |line|
#   # worker = Worker.new
#   (groupname, username) = line.split
#   # puts groupname + "  " + username
#   if not groupname.eql?(groupname_holder)
#     # group = Group.create!(name: groupname)
#     groupname_holder = groupname
#     puts groupname_holder
#   end

# (1..17).each do |n|
# 	puts 4 + rand(0..8)
# end
  
  # Worker.create!(name: username, password: "000000", password_confirmation:"000000", group_id: group.id)
# end


# i = 3

# i += (6 - 1)

# puts i

