

require './functions/support_functions/check_input_data.rb'           


describe "#check_input_data" do
  it "throws an error if target import file is invalid / does not exist" do
    expect( check_input_data('Transaction', 123, './README.md') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data('Transaction', true, './README.md') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data('Transaction', false, './README.md') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data('Transaction', './thisFileDoesNotExist.csv', './README.md') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
  end

  it "throws an error if target export file is invalid / does not exist" do
    expect( check_input_data("Transaction", './README.md', 123) ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data("Transaction", './README.md', true) ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data("Transaction", './README.md', false) ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
    expect( check_input_data("Customer", './README.md', './thisFileDoesNotExist.csv') ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct" 
  end

  it "throws an error if format of import data is invalid" do
    expect( check_input_data('Product', './target_export_file.json', './README.md') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './target_export_file.json', './README.md') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."   
    expect( check_input_data('Product', './target_export_file.json', './README.md') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './target_export_file.json', './README.md') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './target_export_file.json', './README.md') ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."    
  end

  it "throws an error if format of export data is invalid" do
    expect( check_input_data('Product', './README.md', './target_export_file.json') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './target_export_file.json') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'." 
    expect( check_input_data('Product', './README.md', './target_export_file.json') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './target_export_file.json') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
    expect( check_input_data('Product', './README.md', './target_export_file.json') ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."      
  end
end