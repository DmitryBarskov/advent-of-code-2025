#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../magic"

# --- Day 1: Secret Entrance ---
class Part1
  def solution_from_string(input_string)
    parsed_input = parse_input(input_string)

    _, zeroes = parsed_input.reduce([50, 0]) do |(position, zeroes), rotation|
      new_position = (position + rotation).modulo(100)
      [new_position, zeroes + (new_position.zero? ? 1 : 0)]
    end
    zeroes
  end

  def parse_input(input_string)
    input_string
      .lines
      .map(&:chomp)
      .map do |rotation|
        if rotation.start_with?("L")
          -rotation.delete_prefix("L").to_i
        elsif rotation.start_with?("R")
          rotation.delete_prefix("R").to_i
        end
      end
  end

  include Magic
end
