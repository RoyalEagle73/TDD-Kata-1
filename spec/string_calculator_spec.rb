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
    end
end
