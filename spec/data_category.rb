
require "./importerExporter.rb"
require './Functions/SupportFunctions/supportFunctions.rb'         
require './Functions/Product/CSVtoJSON.rb'    


#################### Tests on Data Category Function ######################

describe "#product_category" do
  it "throws an error if import data format is invalid" do
    expect( product_category('./README.md', './README.md', 'CSV', 'json') ).to eq -100
    expect( product_category('./README.md', './README.md', 'pizza', 'json') ).to eq -100
    expect( product_category('./README.md', './README.md', 'xml', 'json') ).to eq -100
    expect( product_category('./README.md', './README.md', 'json', 'json') ).to eq -100
    expect( product_category('./README.md', './README.md', 'csv', 'json') ).to eq 200
  end

  it "throws an error if export data format is invalid" do
    expect( product_category('./README.md', './README.md', 'csv', 'JSon') ).to eq -100
    expect( product_category('./README.md', './README.md', 'csv', 'xml') ).to eq -100
    expect( product_category('./README.md', './README.md', 'csv', 'csv') ).to eq -100
    expect( product_category('./README.md', './README.md', 'csv', 'pizza') ).to eq -100
    expect( product_category('./README.md', './README.md', 'csv', 'json') ).to eq 200
  end

end