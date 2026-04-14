# When done, submit this entire file to the autograder.

# Part 1

# Takes an array of integers and returns their sum
# Returns 0 for an empty array
def sum arr
  total = 0
  arr.each do |num|
    total += num
  end
  total
end

# Returns the sum of the two largest elements in the array
def max_2_sum arr
  if arr.empty?
    return 0
  elsif arr.length == 1
    return arr[0]
  end

  # sort and grab the last two (biggest) elements
  sorted = arr.sort
  sorted[-1] + sorted[-2]
end

# Returns true if any two distinct elements in the array sum to n
def sum_to_n? arr, n
  return false if arr.length < 2

  # check every pair of elements
  arr.each_with_index do |val1, i|
    arr.each_with_index do |val2, j|
      if i < j && val1 + val2 == n
        return true
      end
    end
  end

  false
end

# Part 2

# Returns a greeting string with the given name
def hello(name)
  "Hello, #{name}"
end

# Returns true if the string starts with a consonant (not a vowel, and must be a letter)
def starts_with_consonant? s
  return false if s.empty?

  first_char = s[0].downcase
  # check that it's a letter and not a vowel
  first_char =~ /[a-z]/ && !('aeiou'.include?(first_char))
end

# Returns true if the string represents a valid binary number that is a multiple of 4
def binary_multiple_of_4? s
  # can't be empty
  if s.empty?
    return false
  end

  # check that every character is either '0' or '1'
  s.each_char do |c|
    if c != '0' && c != '1'
      return false
    end
  end

  # convert the binary string to a base-10 number
  number = s.to_i(2)

  # check if it's divisible by 4
  if number % 4 == 0
    return true
  else
    return false
  end
end

# Part 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    # isbn can't be empty, price must be positive
    if isbn.empty?
      raise ArgumentError, "ISBN can't be empty"
    end
    if price <= 0
      raise ArgumentError, "Price must be greater than zero"
    end

    @isbn = isbn
    @price = price
  end

  # formats the price as a dollar string like "$33.95"
  def price_as_string
    format("$%.2f", price)
  end
end
