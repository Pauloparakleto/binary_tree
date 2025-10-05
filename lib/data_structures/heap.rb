class Heap < BTree
  def initialize(head = nil)
    @head = head
    super(@head)
  end
end
