RSpec.describe TimeStampingWriter do
  subject(:time_stamping_writer) { described_class.new(simple_writer) }

  before { allow(Time).to receive(:now) { time_new } }
  after { File.delete(path_to_file) }

  let(:time_new) { Time.new(1955, 4, 5) }
  let(:simple_writer) { SimpleWriter.new(path_to_file) }
  let(:message) { "Akira Toriyama" }
  let(:path_to_file) { 'spec/tmp/simple_out.txt' }

  it 'delegates writes to simple text' do
    time_stamping_writer.write_line(message)
    time_stamping_writer.close

    expect(File.open(path_to_file).read).to eq("1955-04-05 00:00:00 -0300: Akira Toriyama\n")
  end
end