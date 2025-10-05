module Binary
  class Node
    attr_accessor :left, :right, :value

    def initialize(value = nil)
      @left = nil
      @right = nil
      @value = value
    end
  end
end

class BTree
  attr_accessor :head, :current_node

  def initialize(head = nil)
    @head = head || Binary::Node.new
    @values = []
  end

  def in_order(node = @head)
    return @values if node.nil?

    in_order(node.left)
    @values << node.value
    in_order(node.right)
  end
end
