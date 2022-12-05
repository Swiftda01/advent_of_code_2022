# frozen_string_literal: true

require 'typhoeus'

module Days
  class Puzzle
    def initialize(puzzle_input)
      @puzzle_input = puzzle_input
    end

    private

    attr_reader :puzzle_input
  end
end
