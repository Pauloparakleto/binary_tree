require 'spec_helper'

RSpec.describe LinkedList::Node do
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
end