# frozen_string_literal: true

require "binary_tree"
require "binary_search"
require "node"
require "simple_writer"
require "writer_decorator"
require "numbering_writer"
require "time_stamping_writer"
require "data_structures/linked_list/linked_list"
require "data_structures/linked_list/error"
require "data_structures/linked_list/node"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
