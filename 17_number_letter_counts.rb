=begin

p17_number_letter_counts.rb

Project Euler Problem 17

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19
letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and
115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance
with British usage.
=end

##
# We add a key for 0 because we do not want it to return nil
# We do not add "Zero" because it is never used
$digit_dict = {0 => "",
               1 => "One",
               2 => "Two",
               3 => "Three",
               4 => "Four",
               5 => "Five",
               6 => "Six",
               7 => "Seven",
               8 => "Eight",
               9 => "Nine"}


def two_digit_string_from_number(n)
  ##
  # Converts a two digit number into a string

  d = n/10
  s = n%10

  result_string = ""

  ##
  # Catching obvious edge cases
  case n
  when 10
    result_string.concat("Ten")

  when 11
    result_string.concat("Eleven")

  when 12
    result_string.concat("Twelve")

  when 13
    result_string.concat("Thirteen")

  else
    if (d == 1) then
      ##
      # 1x > x-teen
      result_string.concat("#{$digit_dict[s]}teen")
    else
      if (d == 2) then
        ##
        # 2x > Twenty-x
        result_string.concat("Twenty")
      elsif (d == 3) then
        result_string.concat("Thirty")
      else
        result_string.concat("#{$digit_dict[d]}ty")
      end
      result_string.concat($digit_dict[s].downcase)
    end
  end
  return result_string
end

def string_for_number(n)
  ##
  # Converts numbers from 1 to 9999 into a string
  temp_n = n
  result_string = ""

  k = temp_n/1000
  temp_n -= 1000*k
  h = temp_n/100
  temp_n -= 100*h
  d = temp_n/10
  temp_n -= 10*d
  s = temp_n%10

  # puts "#{k} #{h} #{d} #{s}"

  if (h != 0) then
    result_string.concat("#{$digit_dict[h]} Hundred and ")
  end

  if (d != 0) then
    result_string.concat("#{two_digit_string_from_number(10*d + s)}")
  else
    result_string.concat("#{$digit_dict[s]}")
  end
  result_string.gsub!(/vet/, "ft")
  return result_string.gsub(/tty/,"ty")
end


def sum_string_length_up_to(n)
  sum = 0
  (1..n).each do |number|
    sum += string_for_number(number).gsub(" ","").length
  end
  return sum
end

puts sum_string_length_up_to(1000)



def sum_string_length_up_to(n)
  sum = 0
  (1..n).each do |number|
    sum += string_for_number(number).gsub(" ","").length
  end
  return sum
end

# (0..10).each do |x|
#   print_random_number()
# end
# puts "#{120} = #{string_for_number(120)}"
# puts "#{121} = #{string_for_number(121)}"

