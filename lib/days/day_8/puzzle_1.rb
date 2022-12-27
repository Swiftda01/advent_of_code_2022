# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day8
    class Puzzle1 < Puzzle
      def call
        plot.each_with_index.sum do |row, y_index|
          row.each_with_index.count do |tree, x_index|
            visible?(row, tree, x_index, y_index)
          end
        end
      end

      private

      def visible?(row, tree, x_index, y_index)
        trees_to_left = row[0, x_index]
        trees_to_right = row[(x_index + 1), row.length]
        trees_to_top = inverted_plot[x_index][0, y_index]
        trees_to_bottom = inverted_plot[x_index][(y_index + 1), inverted_plot[x_index].length]

        [trees_to_left, trees_to_right, trees_to_top, trees_to_bottom].any? do |surrounding_trees|
          all_shorter_than?(tree, row_of: surrounding_trees)
        end
      end

      def all_shorter_than?(tree, row_of:)
        row_of.all? { |surrounding_tree| surrounding_tree < tree }
      end

      def plot
        @plot ||= puzzle_input.split(/\n/).map(&:chars)
      end

      def inverted_plot
        @inverted_plot ||= plot.transpose
      end
    end
  end
end
