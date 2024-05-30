class LinkedList::DoubleNode
  attr_accessor :previous, :next, :value

  def initialize(value = nil)
    @value = value
  end
end
