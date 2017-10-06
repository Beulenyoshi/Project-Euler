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


year = 1900

def is_leap?(year)
  return ((year%4 == 0) && (year % 400 != 0))
end


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

puts indexes_of_firsts(year)
