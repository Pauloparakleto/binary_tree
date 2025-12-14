require 'spec_helper'

RSpec.describe Heap do
  subject(:heap) { described_class.new(list) }
  let(:list) { [16, 14, 10, 8, 7, 9, 3, 2, 4, 1] }

  describe "#list" do

    it 'get the list' do
      expect(heap.list).to eq(list)
    end
  end

  describe "#index_of_parent" do
    it 'get parent' do
      expect(heap.index_of_parent(0)).to be_nil
      expect(heap.index_of_parent(1)).to eq(0)
      expect(heap.index_of_parent(2)).to eq(0)
      expect(heap.index_of_parent(3)).to eq(1)
      expect(heap.index_of_parent(4)).to eq(1)
    end
  end

  describe "#value_of_parent" do
    it 'get parent value' do
      expect(heap.value_of_parent(0)).to be_nil
      expect(heap.value_of_parent(1)).to eq(16)
      expect(heap.value_of_parent(2)).to eq(16)
      expect(heap.value_of_parent(3)).to eq(14)
      expect(heap.value_of_parent(4)).to eq(14)
    end
  end

  describe "#index_of_left_child" do
    it 'get index_of_left_child' do
      expect(heap.index_of_left_child(0)).to be_one
      expect(heap.index_of_left_child(1)).to eq(3)
      expect(heap.index_of_left_child(2)).to eq(5)
      expect(heap.index_of_left_child(4)).to eq(9)
      expect(heap.index_of_left_child(5)).to be_nil
    end
  end

  describe "#value_of_left_child" do
    it 'get index_of_left_child' do
      expect(heap.value_of_left_child(0)).to eq(14)
      expect(heap.value_of_left_child(1)).to eq(8)
      expect(heap.value_of_left_child(2)).to eq(9)
      expect(heap.value_of_left_child(4)).to eq(1)
      expect(heap.value_of_left_child(5)).to be_nil
    end
  end

  describe "#index_of_right_child" do
    it 'get index_of_right_child' do
      expect(heap.index_of_right_child(0)).to eq(2)
      expect(heap.index_of_right_child(1)).to eq(4)
      expect(heap.index_of_right_child(2)).to eq(6)
      expect(heap.index_of_right_child(4)).to be_nil
      expect(heap.index_of_right_child(5)).to be_nil
    end
  end

  describe "#value_of_right_child" do
    it 'get value_of_right_child' do
      expect(heap.value_of_right_child(0)).to eq(10)
      expect(heap.value_of_right_child(1)).to eq(7)
      expect(heap.value_of_right_child(2)).to eq(3)
      expect(heap.value_of_right_child(4)).to be_nil
      expect(heap.value_of_right_child(5)).to be_nil
    end
  end
end
