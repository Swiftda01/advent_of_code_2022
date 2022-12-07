# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day5
    class Puzzle2 < Puzzle
      STARTING_STACKS = [
        ['F', nil, nil, 'L', nil, 'M', nil, nil, nil],
        ['T', nil, 'H', 'V', 'G', 'V', nil, nil, nil],
        ['N', nil, 'T', 'D', 'R', 'N', nil, 'D', nil],
        ['Z', nil, 'B', 'C', 'P', 'B', 'R', 'Z', nil],
        ['M', nil, 'J', 'N', 'M', 'F', 'M', 'V', 'H'],
        ['G', 'J', 'L', 'J', 'S', 'C', 'G', 'M', 'F'],
        ['H', 'W', 'V', 'P', 'W', 'H', 'H', 'N', 'N'],
        ['J', 'V', 'G', 'B', 'F', 'G', 'D', 'H', 'G']
      ].freeze

      def call
        stacks = STARTING_STACKS.transpose.map(&:reverse).map(&:compact)

        instructions.each do |num_to_move, from, to|
          stacks[to - 1].push(
            *stacks[from - 1].slice!(-num_to_move, num_to_move)
          )
        end

        stacks.map(&:last).join
      end

      private

      private_constant :STARTING_STACKS

      def instructions
        puzzle_input.split(/\n/)[10..].map do |instruction|
          instruction.split.values_at(1, 3, 5).map(&:to_i)
        end
      end
    end
  end
end
