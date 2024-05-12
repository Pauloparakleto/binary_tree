class LinkedList::Node
	attr_accessor :value, :next_node

	def initialize(value = nil)
		@value = value
	end
end