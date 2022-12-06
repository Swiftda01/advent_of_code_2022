# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day4
    class Puzzle1 < Puzzle
      def call
        puzzle_input.split(/\n/).count do |pairs|
          assignments = pairs.split(',').map { |assignment| Range.new(*assignment.split('-').map(&:to_i)).to_a }

          smallest_assignment, biggest_assignment = assignments.sort_by(&:length)

          (smallest_assignment - biggest_assignment).empty?
        end
      end
    end
  end
end
