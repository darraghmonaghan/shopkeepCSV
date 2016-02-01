

require './functions/support_functions/check_input_data.rb'           


describe "#check_input_data" do
  it "throws an error if target import file is invalid / does not exist" do
    expect( check_input_data('Pizza', './target_import_file.csv', './target_export_file.json') ).to eq "Error: Please check the category of conversion you wish to make, valid options are - Customer, Product and Transaction"
    expect( check_input_data(true, './target_import_file.csv', './target_export_file.json') ).to eq "Error: Please check the category of conversion you wish to make, valid options are - Customer, Product and Transaction"
    expect( check_input_data(false, './target_import_file.csv', './target_export_file.json') ).to eq "Error: Please check the category of conversion you wish to make, valid options are - Customer, Product and Transaction"
    expect( check_input_data(123, './target_import_file.csv', './target_export_file.json') ).to eq "Error: Please check the category of conversion you wish to make, valid options are - Customer, Product and Transaction"
  end

  it "throws an error if target import file & target export file are of the same format" do
    expect( check_input_data('Customer', './target_import_file.csv', './target_import_file.csv') ).to eq "The format of target import file and target export file match, please reconsider your conversion request"
    expect( check_input_data('Transaction', './target_import_file.csv', './target_import_file.csv') ).to eq "The format of target import file and target export file match, please reconsider your conversion request"
  end

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
end