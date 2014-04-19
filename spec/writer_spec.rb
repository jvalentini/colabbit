require 'spec_helper'
require 'axlsx'
require 'roo'
require 'writer'

describe Writer do
  describe '.create' do
    it 'writes a correct file' do
      options = {
        product: 'Amichin',
        analyst: 'S. Mallon',
        limit: 1,
        notebook: '676-1-111',
        filepath: 'templates/correct.xlsx'
      }

      w = Writer.create(options)
      t = Roo::Spreadsheet.open(options[:filepath])
      expect(t.sheets.first).to eq(options[:notebook])
      expect(t.cell(2, 5)).to eq(options[:notebook])
    end

    it 'writes an incorrect file' do
      options = {
        product: 'Amichin',
        analyst: 'S. Mallon',
        limit: 1,
        notebook: '676-1-111',
        filepath: 'templates/incorrect.xlsx'
      }
      other_notebook = "123-1-111"

      w = Writer.create(options)
      t = Roo::Spreadsheet.open(options[:filepath])
      expect(t.sheets.first).to eq(options[:notebook])
      expect(t.cell(2, 5)).to_not eq(other_notebook)
    end
  end
end
