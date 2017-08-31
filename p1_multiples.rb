=begin

Project Euler

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of
3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

=end


def findMultiplesBelow(n)
  sum = 0
  (3...n).each do |x|
    if (x % 3 == 0) or (x % 5 == 0)
      sum += x
    end
  end
  return sum
end

firstValue  = 10
secondValue = 1000

puts "Multiples below #{firstValue} sum up to #{findMultiplesBelow(firstValue)}"
puts "Multiples below #{secondValue} sum up to #{findMultiplesBelow(secondValue)}"
