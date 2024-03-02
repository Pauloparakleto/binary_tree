# frozen_string_literal: true

#require_relative "binary_tree/version"

class BinaryTree
  attr_accessor :root

  def initialize(node=Node.new)
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

  def insert(number)
    return root.value = number if root.value.nil?

    new_node = Node.new(number)

    insert_at_node(root, new_node)
  end

  def traverse(&block)
    traverse_at_node(root, &block)
  end


  class Error < StandardError; end
  # Your code goes here...
  private

  def insert_at_node(tree_node, new_node)
    if new_node.value < tree_node.value
      return tree_node.left = new_node if tree_node.left.nil?

      insert_at_node(tree_node.left, new_node)
    else
      return tree_node.right = new_node if tree_node.right.nil?

      insert_at_node(tree_node.right, new_node)
    end
  end

  def traverse_at_node(node, &block)
    return if node.nil?

    traverse_at_node(node.left, &block)
    yield node.value if block_given?
    traverse_at_node(node.right, &block)
  end
end
