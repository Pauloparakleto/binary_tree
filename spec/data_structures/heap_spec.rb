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

  context 'when the initial head value is less then left and right side' do
    before do
      heap.head = HeapTree::Node.new(2)
      heap.head.right = HeapTree::Node.new(16)
      heap.head.left = HeapTree::Node.new(8)
      heap.head.left.parent = node
      heap.head.right.parent = node
    end

    it 'max heapify' do
      heap.max_heapify

      expect(heap.head.value).to eq(16)
      expect(heap.head.left.value).to eq(2)
      expect(heap.head.right.value).to eq(8)
    end
  end

  context 'when heap is deep 4 levels' do
    before do
      heap.head = HeapTree::Node.new(16)
      heap.head.right = HeapTree::Node.new(10)
      heap.head.left = HeapTree::Node.new(4)
      heap.head.left.parent = node
      heap.head.right.parent = node
      heap.head.left.left = HeapTree::Node.new(14)
      heap.head.left.right = HeapTree::Node.new(7)
      heap.head.left.left.parent = heap.head.left
      heap.head.left.right.parent = heap.head.left

      heap.head.left.left.left = HeapTree::Node.new(2)
      heap.head.left.left.left.parent = heap.head.left.left

      heap.head.left.left.right = HeapTree::Node.new(8)
      heap.head.left.left.right.parent = heap.head.left.left

      heap.head.left.right = HeapTree::Node.new(7)
      heap.head.left.right.parent = heap.head.left

      heap.head.left.right.left = HeapTree::Node.new(1)
      heap.head.left.right.left.parent = heap.head.left.right

      # right side
      heap.head.right.left = HeapTree::Node.new(9)
      heap.head.right.left.parent = heap.head.right

      heap.head.right.right = HeapTree::Node.new(3)
      heap.head.right.right.parent = heap.head.right
    end

    it 'max heapify' do
      heap.max_heapify

      expect(heap.head.value).to eq(16)
      expect(heap.head.left.value).to eq(14)
      expect(heap.head.right.value).to eq(10)
      expect(heap.head.left.left.value).to eq(8)
    end
  end
end
