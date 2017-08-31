=begin

p7_10001stPrime.rb

Project Euler Problem 7

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?

=end

class Problem7

  def initialize()
    # self.find_primes_up_to(50)
  end

  def isPrime?(n)
=begin
Returns true if n is prime using the "Sieve of Eranthoses"
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

  def find_primes_up_to(n)
    # Iterates through as many numbers as needed to find the first n primes

    array = Array.new
    i = 1 # @fix: Starting at one, adding 2 later, will miss the very first prime 2
    while array.count < n do
      if isPrime?(i) then array.push(i) end
      i += ((i == 1) || (i%2 == 0)) ? 1 : 2
    end
    return array
    # puts "Debug: array=#{array.inspect}"
  end
end

problem = Problem7.new()
puts "The 10001st Prime is: " + problem.find_primes_up_to(10001)[-1].to_s
