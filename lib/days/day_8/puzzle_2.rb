# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day8
    class Puzzle2 < Puzzle
      def call
        scenic_scores = plot.flat_map.with_index do |row, y_index|
          row.map.with_index do |tree, x_index|
            scenic_score(row, tree, x_index, y_index)
          end
        end

        scenic_scores.max
      end

      private

      def scenic_score(row, tree, x_index, y_index)
        trees_to_left = row[0, x_index].reverse
        trees_to_right = row[(x_index + 1), row.length]
        trees_to_top = inverted_plot[x_index][0, y_index].reverse
        trees_to_bottom = inverted_plot[x_index][(y_index + 1), inverted_plot[x_index].length]

        [trees_to_left, trees_to_right, trees_to_top, trees_to_bottom].inject(1) do |visible_trees, surrounding_trees|
          visible_trees * number_of_visible_trees(tree, row_of: surrounding_trees)
        end
      end

      def number_of_visible_trees(tree, row_of:)
        num_of_visible_trees = 0

        row_of.each do |surrounding_tree|
          num_of_visible_trees += 1

          break if surrounding_tree >= tree
        end

        num_of_visible_trees
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
