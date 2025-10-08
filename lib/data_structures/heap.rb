class Heap < BTree
  def initialize(head = nil)
    @head = head
    super(@head)
  end

  def max_heapify(node = @head)

    parent = node
    max_value = parent.value
    left_node = parent.left
    right_node = parent.right
    if parent.value < left_node.value
      parent_value = parent.value
      value = left_node.value
      parent.value = value
      left_node.value = parent_value
    end

    if parent.value < right_node.value
      parent_value = parent.value
      value = right_node.value
      parent.value = value
      right_node.value = parent_value
    end

    max_heapify(parent.left)
  end
end
