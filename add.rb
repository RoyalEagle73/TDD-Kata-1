class StringCalculator
    MAX_VALUE = 1000
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
        numbers = numbers.split(',')
        numbers.map do |i|
             i.to_i 
        end
    end
end

calculator = StringCalculator.new
puts calculator.add("") # Output: 0
puts calculator.add("1") # Output: 1
puts calculator.add("1,2,3") # Output: 6