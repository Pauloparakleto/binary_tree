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

  def index_of_left_child(index)
    left_child_index = (2 * index) + 1
    return if left_child_index > list.length - 1

    left_child_index
  end

  def value_of_left_child(index)
    left_child_index = index_of_left_child(index)
    return if left_child_index.nil?

    list[index_of_left_child(index)]
  end
end
