=begin

Thomas Johannesmeyer

Project Euler Problem 6

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 552 = 3025

Hence the difference between the sum of the squares of the first
ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first
one hundred natural numbers and the square of the sum.

=end

def sumOfSquaresUpTo(n)
  array =*(1..n)
  return array.map { |a| a**2}.reduce(0, :+)
end

def squareOfSumsUpTo(n)
  array =*(1..n)
  return array.reduce(0, :+)**2
end

puts squareOfSumsUpTo(10) - sumOfSquaresUpTo(10)
puts squareOfSumsUpTo(100) - sumOfSquaresUpTo(100)
