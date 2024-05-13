class LinkedList
  attr_accessor :node, :head

  def initialize(value = nil)
    @head = LinkedList::Node.new(value)
    if value.nil?
      raise ArgumentError, 'You must provide a value'
    end
  end

  def append(value)
    current_node = head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end

    current_node.next_node = LinkedList::Node.new(value)
  end

  def prepend(value)
    prepended_node = LinkedList::Node.new(value)
    prepended_node.next_node = head
    @head = prepended_node
  end
end
