require 'spec_helper'

RSpec.describe Heap do
  it 'is truthy' do
    expect(described_class.new).to be_truthy
  end

  it 'max heapify' do
    node = HeapTree::Node.new(4)
    heap = described_class.new(node)
    heap.head.right = HeapTree::Node.new(2)
    heap.head.left = HeapTree::Node.new(8)
    heap.head.left.parent = node
    heap.head.right.parent = node

    heap.max_heapify

    expect(heap.head.value).to eq(8)
    expect(heap.head.left.value).to eq(4)
    expect(heap.head.right.value).to eq(2)
  end
end
