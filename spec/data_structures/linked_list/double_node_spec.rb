require 'spec_helper'

RSpec.describe LinkedList::DoubleNode do
	let(:a_value){'A'}
	let(:b_value){'B'}

	describe '#new' do
		context 'with argument' do
			it 'is truthy' do
				expect(described_class.new(a_value)).to be_truthy
			end
		end

		context 'without arguments' do
			it 'is trhuthy' do
				expect(described_class.new).to be_truthy
			end
		end
	end

	describe '#value' do
		context 'with value' do
			it 'gets value' do
				node = described_class.new(a_value)

				expect(node.value).to eq(a_value)
			end
		end

		context 'without value' do
			it 'has value nil' do
				node = described_class.new
				expect(node.value).to be_nil
			end
		end
	end

  describe '#previous_node' do
		let(:node){ described_class.new }
    let(:previous_value){ 'Previous Value' }
    let(:previous_node) { described_class.new(previous_value) }

		it 'is nil by default' do
			expect(node.previous_node).to be_nil
		end

		it 'sets and gets previous_node' do
			node.previous_node = previous_node

			expect(node.previous_node).to eq(previous_node)
		end
	end

  describe '#next_node' do
		let(:node){ described_class.new }
    let(:next_value){ 'Next Value' }
    let(:next_node) { described_class.new(next_value) }

		it 'is nil by default' do
			expect(node.next_node).to be_nil
		end

		it 'sets and gets next_node' do
			node.next_node = next_node

			expect(node.next_node).to eq(next_node)
		end
	end
end
