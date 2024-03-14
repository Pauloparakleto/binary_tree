RSpec.describe NumberingWriter do
  subject(:numbering_writer) { described_class.new(simple_writer) }

  after { File.delete(path_to_file) }

  let(:simple_writer) { SimpleWriter.new(path_to_file) }
  let(:message) { "Akira Toryama" }
  let(:path_to_file) { 'spec/tmp/simple_out.txt' }

  it 'delegates writes to simple text' do
    numbering_writer.write_line(message)
    numbering_writer.close

    expect(File.open(path_to_file).read).to eq("1: Akira Toryama\n")
  end
end