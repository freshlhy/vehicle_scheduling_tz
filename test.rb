#encoding: utf-8
require 'date'



puts Date.today-(365*rand())

puts Date.new(2012,1,1)+(365*rand())


# puts rand(20..30)

(1..20).each do |item|
	puts "#{item} : + #{rand(20..30)}"
end