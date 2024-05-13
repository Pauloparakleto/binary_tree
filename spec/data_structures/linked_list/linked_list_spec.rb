require 'spec_helper'

RSpec.describe LinkedList do
  let(:head_value){ 'A head value' }

	describe '#new' do
   let(:wrong_class) { Hash.new }

    context 'with node argument' do
      it 'is truthy' do
        expect(described_class.new(head_value)).to be_truthy
      end
    end

    context 'without node argument' do
      it 'raises error' do
        expect{ described_class.new }.to raise_error(ArgumentError, 'You must provide a value')
      end
    end
  end

  describe '#append(value)' do
    context 'when append value' do
      let(:next_value){ 'next node value' }

      it 'keeps head as node_head' do
        linked_list = described_class.new(head_value)
        linked_list.append(next_value)

        expect(linked_list.head.value).to eq(head_value)
      end

      it 'has next node set as next_node' do
        linked_list = described_class.new(head_value)
        linked_list.append(next_value)

        expect(linked_list.head.next_node.value).to eq(next_value)
      end
    end
  end

  describe '#prepend(value)' do
    let(:prepended_value){ 'A prepended value' }
    let(:linked_list){ described_class.new(head_value) }

    before { linked_list.prepend(prepended_value) }

    it 'sets new head to preprended value' do
      expect(linked_list.head.value).to eq(prepended_value)
    end

    it 'sets head.next_node to old head value' do
      expect(linked_list.head.next_node.value).to eq(head_value)
    end
  end
end

