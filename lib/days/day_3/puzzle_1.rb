# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day3
    class Puzzle1 < Puzzle
      ITEM_LIST = [*'a'..'z', *'A'..'Z'].freeze

      def call
        puzzle_input.split(/\n/).inject(0) do |sum, rucksack|
          half1, half2 = rucksack.chars.each_slice(rucksack.length / 2).to_a
          common_item = (half1 & half2).first
          sum + priority_of(common_item)
        end
      end

      private

      private_constant :ITEM_LIST

      def priority_of(item)
        ITEM_LIST.index(item) + 1
      end
    end
  end
end
