class LinkedList
  attr_accessor :node, :head, :size, :current_node
  attr_reader :tail

  def initialize(value = nil)
    @head = LinkedList::Node.new(value)
    @current_node = head
    if value.nil?
      raise ArgumentError, 'You must provide a value'
    end

    @size = 1
  end

  def to_s
    result = ''
    current_node = head
    while !current_node.nil?
      result << "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end

    result << 'nil'
    result
  end

  def append(value)
    find_tail_node.next_node = LinkedList::Node.new(value)
    @size += 1
  end

  def prepend(value)
    prepended_node = LinkedList::Node.new(value)
    prepended_node.next_node = head
    @head = prepended_node
    @size += 1
  end

  def pop
    return raise LinkedList::Error, 'Cannot remove node, head is the last node' if size.eql?(1)

    while !current_node.next_node.next_node.nil?
      self.current_node = current_node.next_node
    end

    tail_value = current_node.next_node.value
    current_node.next_node = nil
    @size -= 1
    tail_value
  end

  def remove_at(index)
    return false if index > size - 1
    @size -= 1
    if index.eql?(0)
      self.head = head.next_node
      return true
    end

    current_index = 1
    self.current_node = head
    while current_index < index
      current_index += 1
      self.current_node = current_node.next_node
    end

    self.current_node.next_node = current_node.next_node.next_node
    true
  end


  def tail
    find_tail_node
  end

  def find(value)
    find_first_match(value)
    current_node
  end

  def contains?(value)
    find_first_match(value)
    !current_node.nil?
  end

  alias :any? :contains?

  private

  def find_first_match(value)
    self.current_node = head

    while !current_node.nil? && !current_node.value.eql?(value)
      self.current_node = current_node.next_node
    end
  end

  def find_tail_node
    self.current_node = head

    while !current_node.next_node.nil?
      self.current_node = current_node.next_node
    end
    current_node
  end
end
