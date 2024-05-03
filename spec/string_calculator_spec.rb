require 'string_calculator'

describe "String Calculator" do
    ## Defining string calculator class
    let(:string_calculator) do
        StringCalculator.new
    end

    describe ".add" do
        context "inputs an empty string" do
            it "returns zero" do
                expect(string_calculator.add("")).to eql(0)
            end
        end
        context "inputs a string with single number" do
            it "returns 5" do
                expect(string_calculator.add("5")).to eql(5)
            end
        end
        context "inputs a string with 3 numbers" do
            it "returns 10" do
                expect(string_calculator.add("5,3,2")).to eql(10)
            end
        end
        context "inputs a string with numbers and new line" do
            it "returns 10" do
                expect(string_calculator.add("5,3\n,2")).to eql(10)
            end
        end
        context "inputs a string with ; as delimiter" do
            it "returns 10" do
                expect(string_calculator.add("//[;]\n5;3;2")).to eql(10)
            end
        end
        context "inputs a string with negative number" do
            it "raises an error" do
                # expect(string_calculator.add("1,2,-3")).to eql(10)
                expect{ string_calculator.add("1,2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed -3") 
            end
        end
        context "inputs a string with multiple negative numbers" do
            it "raises an error with multiple negative numbers in output" do
                expect{ string_calculator.add("1,2,-3,-5") }.to raise_error(RuntimeError, "negative numbers not allowed -3, -5") 
            end
        end
    end
end
