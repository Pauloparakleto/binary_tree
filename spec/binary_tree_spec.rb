# frozen_string_literal: true

RSpec.describe BinaryTree do
  subject(:binary_tree) do
    described_class.new(root)
  end

  let(:e_node){ Node.new('E') }
  let(:i_node){ Node.new('I') }
  let(:s_node){ Node.new('S') }
  let(:a_node){ Node.new('A') }
  let(:n_node){ Node.new('N') }
  let(:t_node){ Node.new('T') }
  let(:m_node){ Node.new('M') }
  let(:o_node){ Node.new('O') }
  let(:root){ Node.new }

  before do
    e_node.left = i_node
    i_node.left = s_node
    e_node.right = a_node

    t_node.right = m_node
    m_node.right = o_node
    t_node.left = n_node

    root.left = e_node
    root.right = t_node
  end

  context 'when morse code' do
    it 'has nil root value' do
      expect(binary_tree.root.value).to be_nil
    end
  end

  describe '#find' do
    let(:morse_code) { '.' }

    context 'when .' do
      it 'is E' do
        expect(binary_tree.find(morse_code)).to eq('E')
      end
    end

    context 'when -' do
      let(:morse_code) { '-' }

      it 'is T' do
        expect(binary_tree.find(morse_code)).to eq('T')
      end
    end

    context 'when ..' do
      let(:morse_code) { '..' }

      it 'is I' do
        expect(binary_tree.find(morse_code)).to eq('I')
      end
    end

    context 'when ...' do
      let(:morse_code) { '...' }

      it 'is I' do
        expect(binary_tree.find(morse_code)).to eq('S')
      end
    end

    context 'when --' do
      let(:morse_code) { '--' }

      it 'is T' do
        expect(binary_tree.find(morse_code)).to eq('M')
      end
    end

    context 'when ---' do
      let(:morse_code) { '---' }

      it 'is T' do
        expect(binary_tree.find(morse_code)).to eq('O')
      end
    end

    context 'when .-' do
      let(:morse_code) { '.-' }

      it 'is A' do
        expect(binary_tree.find(morse_code)).to eq('A')
      end
    end

    context 'when -.' do
      let(:morse_code) { '-.' }

      it 'is N' do
        expect(binary_tree.find(morse_code)).to eq('N')
      end
    end

  end

  describe '#transverse' do
    let(:binary_tree) { described_class.new() }
    let(:sorted_array) { [] }

    before do
      binary_tree.insert(7)
      binary_tree.insert(9)
      binary_tree.insert(3)
      binary_tree.insert(5)
      binary_tree.insert(13)
      binary_tree.insert(11)

    end

    context 'when block given' do
      it 'transverses at node' do
        binary_tree.traverse { |x| sorted_array << x }

        expect(sorted_array).to eq([3, 5, 7, 9, 11, 13])
      end
    end
  end

  describe '#insert' do
    let(:binary_tree) { described_class.new() }

    before { binary_tree.insert(7) }

    context 'when insert integer value' do
      it 'has root value equal to 7' do
        expect(binary_tree.root.value).to eq(7)
      end
    end

    context 'when insert number less than root value' do
      before { binary_tree.insert(5) }

      it 'has left node value equal to 5' do
        expect(binary_tree.root.left.value).to eq(5)
      end

      context 'when insert number less than the previous one' do
        before { binary_tree.insert(3) }

        it 'has left.left node value equal to 3' do
          expect(binary_tree.root.left.left.value).to eq(3)
        end
      end
    end

    context 'when insert number greater than root value' do
      before { binary_tree.insert(9) }

      it 'has right node value equal to 9' do
        expect(binary_tree.root.right.value).to eq(9)
      end

      context 'when insert number greater than the previous one' do
        before { binary_tree.insert(11) }

        it 'has right.right node value equal to 11' do
          expect(binary_tree.root.right.right.value).to eq(11)
        end
      end
    end
  end
end
