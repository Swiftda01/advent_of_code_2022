# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day1
    class Puzzle2 < Puzzle
      def call
        puzzle_input.split(/\n\n/).map { |calories| calories.split.map(&:to_i).sum }
                    .max(3).sum
      end
    end
  end
end
