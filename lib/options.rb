# frozen_string_literal: true

require 'optparse'

class Options
  attr_accessor :day_number, :puzzle_number

  REQUIRED_OPTIONS = [
    {
      name: 'day_number',
      input: '--day=NUMBER',
      description: 'Day number (1 to 25)',
      valid_input: (1..25).to_a,
      error_message: "Invalid day. Run 'ruby solution --help' for options."
    },
    {
      name: 'puzzle_number',
      input: '--puzzle=NUMBER',
      description: 'Puzzle number (1 or 2)',
      valid_input: [1, 2],
      error_message: "Invalid puzzle. Run 'ruby solution --help' for options."
    }
  ].freeze

  def self.parse!
    options = new

    OptionParser.new do |opts|
      opts.banner = 'Usage: ruby solution.rb [options]'

      REQUIRED_OPTIONS.each do |option|
        opts.on(option[:input], option[:description]) do |n|
          options.send("#{option[:name]}=", n.to_i)
        end
      end
    end.parse!

    options
  end

  def validate!
    REQUIRED_OPTIONS.each do |option|
      raise option[:error_message] unless
        option[:valid_input].include?(public_send(option[:name]))
    end
  end

  private_constant :REQUIRED_OPTIONS
end
