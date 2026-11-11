#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../magic"
require_relative "part_1"

# --- Part Two ---
class Part2
  def solution_from_string(input_string)
    parsed_input = parse_input(input_string)

    _, zeroes = parsed_input.reduce([50, 0]) do |(position, zeroes), rotation|
      new_position = position + rotation

      sign_change =
        if !position.zero? && (position.positive? != new_position.positive?)
          1
        else
          0
        end

      overflows = (position + rotation).abs / 100

      [new_position.modulo(100), zeroes + sign_change + overflows]
    end
    zeroes
  end

  def parse_input(input_string)
    Part1.new.parse_input(input_string)
  end

  include Magic
end
