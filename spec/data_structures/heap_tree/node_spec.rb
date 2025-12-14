require 'spec_helper'

RSpec.describe HeapTree::Node do
  it 'has parent nil' do
    root_node = described_class.new
    expect(root_node.left).to be_nil
    expect(root_node.right).to be_nil
    expect(root_node.parent).to be_nil
  end

  it 'sets and gets attributes' do
    root_node = described_class.new(2)
    left_node = described_class.new(4)
    right_node = described_class.new(6)

    root_node.left = left_node
    root_node.right = right_node
    right_node.parent = root_node
    left_node.parent = root_node


    expect(root_node.left.value).to eq(4)
    expect(root_node.right.value).to eq(6)
    expect(root_node.parent).to be_nil
    expect(root_node.left.parent.value).to eq(2)
    expect(root_node.right.parent.value).to eq(2)
  end

end
