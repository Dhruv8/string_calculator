# frozen_string_literal: true

class StringCalculator
  def add(input)
    return 0 if input.strip.empty?

    delimiters = [",", "\n"]

    if input.start_with?("//")
      delimiter_line, input = input.split("\n", 2)
      custom_delimiter = delimiter_line[2] # assumes single-character delimiter
      delimiters = [custom_delimiter]
    end

    input.split(Regexp.union(delimiters)).map(&:to_i).reduce(0, :+)
  end
end