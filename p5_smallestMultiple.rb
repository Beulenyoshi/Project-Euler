=begin

p5_smallestMultiple.rb

Project Euler Problem 5

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


Smallest Multiple

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=end



number = 2520
# The answer is going to be: 232792560

while true do # The loop _will_ terminate via break statements. Could also provide an upper threshold do
  didHold = true
  for divisor in (10..20) do # We can reduce runtime by skipping lower factors which are automatically true
    if (number % divisor != 0) then
      didHold = false
      break
    end
  end
  if didHold then
    puts "The answer is: #{number}"
    break
  end
  number += 1
end
