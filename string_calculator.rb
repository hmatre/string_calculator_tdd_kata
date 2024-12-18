require "rspec"
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
  end
end

# TEST CASES

describe StringCalculator do

  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

end