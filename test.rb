#encoding: utf-8
require 'date'



# puts Date.today-(365*rand())


# dt = Date.new(2012,1,1)+(365*rand())
# bt = dt + rand(1..5)

# kdays = rand(0..5)   
# bt = Date.today + kdays
# dt = bt - rand(kdays..(kdays + 5))
# puts dt
# puts bt


# (1..10).each 

# puts bt.mjd - dt.mjd

# puts Date.today.mjd - Date.new(2013,1,1).mjd

puts ((Date.today.mjd - Date.new(2013,1,1).mjd)/365.0).round(1)
puts ((Date.today.mjd - Date.new(2013,1,1).mjd)/365.0)


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