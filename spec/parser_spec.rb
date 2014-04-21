require 'spec_helper'
require 'roo'

describe 'Parsing' do
  it 'parses an excel file' do
    pending
    t = Roo::Spreadsheet.open("templates/correct.xlsx")
    expect(t.sheets.first).to eq("676-1-111")
  end
end
