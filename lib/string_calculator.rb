# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.strip.empty?

    input.split(",").map(&:to_i).reduce(0) { |sum, number| sum + number }
  end  
end