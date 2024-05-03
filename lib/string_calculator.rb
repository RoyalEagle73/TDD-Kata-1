# frozen_string_literal: true

# A class to calculate sum of numbers from a given string.
class StringCalculator
  MAX_ALLOWED_NUMBER = 1000
  DEFAULT_DILIMITER = ','

  # Returns a sum of the numbers in a given string.
  #
  # If the string is empty, returns 0.
  #
  # An RuntimeError is raised if the string contains one or more negative number
  #
  # Ignores numbers above 1000 in string
  #
  # @param [String<input_string>] A string containing numbers with delimiters.
  #
  # @raise [ArgumentError] If the string contains one or more negative numbers.
  #
  # @return [Int] Returns the sum of numbers in string
  def add(input_string)
    ## Returns 0 if input string is empty
    return 0 if input_string.empty?

    ## Collect numbers from string
    extracted_numbers = get_numbers_from_string(input_string)

    ## Check for negative numbers and raise error
    negative_numbers = extracted_numbers.select(&:negative?).map(&:to_s)
    raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    ## Ignoring numbers above 1000
    extracted_numbers = extracted_numbers.select { |num| num <= MAX_ALLOWED_NUMBER }

    extracted_numbers.sum
  end

  private

  # Helper method to get numbers from a string
  def get_numbers_from_string(input_string)
    delimiter = DEFAULT_DILIMITER

    ## Filtering delimiter
    if input_string.start_with?('//')
      delimiter_line, input_string = input_string.lines(chomp: true)
      delimiter = delimiter_line.split('//', 2)[1].split(/\[|\]/)[1]
    end

    ## Remove newlines from string
    input_string.gsub("\n", '')

    ## Splitting numbers according to delimiter
    numbers = input_string.split(delimiter)

    ## Returning numbers as list
    numbers.map(&:to_i)
  end
end
