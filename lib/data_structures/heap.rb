class Heap
  attr_reader :list

  def initialize(list)
    @list = list
  end

  def index_of_parent(index)
    parent_index = (index - 1) / 2
    return if parent_index.negative?

    parent_index
  end

  def value_of_parent(index)
    return if index_of_parent(index).nil?

    @list[index_of_parent(index)]
  end
end
