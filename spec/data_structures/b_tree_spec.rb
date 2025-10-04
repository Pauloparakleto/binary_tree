# frozen_string_literal: true

RSpec.describe BTree do
  subject(:b_tree) do
    described_class.new()
  end

  describe '#in_order' do
    context 'when tree has nodes' do
      let(:list_nodes) { [2, 3, 5, 6, 7, 8] }

      before do
        b_tree.head = Binary::Node.new(6)
        b_tree.head.left = Binary::Node.new(3)
        b_tree.head.left.left = Binary::Node.new(2)
        b_tree.head.left.right = Binary::Node.new(5)

        b_tree.head.right = Binary::Node.new(7)
        b_tree.head.right.right = Binary::Node.new(8)
      end

      it 'prints ordered node list' do
        expect(b_tree.in_order).to eq(list_nodes)
      end
    end
  end
end
