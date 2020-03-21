# frozen_string_literal: true

require 'junara_export_csv/version'
require 'csv'
module JunaraExportCsv
  # usage
  # JunaraExportCsv.run([[1, 2, 3], [3, 4, 5]], header: ['1st', '2nd', '3rd']) { |r| [r[0], r[1], r[2]] }
  def self.run(records, header: [], filename: nil)
    data = read(records, header) { |r| yield(r) }
    filename ||= default_filename
    export(filename, data)
    filename
  end

  def self.read(records, header)
    CSV.generate do |csv|
      csv << header if header.is_a?(Array) && !header.empty?
      records.each do |r|
        csv << yield(r)
      end
    end
  end

  def self.export(filename, data)
    File.open(filename, 'w') do |f|
      f.write(data)
    end
  end

  def self.default_filename
    "./#{Time.now}.csv"
  end

  private_class_method(:default_filename, :export, :read)
end
