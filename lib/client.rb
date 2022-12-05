# frozen_string_literal: true

require 'typhoeus'
require 'dotenv/load'

class Client
  def initialize(day_number)
    @day_number = day_number
  end

  def puzzle_input
    Typhoeus.get(
      "https://adventofcode.com/2022/day/#{day_number}/input",
      headers: { 'Cookie' => "session=#{session_id}" }
    ).body
  end

  private

  attr_reader :day_number

  def session_id
    ENV['SESSION_ID'] || raise('No Advent of Code session id provided')
  end
end
