module HeapTree
  class Node < BinaryNode
    attr_accessor :parent

    def initialize(value = nil)
      super
    end
  end
end
