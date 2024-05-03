# frozen_string_literal: true

require 'string_calculator'

describe 'String Calculator' do
  ## Defining string calculator class
  let(:string_calculator) { StringCalculator.new }

  describe '.add' do
    context 'Without delimiters' do
      context 'inputs an empty string' do
        it 'returns zero' do
          expect(string_calculator.add('')).to eql(0)
        end
      end
      context 'inputs a string with single number' do
        it 'returns 5' do
          expect(string_calculator.add('5')).to eql(5)
        end
      end
      context 'inputs a string with 3 numbers' do
        it 'returns 10' do
          expect(string_calculator.add('5,3,2')).to eql(10)
        end
      end
    end

    context 'With delimiters' do
      context 'inputs a string with numbers and new line' do
        it 'returns 10' do
          expect(string_calculator.add("5,3\n,2")).to eql(10)
        end
      end
      context 'inputs a string with ; as delimiter' do
        it 'returns 10' do
          expect(string_calculator.add("//[;]\n5;3;2")).to eql(10)
        end
      end
      context 'inputs a string with multiple delimiters' do
        it 'returns 10' do
          expect(string_calculator.add("//[+++]\n5+++3+++2")).to eql(10)
        end
      end
    end

    context 'With negative numbers' do
      context 'inputs a string with negative number' do
        it 'raises an error' do
          expect do
            string_calculator.add('1,2,-3')
          end.to raise_error(ArgumentError, 'negative numbers not allowed -3')
        end
      end
      context 'inputs a string with multiple negative numbers' do
        it 'raises an error with multiple negative numbers in output' do
          expect do
            string_calculator.add('1,2,-3,-5')
          end.to raise_error(ArgumentError, 'negative numbers not allowed -3, -5')
        end
      end
    end

    context 'With numbers greater than 1000' do
      context 'inputs a string with numbers greater than 1000' do
        it 'ignores the larger number and returns 2' do
          expect(string_calculator.add('2,1002')).to eql(2)
        end
      end
    end
  end
end
