# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CircularLinkedList do
  let(:node_value) { 'A value' }
  let(:linked_list) { described_class.new('head') }

  describe '#new' do
    it 'has first node as node value' do
      linked_list = described_class.new(node_value)
      expect(linked_list.head.next_node.value).to eq(node_value)
    end

    it 'has previous node as node value' do
      linked_list = described_class.new(node_value)
      expect(linked_list.head.previous_node.value).to eq(node_value)
    end
  end

  describe '#append(value)' do
    context 'when append value' do
      let(:next_value) { 'next node value' }

      it 'head.next_node value as next_node value' do
        linked_list = described_class.new(node_value)
        linked_list.append(next_value)

        expect(linked_list.head.next_node.value).to eq(node_value)
      end

      it 'has previous node set as next_node' do
        linked_list = described_class.new(node_value)
        linked_list.append(next_value)

        expect(linked_list.head.next_node.next_node.value).to eq(next_value)
      end

      it 'has previous node as the appended node value' do
        linked_list = described_class.new(node_value)
        linked_list.append(next_value)

        expect(linked_list.head.previous_node.value).to eq(next_value)
      end
    end
  end

  describe '#prepend(value)' do
    let(:prepended_value) { 'A prepended value' }
    let(:linked_list) { described_class.new(node_value) }

    before { linked_list.prepend(prepended_value) }

    it 'sets head next_node to preprended value' do
      expect(linked_list.head.next_node.value).to eq(prepended_value)
    end

    it 'sets head.next_node.next_node to old head value' do
      expect(linked_list.head.next_node.next_node.value).to eq(node_value)
    end

    it 'keeps head.previous_node value as old value' do
      expect(linked_list.head.previous_node.value).to eq(node_value)
    end
  end

  describe '#pop' do
    let(:linked_list) { described_class.new('node value') }
    let(:another_value) { 'Another value' }

    before { linked_list }

    context 'when there is one node' do
      it 'has head nil' do
        linked_list.pop
        expect(linked_list.head.next_node).to eq(linked_list.head)
        expect(linked_list.head.previous_node).to eq(linked_list.head)
        expect(linked_list.head.value).to be_nil
      end
    end

    context 'when there is two nodes' do
      before { linked_list.append(another_value) }

      it 'removes another node' do
        linked_list.pop
        expect(linked_list.head.next_node.value).to eq('node value')
        expect(linked_list.head.next_node.next_node.value).to be_nil
        expect(linked_list.head.previous_node.value).to eq('node value')
      end
    end
  end

  xdescribe '#size' do
    let(:linked_list) { described_class.new('value') }

    context 'when initialize list' do
      it 'is one' do
        expect(linked_list.size).to eq(1)
      end
    end

    context 'when append values' do
      before do
        (1..4).to_a.each do |node_value|
          linked_list.append(node_value)
        end
      end

      it 'is 5' do
        expect(linked_list.size).to eq(5)
      end
    end

    context 'when prepend value' do
      before do
        (1..4).to_a.each do |node_value|
          linked_list.prepend(node_value)
        end
      end

      it 'counts 5' do
        expect(linked_list.size).to eq(5)
      end
    end
  end

  xdescribe '#tail' do
    let(:linked_list) { described_class.new('value') }

    before { (1..3).to_a.each { |number| linked_list.append(number) } }

    context 'when append' do
      it 'is 3' do
        expect(linked_list.tail.value).to eq(3)
      end
    end

    context 'when pop' do
      before { linked_list.pop }

      it 'is 2' do
        expect(linked_list.tail.value).to eq(2)
      end
    end
  end

  describe '#find' do
    let(:linked_list) { described_class.new('value') }

    before { (1..7).to_a.each { |number| linked_list.append(number) } }

    context 'when node exists' do
      it 'finds 6' do
        expect(linked_list.find(6).value).to eq(6)
      end
    end

    context 'when node does not exist' do
      it 'is nil' do
        expect(linked_list.find(99)).to be_nil
      end
    end
  end

  xdescribe '#contains?' do
    let(:linked_list) { described_class.new('value') }

    before { linked_list.append(1) }

    context 'when contains' do
      it 'is true' do
        expect(linked_list.contains?(1)).to be_truthy
      end
    end

    context 'when does not contain' do
      it 'is false' do
        expect(linked_list.contains?(99)).to be_falsey
      end
    end
  end

  xdescribe '#any?' do
    subject(:linked_list) { described_class.new('value') }

    it 'is #contains? alias' do
      expect(linked_list.method(:contains?)).to eq(linked_list.method(:any?))
    end
  end

  xdescribe '#to_s' do
    it 'prints linked list' do
      linked_list = described_class.new(1)
      linked_list.append(2)
      expect(linked_list.to_s).to eq('(1) -> (2) -> nil')
    end
  end

  xdescribe '#remove_at' do
    context 'when remove head' do
      before { linked_list.remove_at(0) }

      it 'has size zero' do
        expect(linked_list.size).to eq(0)
      end

      it 'finds nil' do
        expect(linked_list.find('head')).to be_nil
      end
    end

    context 'when remove a node' do
      before { (1..3).to_a.each { |number| linked_list.append(number) } }

      it 'has size 3' do
        linked_list.remove_at(2)
        expect(linked_list.size).to eq(3)
      end

      it 'finds nil' do
        linked_list.remove_at(2)
        expect(linked_list.find(2)).to be_nil
      end

      it 'is true' do
        expect(linked_list.remove_at(2)).to eq(true)
      end
    end

    context 'when index is beyond list size' do
      before { (1..3).to_a.each { |number| linked_list.append(number) } }

      it 'is false' do
        expect(linked_list.remove_at(4)).to eq(false)
      end
    end
  end

  xdescribe '#at' do
    before { (1..3).to_a.each { |number| linked_list.append(number) } }

    context 'when between size range' do
      it 'returns value at head' do
        expect(linked_list.at(0).value).to eq('head')
      end

      it 'returns tail value' do
        expect(linked_list.at(3).value).to eq(3)
      end

      it 'returns a middle value' do
        expect(linked_list.at(2).value).to eq(2)
      end
    end

    context 'when out of range' do
      it 'is nil' do
        expect(linked_list.at(4)).to be_nil
      end
    end

    context 'when negative index' do
      it 'raises argument error' do
        expect { linked_list.at(-1) }.to raise_error(LinkedList::Error, 'You must provide a positive index')
      end
    end
  end

  xdescribe '#insert_at' do
    before { (1..3).to_a.each { |number| linked_list.append(number) } }

    it 'inserts value' do
      linked_list.insert_at(0, 'new head')
      expect(linked_list.head.value).to eq('new head')
    end

    it 'inserts value at index 1' do
      linked_list.insert_at(1, 'new value 1')
      expect(linked_list.at(1).value).to eq('new value 1')
    end

    it 'inserts value at index 2' do
      linked_list.insert_at(2, 'new value 2')
      expect(linked_list.at(2).value).to eq('new value 2')
    end
  end
end