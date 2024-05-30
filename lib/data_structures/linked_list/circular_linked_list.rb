# frozen_string_literal: true

class CircularLinkedList
  attr_accessor :head

  def initialize(value)
    @head = LinkedList::DoubleNode.new
    head.next_node = head
    head.previous_node = head
    node = LinkedList::DoubleNode.new(value)
    head.next_node = node
    head.previous_node = node
  end

  def append(value)
    node = LinkedList::DoubleNode.new(value)
    node.next_node = head
    node.previous_node = head.previous_node
    head.previous_node.next_node = node
    head.previous_node = node
  end

  def prepend(value)
    node = LinkedList::DoubleNode.new(value)
    node.next_node = head.next_node
    node.previous_node = head
    head.next_node.previous_node = node
    head.next_node = node
  end

  def pop
    if head.next_node.next_node.nil?
      head.previous_node = nil
      head.next_node = nil
      head.next_node = head
      head.previous_node = head
    else
      head.previous_node = head.previous_node.previous_node
      head.previous_node.next_node = head
    end
  end
end