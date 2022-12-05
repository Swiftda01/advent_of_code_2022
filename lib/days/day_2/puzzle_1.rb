# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day2
    class Puzzle1 < Puzzle
      # A = rock
      # B = paper
      # C = scissors

      # X = rock
      # Y = paper
      # Z = scissors

      SCORE = {
        'B Z' => 9,
        'A Y' => 8,
        'C X' => 7,
        'C Z' => 6,
        'B Y' => 5,
        'A X' => 4,
        'A Z' => 3,
        'C Y' => 2,
        'B X' => 1
      }.freeze

      def call
        puzzle_input.split(/\n/).inject(0) { |sum, round| sum + SCORE[round] }
      end
    end
  end
end
