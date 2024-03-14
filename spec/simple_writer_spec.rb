RSpec.describe SimpleWriter do
  subject(:simple_writer) { described_class.new(path_to_file) }

  after { File.delete(path_to_file) }

  let(:message) { "Akira Toriyama" }
  let(:path_to_file) { 'spec/tmp/simple_out.txt' }

  it 'writes simple text' do
    simple_writer.write_line(message)
    simple_writer.close

    expect(File.open(path_to_file).read).to eq(message + "\n")
  end
end