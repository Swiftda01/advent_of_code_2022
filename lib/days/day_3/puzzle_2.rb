# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day3
    class Puzzle2 < Puzzle
      ITEM_LIST = [*'a'..'z', *'A'..'Z'].freeze

      def call
        puzzle_input.split(/\n/).each_slice(3).inject(0) do |sum, rucksacks|
          common_item =
            (rucksacks[0].chars & rucksacks[1].chars & rucksacks[2].chars).first

          sum + priority_of(common_item)
        end
      end

      private

      def priority_of(item)
        ITEM_LIST.index(item) + 1
      end
    end
  end
end
