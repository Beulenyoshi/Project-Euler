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
For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=end

require 'Progress_Bar'


def isTriplet?(tuple)
  if tuple.count < 3 then return false end
  (tuple[0]**2 + tuple[1]**2) == tuple[2]**2
end

def generate_triplets()
  puts "Progress bar represents worst case time:"
  bar = ProgressBar.new()

  # Since a < b < c the three loops start above the index of the outer loop
  (1..998).each do |a|
    if (a % 10 == 0) then
      bar.increment!
    end
    ((a + 1)..999).each do |b|

      # The following logic helps us sorting out every second element.
      # Goal is to find a triplet which sums up to 1000.
      # If the sum of the first two numbers is odd no even number will be valid and vice versa

      start_index = b + 1
      if (a + b).even? then
        start_index = start_index.even? ? start_index : start_index + 1
      elsif
        start_index = start_index.even? ? start_index + 1 : start_index
      end

      (start_index..1000).step(2) do |c|
        if (isTriplet?([a,b,c])) then
          if (a+b+c == 1000) then
            return [a,b,c]
          end
        end
      end
    end
  end
end


# puts isTriplet?([3,4,5])
puts generate_triplets()
