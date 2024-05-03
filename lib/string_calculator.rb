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
    # @param [String<numbers_in_string>] A string containing numbers with delimiters.
    #
    # @raise [RuntimeError] If the string contains one or more negative numbers.
    #
    # @return [Int] Returns the sum of numbers in string
    def add(numbers_in_string)
        ## Collect numbers from string
        numbers_list = get_numbers_from_string(numbers_in_string)

        ## Return 0 if there are no numbers
        return 0 unless !numbers_list.empty?

        # Check for negative numbers and raise error
        negatives = numbers_list.select { |num| num < 0 }.map(&:to_s)
        raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?

        return numbers_list.sum    
    end

    private

    # Helper method to get numbers from a string
    def get_numbers_from_string(numbers)
        delimiter = DEFAULT_DILIMITER

        ## Filtering delimiter
        if numbers.start_with?("//")
            delimiter_line, numbers = numbers.lines(chomp: true)
            delimiter = delimiter_line.split("//", 2)[1].split(/\[|\]/)[1]
        end

        ## Remove newlines from string
        numbers.gsub("\n", "")

        ## Splitting numbers according to delimiter
        numbers = numbers.split(delimiter)

        ## Returning numbers as list
        numbers.map do |i|
             i.to_i 
        end
    end
end
