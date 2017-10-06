=begin

19_counting_sundays.rb

Project Euler Problem 19

Copyright 2017 Thomas Johannesmeyer

Licensed under the "THE BEER-WARE LICENSE" (Revision 42):
Thomas Johannesmeyer wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer or coffee in return

You are given the following information, but you may prefer to do some research for yourself.

- 1 Jan 1900 was a Monday.
- Thirty days has September,
April, June and November.
All the rest have thirty-one,
Saving February alone,
Which has twenty-eight, rain or shine.
And on leap years, twenty-nine.
- A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

=end

$months_dict = {1 => "January",
               2 => "February",
               3 => "March",
               4 => "April",
               5 => "May",
               6 => "June",
               7 => "July",
               8 => "August",
               9 => "September",
               10 => "October",
               11 => "November",
               12 => "December"}


def is_leap_wrong_assumption?(year)
  return ((year % 4 == 0) && (year % 400 != 0)) # This is what the problem states
end

def is_leap?(year)
  return ((year % 4 == 0) && !((year % 100 == 0)) && (year % 400 != 0)) # This is reality
end

##
# Returns an array containing 12 numbers. Each array index corresponds to a month
def indexes_of_firsts(year)
  indexes = [0] # First of January is the first day of the year

  (1..12).each do |month|
    case month
    when 1
      # February's first is at index:
      indexes.push(indexes.last + 31)
    when 2
      # March's first is at index:
      indexes.push(indexes.last + (is_leap?(year) ? 29 : 28))
    when 3
      # April's first is at index:
      indexes.push(indexes.last + 31)
    when 4
      # May's first is at index:
      indexes.push(indexes.last + 30)
    when 5
      # June's first is at index:
      indexes.push(indexes.last + 31)
    when 6
      # Juli's first is at index:
      indexes.push(indexes.last + 30)
    when 7
      # August's first is at index:
      indexes.push(indexes.last + 31)
    when 8
      # September's first is at index:
      indexes.push(indexes.last + 31)
    when 9
      # October's first is at index:
      indexes.push(indexes.last + 30)
    when 10
      # November's first is at index:
      indexes.push(indexes.last + 31)
    when 11
      # December's first is at index:
      indexes.push(indexes.last + 30)
    end
  end
  return indexes
end

def find_sundays_until_year(final_year)
  sumdays = 0 # See what I did there? :P
  year = 1900
  sunday_offset = 6 # First Sunday appears 6 days into the year 1900

  while year <= final_year do
    number_of_days = is_leap?(year) ? 366 : 365

    puts "===================="
    puts "Year: #{year} has #{number_of_days} days"
    puts "Sunday Offset: #{sunday_offset}"

    indexes = indexes_of_firsts(year)
    count = 1
    indexes.each do |first|
      if ((first - sunday_offset) % 7 == 0) then
        sumdays += 1
        puts $months_dict[count]
      end
      count += 1
    end
    year += 1
    sunday_offset = (7 + (sunday_offset + 52*7 - number_of_days)) % 7
  end
  return sumdays
end


puts "Total number of Sundays on firsts of a month between 1900-2000: #{find_sundays_until_year(2000)}"
puts "Since this problem asks for Sundays in between 1901 and 2000, subtract 2.\nI consider this problem solved."
