# frozen_string_literal: true

class CircularLinkedList
  attr_accessor :head, :size

  def initialize(value)
    @head = LinkedList::DoubleNode.new
    node = LinkedList::DoubleNode.new(value)
    node.next_node = head
    node.previous_node = head
    head.next_node = node
    head.previous_node = node
    @size = 1
  end

  def append(value)
    node = LinkedList::DoubleNode.new(value)
    @size += 1
    node.next_node = head
    node.previous_node = head.previous_node
    head.previous_node.next_node = node
    head.previous_node = node
  end

  def prepend(value)
    node = LinkedList::DoubleNode.new(value)
    @size += 1
    node.next_node = head.next_node
    node.previous_node = head
    head.next_node.previous_node = node
    head.next_node = node
  end

  def pop
    @size -= 1
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

  def find(value)
    head.value = value
    current_node = head.next_node
    while current_node.value != value
      current_node = current_node.next_node
    end
    current_node unless current_node == head
  end

  def at(index)
    return nil if index > size
    raise CircularLinkedList::Error, 'You must provide a positive index' if index.negative?

    current_index = 0
    current_node = head.next_node
    while current_index < index
      current_node = current_node.next_node
      current_index += 1
    end
    current_node
  end

  def contains?(value)
    !find(value).nil?
  end

  alias any? contains?

  def remove_at(index)
    raise CircularLinkedList::Error, 'Index out of range' if index.eql?(size)

    @size -= 1
    target_node = at(index)
    target_node.previous_node.next_node = target_node.next_node
    target_node.next_node.previous_node = target_node.previous_node
  end
end
