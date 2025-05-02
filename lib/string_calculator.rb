# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.strip.empty?

    delimiters = [",", "\n"]

    if input.start_with?("//")
      delimiter_line, input = input.split("\n", 2)
      
      # Handle multi-character delimiters inside square brackets
      if delimiter_line.include?("[")
        custom_delimiters = delimiter_line.scan(/\[([^\]]+)\]/).flatten
        delimiters.concat(custom_delimiters)
      else
        # Single-character delimiter (e.g., //; or //, etc.)
        custom_delimiter = delimiter_line[2]
        delimiters = [custom_delimiter]
      end
    end

    numbers = input.split(Regexp.union(delimiters)).map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise "Negatives not allowed: #{negatives.join(', ')}"
    end

    numbers.reject { |n| n > 1000 }.reduce(0, :+)
  end
end
