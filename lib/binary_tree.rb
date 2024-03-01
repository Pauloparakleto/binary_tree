# frozen_string_literal: true

#require_relative "binary_tree/version"

class BinaryTree
  attr_accessor :root

  def initialize(node)
    @root = node
  end

  def find(morse)
    sub_root = root
    morse.split('') do |pulse|
      if pulse.eql?('.')
        sub_root = sub_root.left
      else
        sub_root = sub_root.right
      end
    end
    sub_root.value
  end

  def possibilities(morse)
    sub_root = root

  end

  class Error < StandardError; end
  # Your code goes here...
end
