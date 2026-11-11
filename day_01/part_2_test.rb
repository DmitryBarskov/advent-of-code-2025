# frozen_string_literal: true

require_relative "part_2"

# --- Day 1: Secret Entrance ---
# --- Part Two ---
class Part1Test < Minitest::Test
  def setup
    @input = <<~INPUT
      L68
      L30
      R48
      L5
      R60
      L55
      L1
      L99
      R14
      L82
    INPUT
  end

  def test_from_string
    assert_equal 6, Part2.new.solution_from_string(@input)
  end

  def test_single_rotation
    assert_equal 10, Part2.new.solution_from_string("R1000")
  end
end
