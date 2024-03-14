RSpec.describe WriterDecorator do
  subject(:writer_decorator) { described_class.new(simple_writer) }

  after { File.delete(path_to_file) }

  let(:simple_writer) { SimpleWriter.new(path_to_file) }
  let(:message) { "Akira Toryama" }
  let(:path_to_file) { 'spec/tmp/simple_out.txt' }

  it 'delegates writes to simple text' do
    writer_decorator.write_line(message)
    writer_decorator.close

    expect(File.open(path_to_file).read).to eq(message + "\n")
  end
end