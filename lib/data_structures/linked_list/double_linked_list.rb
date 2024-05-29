class DoubleLinkedList < LinkedList
  def initialize(value = nil)
    super(value)
    @head = LinkedList::DoubleNode.new(value)
  end
end
