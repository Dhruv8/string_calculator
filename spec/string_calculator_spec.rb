require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calc.add("")).to eq(0)
  end

  it "returns the number itself for a single number" do
    expect(calc.add("4")).to eq(4)
  end

  it "returns the sum of two comma-separated numbers" do
    expect(calc.add("1,2")).to eq(3)
  end

  it "handles multiple numbers" do
    expect(calc.add("1,2,3,4")).to eq(10)
  end

  it "supports newline as a delimiter" do
    expect(calc.add("1\n2,3")).to eq(6)
  end
  
  it "supports custom single-character delimiter" do
    expect(calc.add("//;\n1;2")).to eq(3)
  end

  it "raises an exception for negative numbers" do
    expect { calc.add("1,-2,-3") }.to raise_error("Negatives not allowed: -2, -3")
  end
end
