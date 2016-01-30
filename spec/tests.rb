
require "./importerExporter.rb"
require './Functions/SupportFunctions/supportFunctions.rb'         
require './Functions/Product/CSVtoJSON.rb'    


#################### Tests on Master Function ###################### 

describe "#check_input_data" do
  # it "throws an error if category of data conversion is invalid - not Product, Customer or Transaction" do
  #   # expect( check_input_data("121", './example.csv', './example.csv', 'CSV', 'JSON') ).to eq -100
  #   # expect( check_input_data("Pizza", "'./example.csv'", "'./example.csv'", 'CSV', 'JSON') ).to eq -100
  #   # expect( check_input_data("!!%%#@@}", "'./example.csv'", "'./example.csv'", 'CSV', 'JSON') ).to eq -100
  #   # expect( check_input_data(121, "'./example.csv'", "'./example.csv'", 'CSV', 'JSON') ).to eq -100
  #   # expect( check_input_data('product', 'tests.rb', 'tests.rb', 'csv', 'json') ).to eq 200
  #   # expect( check_input_data('Customer', 'example.csv', 'example.csv', 'CSV', 'JSON') ).to eq 200 
  #   # expect( check_input_data('Transaction', 'example.csv', 'example.csv', 'CSV', 'JSON') ).to eq 200
  # end

  it "throws an error if target import file is invalid / does not exist" do
    # expect( check_input_data('Transaction', false, "'./example.csv'", 'CSV', 'JSON') ).to eq -100
    # expect( check_input_data('Transaction', true, "'./example.csv'", 'CSV', 'JSON') ).to eq -100
    expect( check_input_data('Transaction', 123, './example.csv', 'CSV', 'JSON') ).to eq -100
    expect( check_input_data('Transaction', './thisFileDoesNotExist.csv', "'./example.csv'", 'CSV', 'JSON') ).to eq -100
    expect( check_input_data('Product', './example.csv', './example.csv', 'CSV', 'JSON') ).to eq 200
  end

  it "throws an error if target export file is invalid / does not exist" do
    # expect( check_input_data("Product", "'./example.csv'", false, 'CSV', 'JSON') ).to eq -100
    # expect( check_input_data("Product", "'./example.csv'", true, 'CSV', 'JSON') ).to eq -100
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


#################### Tests on Data Category Function ######################

# describe "#product_category" do
#   it "throws an error if import data format is invalid" do
#     expect( product_category("'./example.csv'", "'./example.csv'", 123, 'JSON') ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", 'Pizza', 'JSON') ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", -123, 'JSON') ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", 'CSV', 'JSON') ).to eq 200
#     expect( product_category("'./example.csv'", "'./example.csv'", 'cSv', 'JSON') ).to eq 200 
#     expect( product_category("'./example.csv'", "'./example.csv'", 'xML', 'JSON') ).to eq 200
#   end

#   it "throws an error if export data format is invalid" do
#     expect( product_category("'./example.csv'", "'./example.csv'", "CSV", 123) ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", 'JSON', -123) ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", "XmL", 'Pizza') ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", 'CSV', 'JsOn') ).to eq 200
#     expect( product_category("'./example.csv'", "'./example.csv'", 'cSv', 'xMl') ).to eq 200 
#     expect( product_category("'./example.csv'", "'./example.csv'", 'xML', 'cSv') ).to eq 200
#   end

#   it "throws an error if target import file is invalid / does not exist" do
#     expect( product_category("'./ThisDoesntExist.csv'", "'./example.csv'", "CSV", 'JSON') ).to eq -100
#     expect( product_category(123, "'./example.csv'", 'JSON', 'XML') ).to eq -100
#     expect( product_category(-123, "'./example.csv'", "XmL", 'Pizza') ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", 'CSV', 'JsOn') ).to eq 200
#   end

#   it "throws an error if target export file is invalid / does not exist" do
#     expect( product_category("'./example.csv'", 123, "CSV", 'JSON') ).to eq -100
#     expect( product_category("'./example.csv'", "'./ThisDoesntExist.json'", 'JSON', 'XML') ).to eq -100
#     expect( product_category("'./example.csv'", -123, "XmL", 'Pizza') ).to eq -100
#     expect( product_category("'./example.csv'", "'./example.csv'", 'CSV', 'JsOn') ).to eq 200
#   end
# end

# describe "#product_category" do
#   it "throws an error if import file does not exist / is invalid" do
#     expect( product_category(false, "'./example.csv'", 'CSV', 'JSON') ).to eq -100
#     expect( product_category("'./ThisDoesntExist.csv'", "'./example.csv'", 'CSV', 'JSON') ).to eq -100
#     expect( product_category(12345, "'./example.csv'", 'CSV', 'JSON') ).to eq -100
#   end

#   it "throws an error if export file does not exist / is invalid" do
#     expect( product_category("'./example.csv'", false, 'CSV', 'JSON') ).to eq -100
#     expect( product_category("'./example.csv'", "'./ThisDoesntExist.csv'", 'CSV', 'JSON') ).to eq -100
#     expect( product_category("'./example.csv'", 12345, 'CSV', 'JSON') ).to eq -100
#   end
# end



#################### Tests on Supporting Functions ######################


describe "#string_to_integer" do
  it "converts a string to a datatype of integer" do
    expect( string_to_integer("12345") ).to eq 12345
    expect( string_to_integer("12") ).to eq 12
  end
end

describe "#description_formatting" do
  it "Cleans up the string description of a product, capitalizing each word" do
    expect( description_formatting("This is not 14 Tidy") ).to eq "This Is Not Tidy"
    expect( description_formatting("12 THIS is Ugly 12") ).to eq "This Is Ugly"
    expect( description_formatting("12232344 thIS STRINg iS so UglY") ).to eq "This String Is So Ugly"
  end
end


describe "#currency_to_integer" do
  it "Changes the string data input, with currency formatting, to integer with 2 decimal places" do
    expect( currency_to_integer("$14.00") ).to eq 14.00
    expect( currency_to_integer("$04.05") ).to eq 4.05
    expect( currency_to_integer("$000.01") ).to eq 0.01
    expect( currency_to_integer("$1") ).to eq 1.00
    expect( currency_to_integer("$1,000,000,000") ).to eq 1000000000.00    
  end
end


describe "#modifier_object" do
  it "Accepts upto 6 parameters, Titleizing all text, and converting numbers to Integers" do
    expect( modifier_object("Small", "-$0.25", "Medium", "$0.00", "Large", "$0.30") ).to eq [{ "name": "Small", "price": -0.25},{ "name": "Medium", "price": 0.00},{ "name": "Large", "price": 0.30}]
    expect( modifier_object("SmALL", "-$0.25", "MeDIUM", "$0.00", "lARGe", "$0.30") ).to eq [{ "name": "Small", "price": -0.25},{ "name": "Medium", "price": 0.00},{ "name": "Large", "price": 0.30}]   
  end    

  it "Allows longer, awkward strings, and reformats them accordingly" do
    expect( modifier_object("CreaM CheEse", "$1.00", nil, nil, nil, nil) ).to eq [{ "name": "Cream Cheese", "price": 1.00}]
    expect( modifier_object("jeLLy", "$10.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": 10.00}]
  end

  it "Only accepts modifiers if the Name field is provided" do
    expect( modifier_object("Cream Cheese", "$10.00", nil ,'$20.00', nil, nil) ).to eq [{ "name": "Cream Cheese", "price": 10.00}]
    expect( modifier_object(nil, "$10.00", nil ,'$20.00', nil, nil) ).to eq []
    expect( modifier_object(nil, "$10.00", nil, nil, nil, nil) ).to eq []
    expect( modifier_object(nil, "$10.00", nil, nil, nil, nil) ).to eq []
    expect( modifier_object('SmALL', "$10.00", 'mEDium','$20.00', nil, '$30.00') ).to eq [{ "name": "Small", "price": 10.00},{ "name": "Medium", "price": 20.00}]
 	expect( modifier_object(nil, "$10.00", nil,'$20.00', nil, '$30.00') ).to eq []
  end

  it "Successfully and correctly reformats all currency amounts" do
    expect( modifier_object("Jelly", "$1,000,000.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": 1000000.00}]
    expect( modifier_object("Jelly", "$0,000,005.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": 5.00}]
    expect( modifier_object("Jelly", "$0000005.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": 5.00}]
    expect( modifier_object("Jelly", "$9000005.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": 9000005.00}]
  end

  it "Succesffully handles negative values" do
    expect( modifier_object("Jelly", "-$1,000,000.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": -1000000.00}]
    expect( modifier_object("Jelly", "$-1,000,000.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": -1000000.00}]
    expect( modifier_object("Jelly", "-$0,000,005.00", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": -5.00}]
    expect( modifier_object("Jelly", "-$8933.22", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": -8933.22}]
    expect( modifier_object("Jelly", "$-8933.22", nil, nil, nil, nil) ).to eq [{ "name": "Jelly", "price": -8933.22}]
  end
end



