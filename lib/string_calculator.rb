class StringCalculator
    MAX_VALUE = 1000
    DEFAULT_DILIMITER = ','

    def add(numbers_in_string)
        ## Collect numbers from string
        numbers_list = get_numbers_from_string(numbers_in_string)
        if numbers_list.empty?
            return 0
        end
        return numbers_list.sum    
    end

    private
    def get_numbers_from_string(numbers)
        delimiter = DEFAULT_DILIMITER
        ## Filtering delimiters
        if numbers.start_with?("//")
            delimiter, numbers = numbers.lines(chomp: true)
            delimiter = delimiter[3]
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
