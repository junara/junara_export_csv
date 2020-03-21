# frozen_string_literal: true

require 'tempfile'
RSpec.describe JunaraExportCsv do
  it 'has a version number' do
    expect(JunaraExportCsv::VERSION).not_to be nil
  end
  describe '#run' do
    let(:subject) do
      described_class.run(rows, filename: filename, header: header) { |r| [r[0], r[1], r[2]] }
    end
    context 'with parameters' do
      let(:temp_out_file) { Tempfile.new('csv') }
      let(:rows) { [%w[a b c], %w[d e f]] }
      let(:filename) { temp_out_file.path }
      let(:header) { %w[1st 2nd 3rd] }
      after { temp_out_file.unlink }
      it 'export filename' do
        expect(subject).to eq temp_out_file.path
      end
      it 'export header' do
        subject
        lines = CSV.readlines(temp_out_file.path)
        expect(lines[0]).to eq header
      end
      it 'export data' do
        subject
        lines = CSV.readlines(temp_out_file.path)
        expect(lines[1]).to eq rows[0]
        expect(lines[2]).to eq rows[1]
      end
    end
  end
end
