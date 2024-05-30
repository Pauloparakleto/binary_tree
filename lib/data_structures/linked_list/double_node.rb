class LinkedList::DoubleNode
  attr_accessor :previous_node, :next_node, :value

  def initialize(value = nil)
    @value = value
  end
end
