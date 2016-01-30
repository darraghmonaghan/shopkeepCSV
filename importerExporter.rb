require 'csv'                       							## do not touch
require 'json'                      							## do not touch
require './Functions/SupportFunctions/supportFunctions.rb'        	## do not touch
require './Functions/Product/CSVtoJSON.rb'        					## do not touch

########################       Variables required to start conversion     #################### 

conversion_type = 'product'                     ##   OPTIONS: 'Product' (Eventually "Customer" and "Transaction" will be added)
import_file = './example.csv'                   ##   1) Ensure target docutment exists, 2) Ensure correct path
export_file = './exportedData.json'				##   variable of filename JSON to be exported to - ensure correct path
input_format = 'CSV'                            ##   OPTIONS:  'CSV'    (Eventually 'XML', 'JSON')
output_format = 'json'                          ##   OPTIONS:  'JSON'   (Eventually 'XML', 'CSV')



#######################         Initiate Conversion  - DO NOT TOUCH      ##########################

check_input_data(conversion_type, import_file, export_file, input_format, output_format)



