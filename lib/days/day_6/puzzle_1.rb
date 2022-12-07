# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day6
    class Puzzle1 < Puzzle
      START_MARKER = 4

      def call
        chars = puzzle_input.chars
        marker = START_MARKER

        loop do
          break if unique_chars(chars[0, START_MARKER])

          marker += 1
          chars.rotate!
        end

        marker
      end

      private

      private_constant :START_MARKER

      def unique_chars(arr)
        arr.length == arr.uniq.length
      end
    end
  end
end
