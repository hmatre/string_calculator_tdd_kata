require "rspec"
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      numbers_array = numbers.split(delimiter).map(&:to_i)
    else
      delimiters = /,|\n/
      numbers_array = numbers.split(delimiters).map(&:to_i)
    end

    negatives = numbers_array.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers_array.sum
  end
end

# TEST CASES

describe StringCalculator do

  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number itself if one number is given" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum if two numbers are given" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "returns the sum of multiple numbers" do
    expect(calculator.add("1,2,3,4,5")).to eq(15)
  end

  it "handles new lines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports different delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "raises an exception for negative numbers" do
    expect { calculator.add("1,-2,3,-4") }.to raise_error("Negative numbers not allowed: -2, -4")
  end

end