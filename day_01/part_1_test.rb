# frozen_string_literal: true

require_relative "part_1"

# --- Day 1: Secret Entrance ---
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
    assert_equal 3, Part1.new.solution_from_string(@input)
  end
end
