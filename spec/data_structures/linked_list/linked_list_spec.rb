require 'spec_helper'

RSpec.describe LinkedList do
 describe '#new' do
   let(:head_node){ LinkedList::Node.new('A head value') }
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
end

