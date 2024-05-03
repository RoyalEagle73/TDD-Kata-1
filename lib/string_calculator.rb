# frozen_string_literal: true

# A class to calculate sum of numbers from a given string.
class StringCalculator
  MAX_VALUE = 1000
  DEFAULT_DILIMITER = ','

  # Returns a sum of the numbers in a given string.
  #
  # If the string is empty, returns 0.
  #
  # An RuntimeError is raised if the string contains one or more negative number
  #
  # Ignores numbers above 1000 in string
  #
  # @param [String<numbers_in_string>] A string containing numbers with delimiters.
  #
  # @raise [ArgumentError] If the string contains one or more negative numbers.
  #
  # @return [Int] Returns the sum of numbers in string
  def add(numbers_in_string)
    ## Returns 0 if input string is empty
    return 0 if numbers_in_string.empty?

    ## Collect numbers from string
    numbers_list = get_numbers_from_string(numbers_in_string)

    ## Check for negative numbers and raise error
    negatives = numbers_list.select(&:negative?).map(&:to_s)
    raise ArgumentError, "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

    ## Ignoring numbers above 1000
    numbers_list = numbers_list.select { |num| num <= MAX_VALUE }

    numbers_list.sum
  end

  private

  # Helper method to get numbers from a string
  def get_numbers_from_string(numbers)
    delimiter = DEFAULT_DILIMITER

    ## Filtering delimiter
    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.lines(chomp: true)
      delimiter = delimiter_line.split('//', 2)[1].split(/\[|\]/)[1]
    end

    ## Remove newlines from string
    numbers.gsub("\n", '')

    ## Splitting numbers according to delimiter
    numbers = numbers.split(delimiter)

    ## Returning numbers as list
    numbers.map(&:to_i)
  end
end
