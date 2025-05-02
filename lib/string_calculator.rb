# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.strip.empty?

    input.strip.to_i
  end  
end