class Heap < BTree
  def initialize(head = nil)
    @head = head
    super(@head)
  end

  def max_heapify(node = @head.left)
    return if node.nil?

    current = node
    parent = current.parent
    max_value = current.value
    if parent.value < current.value
      parent_value = node.parent.value
      value = current.value
      parent.value = value
      current.value = parent_value
    end
  end
end
