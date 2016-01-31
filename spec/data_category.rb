
require './Functions/SupportFunctions/productCategory.rb'         
require './Functions/SupportFunctions/errorMessages.rb' 

#################### Tests on Data Category Function ######################

describe "#product_category" do
  it "throws an error if import data format is invalid" do
    expect( product_category('./README.md', './README.md', 'CSV', 'json') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
    expect( product_category('./README.md', './README.md', 'pizza', 'json') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
    expect( product_category('./README.md', './README.md', 'xml', 'json') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
    expect( product_category('./README.md', './README.md', 'json', 'json') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
  end

  it "throws an error if export data format is invalid" do
    expect( product_category('./README.md', './README.md', 'csv', 'JSon') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
    expect( product_category('./README.md', './README.md', 'csv', 'xml') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
    expect( product_category('./README.md', './README.md', 'csv', 'csv') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
    expect( product_category('./README.md', './README.md', 'csv', 'pizza') ).to eq "The conversion request you have submitted for those data types is not on offer at present"
  end

end