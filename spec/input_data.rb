
require "./importerExporter.rb"
require './Functions/SupportFunctions/supportFunctions.rb'         
require './Functions/Product/CSVtoJSON.rb'    


describe "#check_input_data" do
  it "throws an error if target import file is invalid / does not exist" do
    expect( check_input_data('Transaction', 123, './example.csv', 'CSV', 'JSON') ).to eq -100
    expect( check_input_data('Transaction', './thisFileDoesNotExist.csv', "'./example.csv'", 'CSV', 'JSON') ).to eq -100
    expect( check_input_data('Product', './example.csv', './example.csv', 'CSV', 'JSON') ).to eq 200
  end

  it "throws an error if target export file is invalid / does not exist" do
    expect( check_input_data("Transaction", './example.csv', 123, 'CSV', 'JSON') ).to eq -100
    expect( check_input_data("Customer", './example.csv', './thisFileDoesNotExist.csv', 'CSV', 'JSON') ).to eq -100 
    expect( check_input_data('Product', './example.csv', './example.csv', 'CSV', 'JSON') ).to eq 200
  end

  it "throws an error if format of import data is invalid" do
    expect( check_input_data('Product', './example.csv', './example.csv', 'Pizza', 'JSON') ).to eq -100
    expect( check_input_data('Product', './example.csv', './example.csv', 'pizza', 'JSON') ).to eq -100    
    expect( check_input_data('Product', './example.csv', './example.csv', 'CSV', 'JSON') ).to eq 200
    expect( check_input_data('Product', './example.csv', './example.csv', 'cSv', 'JSON') ).to eq 200
  end

  it "throws an error if format of export data is invalid" do
    expect( check_input_data('Product', './example.csv', './example.csv', 'CSV', 'Pizza') ).to eq -100
    expect( check_input_data('Product', './example.csv', './example.csv', 'JSON', 'piZZa') ).to eq -100    
    expect( check_input_data('Product', './example.csv', './example.csv', 'CSV', 'JsoN') ).to eq 200
    expect( check_input_data('Product', './example.csv', './example.csv', 'JSON', 'xMl') ).to eq 200
  end
end