require 'spec_helper'
require 'axlsx'
require 'roo'

describe 'Writing' do
  it 'writes a correct file' do
    filepath = 'templates/correct.xlsx'
    notebook = "676-1-111"

    Axlsx::Package.new do |p|
      spacer = ""

      product = "Amichin"
      analyst = "S. Mallon"
      limit = 1

      p.workbook.add_worksheet(:name => notebook) do |sheet|
        sheet.add_row ["Product", product, spacer, "Analyst", analyst]
        sheet.add_row ["Limit", limit, spacer, "Notebook", notebook]
      end

      p.serialize(filepath)
    end

    t = Roo::Spreadsheet.open(filepath)
    expect(t.sheets.first).to eq(notebook)
  end

  it 'writes an incorrect file' do
    filepath = 'templates/incorrect.xlsx'
    notebook = "676-1-111"
    other_notebook = "123-1-111"

    Axlsx::Package.new do |p|
      spacer = ""

      product = "Amichin"
      analyst = "S. Mallon"
      limit = 1

      p.workbook.add_worksheet(:name => notebook) do |sheet|
        sheet.add_row ["Product", product, spacer, "Analyst", analyst]
        sheet.add_row ["Limit", limit, spacer, "Notebook", other_notebook]
      end

      p.serialize(filepath)
    end

    t = Roo::Spreadsheet.open(filepath)
    expect(t.sheets.first).to eq(notebook)
    expect(t.cell(2, 5)).to eq(other_notebook)
  end
end
