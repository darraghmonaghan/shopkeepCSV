
require './Functions/Product/CSVtoJSON.rb' 

######################      Data Category Function       ##########################

def product_category(import_file, export_file, input_format, output_format)

	if input_format == 'csv' && output_format == 'json'
		product_CSV_to_JSON(import_file, export_file)
		return 200 ## for testing purposes
	else
		return error(1)
	end

end