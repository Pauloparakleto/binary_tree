require 'spec_helper'

RSpec.describe LinkedList do
  let(:head_node){ LinkedList::Node.new('A head value') }

	describe '#new' do
   let(:wrong_class) { Hash.new }

    context 'with node argument' do
      it 'is truthy' do
        expect(described_class.new(head_node)).to be_truthy
      end
    end

    context 'with a wrong class as node argument' do
      let(:error_message ){ 'only LinkedList::Node must be provided' }

      it 'raises error WrongArgument with message' do
        expect{ described_class.new(wrong_class) }
          .to raise_error(ArgumentError, error_message)
      end
    end

    context 'without node argument' do
      it 'is truthy' do
        expect(described_class.new).to be_truthy
      end
    end
  end

  describe '#append(value)' do
    context 'when append value' do
      let(:next_node){ LinkedList::Node.new('next node value') }

      it 'keeps head as node_head' do
        linked_list = described_class.new(head_node)
        linked_list.append(next_node)

        expect(linked_list.head).to eq(head_node)
      end

      it 'has next node set as next_node' do
        linked_list = described_class.new(head_node)
        linked_list.append(next_node)

        expect(linked_list.head.next_node).to eq(next_node)
      end
    end
  end
end

