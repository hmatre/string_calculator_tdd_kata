require "rspec"
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.split(",").map(&:to_i).sum
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

end