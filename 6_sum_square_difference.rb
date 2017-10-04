=begin

p6_sumSquareDifference.rb

Project Euler Problem 6

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 552 = 3025

Hence the difference between the sum of the squares of the first
ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first
one hundred natural numbers and the square of the sum.

=end

def sum_of_squares_up_to(n)
  array =*(1..n)
  return array.map {|a| a**2}.reduce(0, :+)
end

def square_of_sums_up_to(n)
  array =*(1..n)
  return array.reduce(0, :+)**2
end

puts square_of_sums_up_to(10) - sum_of_squares_up_to(10)
puts square_of_sums_up_to(100) - sum_of_squares_up_to(100)
