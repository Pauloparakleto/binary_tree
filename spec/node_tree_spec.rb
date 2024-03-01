# frozen_string_literal: true

RSpec.describe Node do
  subject(:node) { Node.new }

  describe '#new' do
    it 'sets value' do
      node.value = 'E'
      expect(node.value).to eq('E')
    end

    it 'sets left as nil' do
      expect(node.left).to be_nil
    end

    it 'sets right as nil' do
      expect(node.right).to be_nil
    end
  end

  describe '#left' do
    let(:root_node) { node }
    let(:left_node) { node }

    context 'when there is not left node' do
      it 'is nil for left node' do
        expect(root_node.left).to be_nil
      end
    end

    context 'when there is left node' do
      before do
        left_node.value = 'E'
        root_node.left = left_node
      end

      it 'has left node' do
        expect(root_node.left).to eq(left_node)
      end

      it 'has left node value as E' do
        expect(root_node.left.value).to eq(left_node.value)
      end
    end
  end

  describe '#right' do
    let(:root_node) { node }
    let(:right_node) { node }

    context 'when there is not right node' do
      it 'is nil for right node' do
        expect(root_node.right).to be_nil
      end
    end

    context 'when there is right node' do
      before do
        right_node.value = 'E'
        root_node.right = right_node
      end

      it 'has right node' do
        expect(root_node.right).to eq(right_node)
      end

      it 'has right node value as E' do
        expect(root_node.right.value).to eq(right_node.value)
      end
    end
  end
end
