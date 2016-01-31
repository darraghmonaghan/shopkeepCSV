
require './functions/support_functions/error_messages.rb'
require './functions/support_functions/product_category.rb' 
require './functions/support_functions/support_functions.rb' 

#######################      Master Function to Determine appropriate Data Category function       ##########################

def check_input_data(data_category, import_file, export_file)
    category = description_formatting(data_category.to_s).downcase
	
    import_file_checked = File.file?(import_file.to_s)
	export_file_checked = File.file?(export_file.to_s)

    import_file_format = file_format(import_file.to_s)
    export_file_format = file_format(export_file.to_s)

	if import_file_checked == false || export_file_checked == false
    	return error(3)

	elsif import_file_format != 'csv' && import_file_format != 'xml' && import_file_format != 'json'
    	return error(5)

	elsif export_file_format != 'csv' && export_file_format != 'xml' && export_file_format != 'json'
    	return error(4)
	end


	### Filtering the conversion request based on Conversion Category ###
    if category == 'customer' 
    	return error(6)

    elsif category == 'transaction'
    	return error(7)

    elsif category == 'product'
    	product_category(import_file, export_file, import_file_format, export_file_format)
    	return 200 ### for testing purposes
    else
		return error(2)
    end
end
