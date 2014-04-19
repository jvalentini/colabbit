#!/usr/bin/env ruby

require 'axlsx'

def assert_contains_keys?(hash, keys)
  raise "Missing required keys" unless keys.all? { |s| hash.key? s }
end

class Writer
  def self.create(options)
    assert_contains_keys?(options, [:product, :analyst, :limit, :notebook])

    spacer = ""
    product = options[:product]
    analyst = options[:analyst]
    limit = options[:limit]
    notebook = options[:notebook]
    filepath = options[:filepath]

    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(:name => notebook) do |sheet|
        sheet.add_row ["Product", product, spacer, "Analyst", analyst]
        sheet.add_row ["Limit", limit, spacer, "Notebook", notebook]
      end

      p.serialize(filepath)
    end
  end
end
