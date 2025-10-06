require 'spec_helper'

RSpec.describe Heap do
  subject(:heap) { described_class.new(node) }
  let(:node) { HeapTree::Node.new(4) }

  it 'is truthy' do
    expect(described_class.new).to be_truthy
  end

  context 'when max is 8 on left' do
    before do
      heap.head.right = HeapTree::Node.new(2)
      heap.head.left = HeapTree::Node.new(8)
      heap.head.left.parent = node
      heap.head.right.parent = node
    end

    it 'max heapify' do

      heap.max_heapify

      expect(heap.head.value).to eq(8)
      expect(heap.head.left.value).to eq(4)
      expect(heap.head.right.value).to eq(2)
    end
  end

  context 'when max is 16 on right' do
    before do
      heap.head.right = HeapTree::Node.new(16)
      heap.head.left = HeapTree::Node.new(8)
      heap.head.left.parent = node
      heap.head.right.parent = node
    end

    it 'max heapify' do
      heap.max_heapify

      expect(heap.head.value).to eq(16)
      expect(heap.head.left.value).to eq(4)
      expect(heap.head.right.value).to eq(8)
    end
  end
end
