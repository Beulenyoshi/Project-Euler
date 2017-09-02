=begin

p8_largest_product.rb

Project Euler Problem 8

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

(Data is imported from ./data/problem_8.csv)

Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?

=end

require 'CSV'
require 'Progress_Bar'

PATH_CONST = "./data/problem_8.csv"


def parse_csv_at_path(path)
=begin
Parses the file at provided path and returns it as a 2 dimensional array.
=end
  CSV.read(path)
end

def largest_product(number, digits)
=begin
Takes a number and a number of digits and return the largest_product
=end

  n_string        = number.to_s
  length          = n_string.length

  if length < digits then return 0 end

  largest_product = 1

  bar = ProgressBar.new(length - digits)

  (0..(length - digits)).each do |start_index|
    temp_product = 1
    (0..digits - 1).each do |running_index|
      temp_product *= n_string[start_index + running_index].to_i
    end
    largest_product = [largest_product, temp_product].max
    bar.increment!
  end
  largest_product
end

data = parse_csv_at_path(PATH_CONST)
number = data.join.to_i
puts largest_product(number, 4)
puts largest_product(number, 13)

