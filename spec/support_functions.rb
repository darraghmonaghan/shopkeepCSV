
require './functions/support_functions/support_functions.rb'         

describe "#check_formatting" do
  it "Checks to ensure data is intended to be a currency, not rogue entries" do
    expect( check_formatting(124567) ).to eq nil
    expect( check_formatting(0000111223) ).to eq nil 
    expect( check_formatting(0.00111223) ).to eq nil 
  end
end

describe "#file_format" do
  it "Returns the file format in letter terms only" do
    expect( file_format("./test.jpg") ).to eq "jpg"
    expect( file_format("./test.xml") ).to eq "xml"
    expect( file_format("./test.json") ).to eq "json"
    expect( file_format("../test/test/test.json") ).to eq "json"  
  end
end

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



