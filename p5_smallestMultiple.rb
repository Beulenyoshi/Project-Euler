=begin
Thomas Johannesmeyer 2017

Project Euler

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
