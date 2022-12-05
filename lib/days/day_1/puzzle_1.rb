# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day1
    class Puzzle1 < Puzzle
      def call
        puzzle_input.split(/\n\n/).map { |calories| calories.split.map(&:to_i).sum }
                    .max
      end
    end
  end
end
