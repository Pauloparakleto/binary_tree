class LinkedList
  attr_accessor :node

  def initialize(node = nil)
    @node = node
    if !node.is_a?(LinkedList::Node) && !node.nil?
      raise ArgumentError, 'only LinkedList::Node must be provided'
    end
  end
end
