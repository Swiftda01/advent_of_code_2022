# frozen_string_literal: true

Dir['./lib/**/*.rb'].each { |file| require file }

options = Options.parse!
options.validate!

puzzle_input = Client.new(options.day_number).puzzle_input

result = Object.const_get(
  "Days::Day#{options.day_number}::Puzzle#{options.puzzle_number}"
).new(puzzle_input).call

puts result
