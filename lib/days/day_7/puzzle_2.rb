# frozen_string_literal: true

require_relative '../puzzle'

module Days
  module Day7
    class Puzzle2 < Puzzle
      LIST_CONTENTS_OF_DIRECTORY_COMMAND = '$ ls'
      CHANGE_DIRECTORY_PREFIX = '$ cd '
      DIRECTORY_PREFIX = 'dir '
      UP_ONE_LEVEL = '..'
      DIRECTORY_SIZE_LIMIT = 100_000
      TOTAL_DISK_SPACE = 70_000_000
      SPACE_REQUIRED_FOR_UPDATE = 30_000_000

      def initialize(args)
        super(args)

        self.path_to_working_directory = []
        self.directory_sizes = Hash.new(0)
      end

      def call
        puzzle_input.split(/\n/).each do |terminal_message|
          next if terminal_message == LIST_CONTENTS_OF_DIRECTORY_COMMAND

          if terminal_message.start_with?(CHANGE_DIRECTORY_PREFIX)
            change_directory(terminal_message)
          else
            log_directory_item(terminal_message)
          end
        end

        fize_sizes_that_exceed_space_required_for_update.min
      end

      private

      attr_accessor :path_to_working_directory, :directory_sizes

      private_constant :LIST_CONTENTS_OF_DIRECTORY_COMMAND,
                       :CHANGE_DIRECTORY_PREFIX,
                       :DIRECTORY_PREFIX,
                       :UP_ONE_LEVEL,
                       :DIRECTORY_SIZE_LIMIT

      def change_directory(terminal_message)
        directory_name = strip(terminal_message, of: CHANGE_DIRECTORY_PREFIX)

        if directory_name == UP_ONE_LEVEL
          path_to_working_directory.pop
        else
          path_to_working_directory.push(directory_name)
        end
      end

      def strip(terminal_message, of:)
        terminal_message.delete(of)
      end

      def log_directory_item(item)
        return if item.start_with?(DIRECTORY_PREFIX)

        file_size = item.split.first
        increment_directory_sizes_with(file_size)
      end

      def increment_directory_sizes_with(file_size)
        path_to_working_directory.size.times do |i|
          path = path_to_working_directory[0, i + 1]
          directory_sizes[path] += file_size.to_i
        end
      end

      def fize_sizes_that_exceed_space_required_for_update
        directory_sizes.values.select do |size|
          size > space_needed_to_be_freed_for_update
        end
      end

      def space_needed_to_be_freed_for_update
        SPACE_REQUIRED_FOR_UPDATE - remaining_disk_space
      end

      def remaining_disk_space
        TOTAL_DISK_SPACE - directory_sizes[['/']]
      end
    end
  end
end
