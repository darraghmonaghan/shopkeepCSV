require 'csv'                       							## do not touch
require 'json'                      							## do not touch
require './Functions/SupportFunctions/supportFunctions.rb'        	## do not touch
require './Functions/Product/CSVtoJSON.rb'        					## do not touch

########################       Variables required to start conversion     #################### 

conversion_type = 'Product'                     ##   OPTIONS: 'Product' (Eventually "Customer" and "Transaction" will be added)
import_file = './example.csv'                   ##   1) Ensure target docutment exists, 2) Ensure correct path
export_file = './exportedData.json'				##   variable of filename JSON to be exported to - ensure correct path
input_format = 'CSV'                            ##   OPTIONS:  'CSV'    (Eventually 'XML', 'JSON')
output_format = 'JSON'                          ##   OPTIONS:  'JSON'   (Eventually 'XML', 'CSV')



#######################         Initiate Conversion  - DO NOT TOUCH      ##########################

input1 = conversion_type.to_s                     ##   OPTIONS: 'Product' (Eventually "Customer" and "Transaction" will be added)
input2 = import_file.to_s                  ##   1) Ensure target docutment exists, 2) Ensure correct path
input3 = export_file.to_s				##   variable of filename JSON to be exported to - ensure correct path
input4 = input_format.to_s                            ##   OPTIONS:  'CSV'    (Eventually 'XML', 'JSON')
input5 = output_format.to_s                          ##   OPTIONS:  'JSON'   (Eventually 'XML', 'CSV')




check_input_data(input1, input2, input3, input4, input5)









