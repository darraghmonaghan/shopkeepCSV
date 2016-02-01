require 'csv'                       							## do not touch
require 'json'                      							## do not touch
require './functions/support_functions/check_input_data.rb'   	## do not touch

##############################################################################################
#################################       Instructions         ################################# 
##############################################################################################

### Conversion Type           Options: 'Product' (Eventually "Customer" and "Transaction" will be added)
### Target Import File        Enter target import file path name - Ensure target document exists
### Target Export File        Enter target export file path name - Ensure target document exists




##############################################################################################
########################       Variables Required for Conversion     ######################### 
##############################################################################################

conversion_type = 'Product'                     
import_file = './target_import_file.csv'        
export_file = './target_export_file.json'                        


##############################################################################################
###############################          Initiate Conversion         ######################### 
##############################################################################################

check_input_data(conversion_type, import_file, export_file)



