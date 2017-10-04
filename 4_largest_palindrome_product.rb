=begin

p4_largestPalindromeProduct.rb

Project Euler Problem 4

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return


Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

=end

class Fixnum
=begin
Extension of Fixnum class so that we can easily depict digit count.
=end

  def digit_count()
    if (self > 0) then
      Math.log10(self).to_i + 1
    end
  end
end


def isPalindrome?(n)
=begin
Returns Boolean if n is a palindrome. n will be converted to string.

Assuming that odd numbered inputs are a palindrome as long as they are mirrored / symmetrical
=end

  string_n = "#{n}" # Casting input to string so that we can apply string operations without extending fixnum class
  length   = string_n.length

  for index in (0..(length/2).floor)
    if (string_n[index] != string_n[length - 1 - index])
      return false
    end
  end
  return true
end


def find_Largest_Palindrome_Product_For_Digit_Count(n)
=begin
Since we are searching for the highest number, we will improve our search by
walking down backwards and stepwise. Therefore we set up an upper- / lower-bound and
iterate through the products.
=end

  if (n <= 1) then
    puts "Too little digits. Aborting..."
    return
  end

  upper_bound = 10**n - 1
  offset      = upper_bound / 10 # @Hardcoded: 10 is picked arbitrarily. We may be able to optimise by finetuning
  lower_bound = upper_bound - offset

  while (lower_bound >= 0) do
    for number_a in (upper_bound).downto(lower_bound)
      if (number_a == 0) or (number_a.digit_count != n) then break end # Remove numbers with less than n digits

      for number_b in (upper_bound).downto(lower_bound)
        if (number_b == 0) or (number_b.digit_count != n) then break end# Remove numbers with less than n digits

        product_ab = number_a * number_b
        if (isPalindrome?(product_ab))
          puts "#{number_a} x #{number_b} = #{product_ab}"
          return # Stop search right now
        end
      end
    end
    # Step down bounds
    upper_bound -= offset
    lower_bound -= offset
  end
end

# puts isPalindrome?("otto")
# puts isPalindrome?("otito")
# puts isPalindrome?(1221)
#
find_Largest_Palindrome_Product_For_Digit_Count(2)

