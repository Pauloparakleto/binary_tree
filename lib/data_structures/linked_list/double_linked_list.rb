class DoubleLinkedList < LinkedList
  def initialize(value = nil)
    super(value)
    @head = LinkedList::DoubleNode.new(value)
  end

  def append(value)
    current_node = head
    while !current_node.next.nil?
      current_node = current_node.next
    end
    node = LinkedList::DoubleNode.new(value)
    node.previous = current_node
    current_node.next = node
  end

  def prepend(value)
    node = LinkedList::DoubleNode.new(value)
    head.previous = node
    node.next = head
    self.head = node
  end
end
