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

  describe '#possibilities' do
    context 'when ?' do
      let(:morse_code) { '?' }

      it 'can be E or T' do
        expect(binary_tree.possibilities(morse_code)).to eq(%w[E T])
      end
    end
  end
end
