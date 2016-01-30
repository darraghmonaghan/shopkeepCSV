
require "./importerExporter.rb"
require './Functions/SupportFunctions/supportFunctions.rb'         
require './Functions/Product/CSVtoJSON.rb'    


describe "#check_input_data" do
  it "throws an error if target import file is invalid / does not exist" do
    expect( check_input_data('Transaction', 123, './README.md', 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data('Transaction', true, './README.md', 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data('Transaction', false, './README.md', 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data('Transaction', './thisFileDoesNotExist.csv', './README.md', 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
  end

  it "throws an error if target export file is invalid / does not exist" do
    expect( check_input_data("Transaction", './README.md', 123, 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data("Transaction", './README.md', true, 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data("Transaction", './README.md', false, 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data("Customer", './README.md', './thisFileDoesNotExist.csv', 'CSV', 'JSON') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct" 
  end

  it "throws an error if format of import data is invalid" do
    expect( check_input_data('Product', './README.md', './README.md', 'Pizza', 'JSON') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './README.md', 'pizza', 'JSON') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."   
    expect( check_input_data('Product', './README.md', './README.md', 123, 'JSON') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './README.md', true, 'JSON') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './README.md', false, 'JSON') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."    
  end

  it "throws an error if format of export data is invalid" do
    expect( check_input_data('Product', './README.md', './README.md', 'CSV', 'Pizza') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './README.md', 'JSON', 'piZZa') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'." 
    expect( check_input_data('Product', './README.md', './README.md', 'CSV', 123) ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './README.md', 'CSV', true) ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './README.md', 'CSV', false) ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."      
  end
end