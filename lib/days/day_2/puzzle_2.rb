# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day2
    class Puzzle2 < Puzzle
      PLAY = { 'A' => 'rock', 'B' => 'paper', 'C' => 'scissors' }.freeze

      RESPONSE = {
        'X' => -1, # lose
        'Y' => 0, # draw
        'Z' => 1  # win
      }.freeze

      SCORE = {
        'paper scissors' => 9,
        'rock paper' => 8,
        'scissors rock' => 7,
        'scissors scissors' => 6,
        'paper paper' => 5,
        'rock rock' => 4,
        'rock scissors' => 3,
        'scissors paper' => 2,
        'paper rock' => 1
      }.freeze

      def call
        puzzle_input.split(/\n/).map(&:split).inject(0) do |sum, round_codes|
          opponent_code, your_code = round_codes

          opponent_play = PLAY[opponent_code]
          your_play = response_to(opponent_play, from: your_code)

          sum + SCORE["#{opponent_play} #{your_play}"]
        end
      end

      private

      private_constant :PLAY
      private_constant :RESPONSE
      private_constant :SCORE

      def response_to(play, from:)
        index_of_play = PLAY.values.index(play)
        PLAY.values.rotate(RESPONSE[from])[index_of_play]
      end
    end
  end
end
