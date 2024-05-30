# frozen_string_literal: true

class DoubleLinkedList < LinkedList
  attr_accessor :tail

  def initialize(value = nil)
    super(value)
    @head = LinkedList::DoubleNode.new(value)
    @tail = @head
  end

  def append(value)
    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?
    node = LinkedList::DoubleNode.new(value)
    node.previous_node = current_node
    current_node.next_node = node
    @size += 1
    @tail = current_node.next_node
  end

  def prepend(value)
    node = LinkedList::DoubleNode.new(value)
    head.previous_node = node
    node.next_node = head
    @size += 1
    self.head = node
  end

  def pop
    if head.next_node.nil?
      @head = head.next_node
      @tail = tail.next_node
    else
      tail.previous_node.next_node = nil
      @tail = tail.previous_node
    end
  end
end
