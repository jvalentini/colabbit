require 'spec_helper'
require 'axlsx'

describe 'Writing' do
  it 'writes a correct file' do
    Axlsx::Package.new do |p|
      spacer = ""

      product = "Amichin"
      analyst = "S. Mallon"
      limit = 1
      notebook = "676-1-111"

      p.workbook.add_worksheet(:name => notebook) do |sheet|
        sheet.add_row ["Product", product, spacer, "Analyst", analyst]
        sheet.add_row ["Limit", limit, spacer, "Notebook", notebook]
      end

      p.serialize('templates/correct.xlsx')
    end
  end

  it 'writes an incorrect file' do
    Axlsx::Package.new do |p|
      spacer = ""

      product = "Amichin"
      analyst = "S. Mallon"
      limit = 1
      notebook = "676-1-111"

      other_notebook = "123-1-111"

      p.workbook.add_worksheet(:name => notebook) do |sheet|
        sheet.add_row ["Product", product, spacer, "Analyst", analyst]
        sheet.add_row ["Limit", limit, spacer, "Notebook", other_notebook]
      end

      p.serialize('templates/incorrect.xlsx')
    end
  end
end
