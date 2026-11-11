# frozen_string_literal: true

# Including class runs itself
module Magic
  # main method, reads first argument if provided, otherwise reads "input.txt"
  # from the same directory if it exists, otherwise reads from STDIN
  module ClassMethods
    def main(fallback_file_path = nil)
      file = File.exist?(fallback_file_path) && File.read(fallback_file_path)

      input = ARGV.first&.then { File.read(it) } || file || ARGF.read

      puts new.solution_from_string(input)
    end
  end

  def self.included(klass)
    klass.extend(ClassMethods)

    if klass_path.end_with?($PROGRAM_NAME)
      klass_path, _line = Object.const_source_location(klass.name)
      input_file_path = File.dirname(klass_path) + "/input.txt"
      klass.main(input_file_path)
    end
  end
end
