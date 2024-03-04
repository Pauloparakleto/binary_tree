# frozen_string_literal: true

RSpec.describe BinarySearch do
  let(:sorted_array) { [1, 3, 5, 7, 9, 11] }

  describe '#search' do
    context 'when found' do

      it 'finds index 5' do
        expect(described_class.new(sorted_array, 11).search).to eq(5)
      end

      it 'finds index 0' do
        expect(described_class.new(sorted_array, 1).search).to eq(0)
      end

      it 'finds index 3' do
        expect(described_class.new(sorted_array, 7).search).to eq(3)
      end

      it 'finds index 2' do
        expect(described_class.new(sorted_array, 5).search).to eq(2)
      end
    end

    context 'when not found' do
      it 'returns -1' do
        expect(described_class.new(sorted_array, 99).search).to eq(-1)
      end
    end
  end

  describe '#recursive_search' do
    context 'when found' do

      it 'finds index 5' do
        expect(described_class.new(sorted_array, 11).recursive_search).to eq(5)
      end

      it 'finds index 0' do
        expect(described_class.new(sorted_array, 1).recursive_search).to eq(0)
      end

      it 'finds index 3' do
        expect(described_class.new(sorted_array, 7).recursive_search).to eq(3)
      end

      it 'finds index 2' do
        expect(described_class.new(sorted_array, 5).recursive_search).to eq(2)
      end
    end

    context 'when not found' do
      it 'returns -1' do
        expect(described_class.new(sorted_array, 99).recursive_search).to eq(-1)
      end
    end
  end
end