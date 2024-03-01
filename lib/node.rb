class Node
  attr_accessor :left, :right, :value

  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left = left
    @right = right
  end
end