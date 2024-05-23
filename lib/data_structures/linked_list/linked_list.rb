class LinkedList
  attr_accessor :node, :head, :size, :current_node
  attr_reader :tail

  def initialize(value = nil)
    @head = LinkedList::Node.new(value)
    @current_node = head
    if value.nil?
      raise ArgumentError, 'You must provide a value'
    end

    @size = 1
  end

  def append(value)
    current_node = head
    # TODO the while block is similar to tail method
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end

    current_node.next_node = LinkedList::Node.new(value)
    @size += 1
  end

  def prepend(value)
    prepended_node = LinkedList::Node.new(value)
    prepended_node.next_node = head
    @head = prepended_node
    @size += 1
  end

  def pop
    return raise LinkedList::Error, 'Cannot remove node, head is the last node' if size.eql?(1)

    while !current_node.next_node.next_node.nil?
      self.current_node = current_node.next_node
    end

    tail_value = current_node.next_node.value
    current_node.next_node = nil
    @size -= 1
    tail_value
  end

  def tail
    current_node = head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end

    current_node
  end
end
