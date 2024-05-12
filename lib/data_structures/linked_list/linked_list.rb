class LinkedList
  attr_accessor :node, :head

  def initialize(node = nil)
    @head = node
    if !head.is_a?(LinkedList::Node) && !node.nil?
      raise ArgumentError, 'only LinkedList::Node must be provided'
    end
  end

  def append(node)
    current_node = head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end

    current_node.next_node = node
  end
end
