=begin

p9_pythagorean_triplet.rb

Project Euler Problem 9

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=end

def isTriplet?(tuple)
  if tuple.count < 3 then return false end
  (tuple[0]**2 + tuple[1]**2) == tuple[2]**2
end

puts isTriplet?([3,4,5])
