

require './Functions/SupportFunctions/errorMessages.rb'         


#################### Tests on Data Category Function ######################

describe "#error" do
  it "error 1 working correctly" do
    expect( error(1) ).to eq "The conversion request you have submitted for those data types is not on offer at present"
  end

  it "error 2 working correctly" do
    expect( error(2) ).to eq "Error: Please check the category of conversion you wish to make, valid options are - Customer, Product and Transaction"
  end

  it "error 3 working correctly" do
    expect( error(3) ).to eq "Error: Either target import or export file is invalid, please check that file exists and path is correct"
  end

  it "error 4 working correctly" do
    expect( error(4) ).to eq "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
  end

  it "error 5 working correctly" do
    expect( error(5) ).to eq "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
  end

  it "error 6 working correctly" do
    expect( error(6) ).to eq "Error: The system is not currently able to convert data relating to Customers"
  end

  it "error 7 working correctly" do
    expect( error(7) ).to eq "Error: The system is not currently able to convert data relating to Transactions"
  end
  
end