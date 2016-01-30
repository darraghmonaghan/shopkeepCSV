
require "./importerExporter.rb"
require './Functions/SupportFunctions/supportFunctions.rb'         
require './Functions/Product/CSVtoJSON.rb'    


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


