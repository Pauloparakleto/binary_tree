module HeapTree
  class Node
    attr_accessor :left, :right, :value, :parent

    def initialize(value = nil)
      @value = value
    end
  end
end
