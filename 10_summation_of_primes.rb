=begin

p10_summationOfPrimes.rb

Thomas Johannesmeyer 2017

Project Euler Problem 10


The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

=end

require 'Progress_Bar'

def is_prime?(n)
=begin
Returns true if n is prime.
=end
  if (n <= 1) then return false                         # Filter numbers below 1
  elsif(n <= 3) then return true                        # 2,3 are prime
  elsif((n % 2 == 0) or (n % 3 == 0)) then return false # filtering even numbers and those divisable by 3
  end

  # Filtering the rest up to sqrt(n)
  i = 5
  while (i*i <= n) do
    if ((n % i == 0) or (n % (i + 2) == 0)) then return false end
    i += 6
  end
  return true
end

def sum_primes_below(n)
  bar = ProgressBar.new(n/2)
  sum = 2
  bar.increment!
  (3..n).step(2) do |i|
    bar.increment!
    if is_prime?(i) then
      sum += i
    end
  end
  sum
end


puts sum_primes_below(10)
puts sum_primes_below(2000000)

