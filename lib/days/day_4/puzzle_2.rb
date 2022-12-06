# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day4
    class Puzzle2 < Puzzle
      def call
        puzzle_input.split(/\n/).count do |pairs|
          assignment1, assignment2 = pairs.split(',').map do |assignment|
            Range.new(*assignment.split('-').map(&:to_i)).to_a
          end

          (assignment1 & assignment2).any?
        end
      end
    end
  end
end
